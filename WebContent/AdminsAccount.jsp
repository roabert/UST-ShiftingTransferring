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
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/MainBody.css">
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="CSS/style.css">
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



<div id="mySidenav" class="sidenav">
<center>
<img src="Images/dp.png" style="width:40%; height:15%;">
<a href="Adminspage.jsp"><%=getuser %></a>

</center>
<br>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Adminspage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="AdminsAccount.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-duplicate"></span> Accounts</a>
  <a href="AdminsStudent.jsp"><span class="glyphicon glyphicon-pencil"></span> Students</a>
  <a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a>
</div>

<div id="main">

<div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>
     
    <br>
     <div class="container">
     <legend><p><i>Create Accounts</i></p>
     </legend>
     </div>
      <div class="container-fluid">
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
        <tr>
        <td><%=rs.getString("userid") %></td>
        <td><%=rs.getString("first_name") %> <%=rs.getString("middle_name") %>. <%=rs.getString("last_name") %></td>
        <td><%=rs.getString("type") %></td>
        
        <td><a href="javascript:;" data-target=".editusers" data-toggle="modal">Edit</a></td>
        
        </tr>
        <%}
           
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
        
      </table>
      </center>
      
      </div>
      </div>
      <div class="container">
      <form action ="AdminsCreateUsers.jsp"><button type="submit" class="btn btn-warning btn-lg pull-right">Create</button></form>
      </div>
      <br><br>
</div>



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