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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
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
			<h1>Administrator<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Adminspage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="AdminsAccount.jsp" class="active"><span class="glyphicon glyphicon-duplicate"></span> Accounts</a></li>
    <li><a href="AdminsStudent.jsp"><span class="glyphicon glyphicon-pencil"></span> Students</a>
<!--       <ul class="submenu">
        <li><a href="">Tops</a></li>
        <li><a href="">Bottoms</a></li>
        <li><a href="">Footwear</a></li>
      </ul>
 -->    </li>
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
            <p><i>Accounts Details</i></p>
</div>
      <div class="container">
       <div class="table-responsive" style="overflow-x:auto; height:450px;">
      <center>
         <table class="table">
        <tr>
          <th>User ID</th>
          <th>Name</th>
          <th>Type</th>
          
          <th>Edit Users</th>
         
        </tr>
       <%
         try{
             String displayusers = "SELECT userid, last_name, first_name, middle_name, type FROM admins UNION SELECT userid, last_name, first_name, middle_name, type FROM dean UNION SELECT userid, last_name, first_name, middle_name, type FROM ofad UNION SELECT userid, last_name, first_name, middle_name, type FROM osa UNION SELECT userid, last_name, first_name, middle_name, type FROM registrar UNION SELECT userid, last_name, first_name, middle_name, type FROM secgen";
        PreparedStatement ps = conn.prepareStatement(displayusers); 
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        %>
      <form action = "AdminDisplayUsers.jsp">
   
        
        
       
        <tr>
        <td><input type= "hidden" value = "<%=rs.getString("userid")%>" name="edituser"><%=rs.getString("userid") %></td>
        <td><%=rs.getString("first_name") %> <%=rs.getString("middle_name") %>. <%=rs.getString("last_name") %></td>
        <td><%=rs.getString("type") %></td>
        
        <td>
         <button type="submit" class="btn btn-warning">Edit</button>
        </td>
        
        </tr>
        </form>
        <%}
           
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
      </table>
    
        
      </center>
      
      </div>
      <form action ="javascript:;"><button type="button" data-target=".createusers" data-toggle="modal" class="btn btn-warning btn-lg pull-right">Create Users Here</button></form>
      </div>
    
      <br><br>
</div>

 <footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
					</div>
  <div class="modal fade createusers" role="dialog">
    <div class="modal-dialog modal-lg">
       <div class="modal-content">
       <form id = "form1" onsubmit="false">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
           <p><i>Create Users</i></p>
          </div>
          <div class="modal-body">
            <div class="col-sm-12">
            <br>
            
            <h4>User Credentials</h4>
            <center>
            <table class="table">
              <tr>
               <td>User ID: </td>
               <td><input type ="text" name="new_userid" class="form-control" required></td>
              </tr>
              <tr>
              <td>Password: </td>
              <td><input type ="password" name="new_password" id="pw1" class="form-control" required></td>
              </tr>
              <tr>
              <td>Confirm Password: </td>
              <td><input type ="password" name="new_password2" id="pw2" class="form-control" required></td>
              </tr>
            </table>
            </center>
            <h4>User Information</h4>
              <center>
                <table class="table">
                  <tr>
                    <td>Last Name: </td>
                    <td><input type ="text" name="new_lname" class="form-control" required></td>
                  </tr>
                   <tr>
                    <td>First Name: </td>
                    <td><input type ="text" name="new_fname" class="form-control" required></td>
                  </tr>
                  <tr>
                    <td>Middle Name: </td>
                    <td><input type ="text" name="new_mname" class="form-control" required></td>
                  </tr>
                   <tr>
                    <td>Gender: </td>
                    <td><input type ="text" size="30" name="new_gender" class="form-control" required></td>
                  </tr>
                  <tr>
                    <td>Office: </td>
                    <td><input type ="text" name="new_type" class="form-control" required></td>
                  </tr>
                </table>
              </center>
            </div>
          </div>
          <div class="modal-footer">
            <button onclick = "submitForm()" class = "btn btn-warning">Create</button>
          </div>
          </form>
       </div>
    </div>
  </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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

function submitForm() {
	var pw1 = document.getElementById("pw1").value;
	var pw2 = document.getElementById("pw2").value;
	
	if(pw1 == pw2) {
		document.getElementById("form1").method = "post";
		document.getElementById("form1").action = "AdminCreateUsers";
		document.getElementById("form1").submit();
	}
	else {
		alert("Passwords are not the same!");
	}
}

</script>
     
</body>
</html>