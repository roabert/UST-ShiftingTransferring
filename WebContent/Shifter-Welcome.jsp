<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/MainBody.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Welcome Student!</title>

</head>
<style>

</style>
<body>
<%String getuser = (String)session.getAttribute("setuser"); 
 if(getuser == null) {
	 response.sendRedirect("index.html");
 }%>
<div id="mySidenav" class="sidenav">

<center>
<img src="Images/dp.png" style="width:40%; height:15%;">
<a href="Shifter-Welcome.jsp"><%=getuser %></a>
<br>
</center>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Shifter-Welcome.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="Shifter-Shifting.jsp"><span class="glyphicon glyphicon-random"></span> Shifting</a>
  <a href="Shifter-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a>
  <a href="logout.jsp">Log Out</a>
</div>

<div id="main">
<div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>

 
 <%
    
    String returnsql = "SELECT * FROM student_shifter WHERE studentid = "+getuser+"";
    try{
    Statement pst = conn.createStatement();
    ResultSet usercontent = pst.executeQuery(returnsql);
     
    
    %>
    <br>
     <div class="container">
          <fieldset>
            <legend><p><i>Profile Information</i></p></legend>
            <center>
            <div class="table-responsive">
            <% while(usercontent.next()) { %>
            <table class="table">
               <tr>
                 <td>Name </td>
                 <td><input type="text" size="60" value = "<%=usercontent.getString("lastname")%>, <%=usercontent.getString("firstname")%> <%=usercontent.getString("middlei") %>" class="form-control" readonly></td>
                 <td rowspan = "5"><center><img src="<%=usercontent.getString("idpicture") %>" style="width:50%; height:50%;" class="responsive"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" size="60" value="<%=usercontent.getInt("studentid")%>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Program </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("oldprogram") %>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("typeofstudent") %>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("gender") %>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Outgoing: </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("newprogram") %>" class="form-control" readonly></td>
                 <td><center><button type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span>Edit Profile</button></center></td>
               </tr>
            </table>
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