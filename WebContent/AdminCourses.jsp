<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
       
        <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/styles.css"type="text/css">
<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="datatables/css/jquery.dataTables.min.css"type="text/css">
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="fancybox/lib/jquery.mousewheel.pack.js?v=3.1.3"></script>
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
<!-- Add Media helper (this is optional) -->
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
		
<head>
<title>Admin | Courses</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
}	
%>



<div off-canvas="slidebar-1 left reveal">
<navhead>
		<div>
		
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Administrator<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			
</navhead>
			 <nav class="navigation">
   <ul class="mainmenu">
    <li><a href="Adminspage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="AdminsAccount.jsp"><span class="glyphicon glyphicon-duplicate"></span> Accounts</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Students</a>
    <ul class="submenu">
        <li><a href="AdminsStudent_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="AdminsStudent_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
	<li><a href="#"  class="active"><span class="glyphicon glyphicon-duplicate"></span>Courses</a></li>
    <li><a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
  </ul>
</nav>
			</div>


		</div>

<div canvas="contain">
<div id="main">
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
   MANAGE COURSES
   </a>
   </center>
</div>


<br>
</div>
      <div class="container">
       <div class="table-responsive" style="overflow-x:auto; height:100%;">
      <center>
         <table class="table table-striped table-sortable">
        <thead>
          	<th>User ID</th>
         	<th>Name</th>
          	<th>Type</th>
          	<th>Edit Users</th>
        </thead>    
        <tbody>
 
      </table>
    
        
      </center>
      
      </div>
      <br>
      <br>
      <form action ="javascript:;"><button type="button" data-target=".createusers" data-toggle="modal" class="btn btn-warning btn-lg pull-right">Create Faculty Here</button></form>
      </div>
    
      <br><br>
</div>

					</div>
  <div id="createusers" class="modal fade createusers" role="dialog">
    <div class="modal-dialog modal-lg">
       <div class="modal-content">
       <form id = "form1" onsubmit="false">
          <div class="modal-header" style="background-color:gold">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h3 class="modal-title">Add Courses</h3>
          </div>
          <div class="modal-body"> 	
            <div class="col-sm-12">
            <br>
            
            <h4>Faculty</h4>
            <center>
            <table class="table">
              <tr>
               <td>Faculty/College/Institute: </td>
               <td><input type ="text" name="new_userid" class="form-control" required></td>
              </tr>
             
            </table>
            </center>
            
                </table>
              </center>
            </div>
          </div>
          <div class="modal-footer">
              <button type="button" class = "btn btn-default btn-md" data-dismiss="modal">Cancel</button>
            <button type="submit" class = "btn btn-warning btn-md"><span class="glyphicon glyphicon-ok" style="color:green"></span> Create</button>
           
         
          </div>
          </form>
       </div>
    </div>
  </div>

<!-- Edit account -->

<div class="modal fade edit_users" role="dialog">
 <div class="modal-dialog" style="width:600px">
   <div class="modal-content">
   <form action = "AdminEditUsers" method="post">
     <div class="modal-header">
       <button class="close" type="button" data-dismiss="modal">&times;</button>
       <h3 class="modal-title">
          Edit User Accounts
       </h3>
     </div>
     <div class="modal-body">
     <br>
       <table class="table">
       <tr>
          <td>Last Name:</td> 
          <td><input type="hidden" name = "useridget" class="userid"><input type="text" class="lastname form-control" size="50" name = "edit_lname"></td>
      </tr>
      <tr>
      <td>First Name: </td>
      <td><input type="text" class="firstname form-control" size="50" name = "edit_fname"></td>
     </tr>
      <tr>
      <td>Middle Initial: </td> 
     <td><input type="text" class="form-control middlename" size="50"name = "edit_mname"></td>
        </tr>
        <tr>
            <td>Position: </td> 
            <td><input type="text" class="form-control type" size="50" name="edit_type" readonly></td>
     </tr>
     <tr>
     <td>College/Faculty(If Dean): </td> 
     <td><input type="text" class="form-control" size="50" value="<%%>" name="edit_college"></td>
        </tr> 
       </table>
     </div>
     <div class="modal-footer">
        <button type="submit" class = "btn btn-warning btn-md">Modify</button>
            <button type="submit" class = "btn btn-danger btn-md" data-dismiss="modal">Cancel</button>
     </div>
     </form>
   </div>
 </div>
</div>
 
<script src="scripts/slidebars.js"></script>
<script src="scripts/scripts.js"></script>

<script>
$(document).ready(function() {
    $('table.table-sortable').DataTable();
});
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
 
         <div class="footer"></div>
</body>
</html>