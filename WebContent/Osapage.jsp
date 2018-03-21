<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
        <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/style.css"type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("index.html");
}	
%>

<div off-canvas="slidebar-1 left reveal">
		<div>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>OSA<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Osapage.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="OsaTransactions.jsp"><span class="glyphicon glyphicon-random"></span> Transactions</a></li>
   
    <li><a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
  </ul>
</nav>
			</div>



		</div>
<div canvas="contain">
<div id="main">
<div id="wrapper">


<div class="header">
 <a class="logo" >
 <span style="font-size:50px;margin-top:-20px;cursor:pointer;color: black" class="js-toggle-left-slidebar">&#9776;</span>
 UNIVERSITY OF SANTO TOMAS</a>
  <div class="header-right">  
    <a class="active">Shifting and Transferring System</a>
  </div>
</div>
<div class="topnav">
  <a href="#">MyUSTe</a>
  <a href="#">Programs</a>
  <a href="#" >Guidelines</a>
</div>


<br>
            <p><i>PROFILE INFORMATION</i></p>
</div>
     <%
    String returnsql = "SELECT * FROM osa WHERE userid = ?";
    try{
    PreparedStatement pst = conn.prepareStatement(returnsql);
    pst.setString(1, getuser);
    ResultSet usercontent = pst.executeQuery();
     
    
    %>
    <br>

      <div class="container">
          <fieldset>
           
            <center>
            <div class="table-responsive">
            <% while(usercontent.next()) { %>
            <table class="table">
               <tr>
                 <td>Name</td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("last_name") %>, <%=usercontent.getString("first_name") %> <%=usercontent.getString("middle_name") %>" readonly class="form-control"></td>
                 <td rowspan = "3"><center><img src="Images/dp.png" style="width:50%; height:50%;" class="responsive"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("userid")%>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("type") %>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("gender") %>" class="form-control" readonly></td>
                 <td><center><button type="button" onclick = "editProfile()" id="editprofile" class="btn btn-warning btn-sm">
                 <span class="glyphicon glyphicon-pencil"></span> &nbsp Edit Profile
                 </button>
                 <button type="button" onclick = "cancelEdit()" id="cancelbutton" class="btn btn-danger btn-sm" style="display:none;">
                 <span class="glyphicon glyphicon-remove"></span> &nbsp Cancel 	
                 </button>
                 <button type="button" onclick = "successEdit()" id="confirmbutton" class="btn btn-success btn-sm" style="display:none;">
                 <span class="glyphicon glyphicon-ok"></span> &nbsp Confirm
                 </button>
                 </center></td>
               </tr>
            </table>
            <script>
            function editProfile() {
            	document.getElementById("editprofile").style.display = "none";
            	document.getElementById("cancelbutton").style.display = "block";
            	document.getElementById("confirmbutton").style.display = "block";
            }
            function cancelEdit() {
            	document.getElementById("editprofile").style.display = "block";
            	document.getElementById("cancelbutton").style.display = "none";
            	document.getElementById("confirmbutton").style.display = "none";
            }
            </script>
            <%
               }
            }   catch(Exception e) {
            	e.printStackTrace();
            }         
            %>
            </div>
             </center>
          </fieldset>
     </div>
</div>


 <footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
					</div>
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("main").style.marginLeft = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}


</script>
     
</body>
</html>