<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
<%@ page import ="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "DatabaseHandler.SingletonDB" %>
<% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
}	
%>

<div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Administrator<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
		</navhead>
			 <nav class="navigation">
     <ul class="mainmenu">
    <li><a href="Adminspage.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="AdminsAccount.jsp"><span class="glyphicon glyphicon-duplicate"></span> Accounts</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Students</a>
    <ul class="submenu">
        <li><a href="AdminsStudent_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="AdminsStudent_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
	<li><a href="AdminCourses.jsp"><span class="glyphicon glyphicon-duplicate"></span>Courses</a></li>
    <li><a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
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
    String returnsql = "SELECT * FROM admins WHERE userid = ?";
    try{
    PreparedStatement pst = conn.prepareStatement(returnsql);
    pst.setString(1, getuser);
    ResultSet usercontent = pst.executeQuery();
     
    
    %>
     <%--  <div class="container">
          <fieldset>
           
            <center>
            <div class="table-responsive">
            <% while(usercontent.next()) { %>
            <table class="table">
               <tr>
                 <td>Name</td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("last_name") %>, <%=usercontent.getString("first_name") %> <%=usercontent.getString("middle_name") %>" readonly ></td>
                 <td rowspan = "3"><center><img src="Images/dp.png" style="width:50%; height:50%;" class="responsive"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("userid")%>"  readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("type") %>"  readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("gender") %>"  readonly></td>
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
            </table> --%>
    <br>

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
			<div class="profile-pic wthree">
					
				<img src="Images/dp.png" alt="">
				<h2><%=usercontent.getString("last_name")%>, <%=usercontent.getString("first_name")%></h2>
			</div>
			<div class="w3-message">
			<a>Type</a>
				<h5><%=usercontent.getString("type") %></h5>
			<div class="w3ls-touch">
			</div>
			</div>
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
    </fieldset>
  </div>

</div>
</div>
</div>
  
</div>

</div>

<div class="footer"></div>
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