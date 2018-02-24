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
  <a href="Shifter-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="Shifter-Shifting.jsp"><span class="glyphicon glyphicon-random"></span> Shifting</a>
  <a href="Shifter-Tracker.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-search"></span> Tracker</a>
  <a href="logout.jsp">Log Out</a>
</div>

<div id="main">
<div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>

 
 <%
    
   
    
    %>
    <br>
    
   
<div class="container">
 <p><i>STEP 1: UPLOAD PRE-REQUIREMENTS</i></p>
 <div class="container">
<div class="row">
<center>
<ol class="progress-meter">
    <li class="progress-point done">Dean Verification</li>
	<li class="progress-point done">Sec Gen Endorsement</li>
	<li class="progress-point done">OFAD Verification</li>
	<li class="progress-point done">OFAD Encode Scores</li>
	<li class="progress-point done">Dean Verifies</li>
	<li class="progress-point done">Memo Form Now Active</li>
	<li class="progress-point done">Sec Gen Recieves Memo</li>
	<li class="progress-point done">Dean Recieves Memo</li>
	<li class="progress-point done">Registrar Recieves Memo</li>
	<li class="progress-point todo">Finish</li>
  </ol>
</div>


  </center>
</div>
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
function swapImage(){
	var image = document.getElementById("imageToSwap");
	var dropd = document.getElementById("dlist");
	image.src = dropd.value;	
};
</script>
</body>
</html>