<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
    <%@ page import = "ust.registrar.model.studentprocess.notification" %>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>OSA | Profile</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("osauser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}
notification notifs = new notification();
int totalTransfers = notifs.getOSATransactions(conn);
%>

<div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>OSA<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Osapage.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="OsaTransactions.jsp"><span class="glyphicon glyphicon-random"></span> Transactions
		<% if(totalTransfers>0){ %>
	        <span class="notification"><%
	        if(totalTransfers<=99){
			%>
			<%= totalTransfers %>
			<%
			}else{
	        %>
	        99+
	        <%} %></span>
		<%	} %>       
		</a></li>
    <li><a href="OsaApprovedTransactions.jsp"><span class="glyphicon glyphicon-ok-sign"></span> Approved Transactions</a></li>
    <li><a href="logout.jsp?userset=<%=getuser%>"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
  </ul>
</nav>
			</div>



		</div>

<div canvas="contain">
<div id="wrapper">

<header class="header-fixed">

	<div class="header-limiter">

		<h1>UNIVERSITY OF SANTO TOMAS</h1>

		<nav>
		
			<a>Shifting and Transferring System</a>
		</nav>

	</div>

</header>
<div class="topnav">
   <center>
   <a>
   <span style="font-size:30px;cursor:pointer;color: white; float:left" class="js-toggle-left-slidebar">&#9776;</span>
   
   PERSONAL INFORMATION
   </a>
   </center>
</div>
<%
    String returnsql = "SELECT * FROM osa WHERE userid = ?";
    try{
    PreparedStatement pst = conn.prepareStatement(returnsql);
    pst.setString(1, getuser);
    ResultSet usercontent = pst.executeQuery();
     
    
    %>          
   <div id="content">
    <div class="container">
                 <% while(usercontent.next()) { %>
                 
<div class="profile">

	<div class="wrap">
	
		<div class="profile-main">
		<fieldset>
		<legend>
		<p>USER ID: <%=usercontent.getString("userid") %></p>
		</legend>
		</fieldset>
			<div class="profile-pic wthree">
					
				<img src="Images/dp.png" alt="">
				<h2><%=usercontent.getString("last_name")%>, <%=usercontent.getString("first_name")%></h2>
			</div>
			<div class="w3-message">
			<a>Type</a>
				<h5><%=usercontent.getString("type") %></h5>
				<br>
				<center>
				<button class="btn btn-warning" data-target="#changepassword" data-toggle="modal" href="javascript:;">
				<span class="glyphicon glyphicon-pencil"></span> Change Password
				</button>
				</center>
			<div class="w3ls-touch">
			</div>
			</div>
			            <%
               }
            }   catch(Exception e) {
            	e.printStackTrace();
            }         
            %>
		</div>
  </div>

</div>
</div>
</div>
</div>
					</div>
 
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>
<div class="modal fade" role="dialog" id="changepassword">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
          <div class="modal-header" style="background-color:#EFB652">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-lock"></span> Modify password</h4>
          </div>
          <form onsubmit ="return false" id = "changepasswordform">
          <div class="modal-body">
      
           <input type="hidden" name="getuser" value="<%=getuser%>">
          <h4>Enter your new password</h4>
          <br>
             <center>
             
              <table class="table">
                <tr> 
                   <td>Password: </td>
                   <td><input type="password" class="form-control" id="password1" name="change_password" required></td>
                </tr>
                   <tr> 
                   <td>Confirm Password: </td>
                   <td><input type="password" class="form-control" id="passwordconfirm" name="change_retypepassword"  required></td>
                </tr>
              </table>
           
             </center>
          </div>
          <div class="modal-footer">
          <button type="button" onclick = "changePassword()" class="btn btn-warning btn-md" value="Submit">Change Password</button>          
          </div>
             </form>
      </div>
    </div>
 </div>
<script>
function id(x) {
	return document.getElementById(x);
}
function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("main").style.marginLeft = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
function changePassword() {
	var pw1 = id("password1").value;
	var pw2 = id("passwordconfirm").value;
  if(pw1.length > 0 && pw2.length > 0) {	
	if(pw1 == pw2) {
		id("changepasswordform").action = "EditPassword";
		id("changepasswordform").method = "post";
		id("changepasswordform").submit();
	}
	else {
		alert('Passwords are not the same!');
	}
  }
  else {
	  alert('Please input the fields.');
  }
}

</script>
          <div class="footer"></div>
</body>
</html>