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
<script src="datatables/js/jquery.dataTables.js"></script>
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
<title>Administrator | Courses</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("administrator"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
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
	<li><a href="AdminCourses.jsp"  class="active"><span class="glyphicon glyphicon-duplicate"></span> Courses</a></li>
	 <li><a href="AdminLogs.jsp" ><span class="glyphicon glyphicon-inbox"></span> Logs</a></li>
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
      <div class="container-fluid">
      <br>
       <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
         <table class="table table-striped table-sortable">
        <thead>
        <tr>
          	<th>Courses</th>
          	<th>Status</th>
 	</tr>
        </thead>    
        <tbody>
        <%try { 
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM courses");
         ResultSet rs = ps.executeQuery();
         while(rs.next()) {
        %>
        <tr>
        <td><%=rs.getString("courses_name") %></td>
        <td>
        <form method = "POST" action="ToggleCourses">
	   	<input type="hidden" value = "<%= rs.getString("courses_name") %>" name = "courseName">
        <%
        	if(rs.getString("status").equals("active")){
        %>
	   	<input type="hidden" value = "active" name = "status">
        <button type="submit" class="btn btn-danger student_shift">Deactivate</button>
        <%
        	}
        	else{
        %>
	   	<input type="hidden" value = "inactive" name = "status">
        <button type="submit" class="btn btn-warning student_shift">Activate</button>
        <%	
        	}
        %>
        </form> 
	    </td>
        </tr>
        <%}}catch(SQLException e){out.print(e);} %>
           </tbody>
      </table>
    
        
      </center>
      
      </div>
      <br>
      <br>
      <form action ="javascript:;">
	      <button type="button" data-target=".addcourses" data-toggle="modal" class="btn btn-warning btn-lg pull-right">
	      	Add New Course
	      </button>
      </form>
      </div>
    
      <br><br>
</div>

					</div>
  <div id="addcourses" class="modal fade addcourses" role="dialog">
    <div class="modal-dialog modal-lg">
       <div class="modal-content">
       <form action = "AddCourses" method="post">
         <div class="modal-header" style="background-color:#EFB652">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h3 class="modal-title"><span class="glyphicon glyphicon-th-list"></span> Add Courses</h3>
          </div>
          <div class="modal-body"> 	
            <div class="col-sm-12">
            <br>
            
            <h4>Faculty</h4>         
            <table class="table">
            <%try { 
            	   PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM faculty");
                   ResultSet rs2 = ps2.executeQuery();
                
            %>
              <tr>
               <td>Faculty/College/Institute: </td>
               <td>
               <select class="form-control" name = "getfaculty" >
               <%   while(rs2.next()) { %>
               <option value="<%=rs2.getString("faculty_name")%>"><%=rs2.getString("faculty_name")%></option>
               <%} %>
               </select>
               </td>
              </tr>
              <% }catch(SQLException x){out.print(x);}%>
            </table>
             <h4>Courses</h4>         
            <table class="table">
              <tr>
               <td>Course: </td>
               <td><input type = input type = "text" class="form-control" class="form-control" class="form-control" name="newcourses"  required></td>
              </tr>
             
            </table>
   
            </div>
          </div>
          <div class="modal-footer">
              <button type="button" class = "btn btn-default btn-md" data-dismiss="modal">Cancel</button>
            <button type="submit" class = "btn btn-warning btn-md">Create</button>
           
         
          </div>
          </form>
       </div>
    </div>
  </div>

<!-- Edit account -->


 
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


</script>
 
         <div class="footer"></div>
</body>
</html>