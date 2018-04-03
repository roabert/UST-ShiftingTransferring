<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
       
        <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/styles.css"type="text/css">
<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
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
	 response.sendRedirect("login.jsp");
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
 <%
     String userget = request.getParameter("edituser"); 
     String getusersql = "SELECT userid, last_name, first_name, middle_name, type FROM admins WHERE userid = ? UNION SELECT userid, last_name, first_name, middle_name, type FROM dean WHERE userid = ? UNION SELECT userid, last_name, first_name, middle_name, type FROM ofad WHERE userid = ? UNION SELECT userid, last_name, first_name, middle_name, type FROM osa WHERE userid = ? UNION SELECT userid, last_name, first_name, middle_name, type FROM registrar WHERE userid = ? UNION SELECT userid, last_name, first_name, middle_name, type FROM secgen WHERE userid = ?";
     try {
     PreparedStatement ps = conn.prepareStatement(getusersql);
      ps.setString(1, userget);
      ps.setString(2, userget);
      ps.setString(3, userget);
      ps.setString(4, userget);
      ps.setString(5, userget);
      ps.setString(6, userget);
      
      ResultSet rs = ps.executeQuery();
    while(rs.next()) {
     %>
            <p><i>Edit Profile(<%=rs.getString("userid") %>)</i></p>
</div>
    
    <br>
     <div class="container">
     
     
  
     <form action = "AdminEditUsers" method="post">
      <div class="col-sm-12">
      <table>
      
       <p>Last Name: <input type="hidden" name = "useridget" value = "<%=rs.getString("userid")%>"> <input type="text" class="form-control" size="50" value = "<%=rs.getString("last_name")%>" name = "edit_lname"></p>
      
            
      <p>First Name: <input type="text" class="form-control" size="50" value = "<%=rs.getString("first_name")%>" name = "edit_fname"></p>
     
    
    <p>  Middle Initial: <input type="text" class="form-control" size="50" value = "<%=rs.getString("middle_name")%>" name = "edit_mname"></p>
        
       
     
       
            <p>Position: <input type="text" class="form-control" size="50" value="<%=rs.getString("type")%>" name="edit_type" readonly></p>
     

     <p>College/Faculty(If Dean): <input type="text" class="form-control" size="50" value="<%%>" name="edit_college"></p>
         
        
      
       <br><br> </table>
       <center><button type = "submit" class="btn btn-warning btn-lg">Modify</button></center>
       
       </div>
       </form>
      
      </div>
     <% }
     }catch(Exception e) {
    	 out.println(e);
     }
     %>
      <br><br>
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