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
<link rel="stylesheet" href="shiftform.css">
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Welcome! | Shifting</title>

</head>
<style>
 form#step1shifter > #fileuploading {display:none;}
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
  <a href="Shifter-Shifting.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-random"></span> Shifting</a>
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
    
   
    
    %>
    <br>
    
     <div class="container">
     <form id="step1shifter" onsubmit = "false" enctype="multipart/form-data">
     <div id = "choosecollege">
     <p><i>SHIFTING(Step 1-a): SELECT OUTGOING PROGRAM</i></p>
     <br>
<div class="row">
  <div class="column">
    
    <center>
    <h2>Current College</h2>
     <p><% %></p>
    <h2>Current Program</h2>
     <p><% %></p>

    </center>
    <img id="imageToSwap" src="images/d.gif" />
  </div>
 
  <div class="column">
    <center>
    <h2>Outgoing College</h2>
    <select id="dlist" name="outgoing_college" class="form-control" onChange="swapImage()">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>
    <h2>Outgoing Program</h2>
    <select id="dlist" name="outgoing_program" class = "form-control" onChange="swapImage()">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>

    </center>
    <img id="imageToSwap" src="images/d.gif" />
  </div>
</div>
  <br><br>
  <center>
  <button type = "button" onclick="nextstep()" class="btn btn-warning btn-lg">Next</button>
  </center>
 </div>
 <div id = "fileuploading">
    <div class="container">
  <p><i>SHIFTING(Step 1-b): UPLOAD REQUIREMENTS</i></p> <br>
		 	<fieldset>
		<legend><p>Browse your files here: </p></legend>
		<center>
		  <input type="file" size="50" name="requirements_images" type="file" multiple="multiple"> 
		</center>
		 </fieldset>
        
		
	
</div>
<br><br>
   <center>
   <button type = "button" onclick="goback()" class="btn btn-warning btn-lg">Back</button>
   <button onclick="step1Submit()" class="btn btn-warning btn-lg">Shift Now</button>
   </center>
 </div>
 </form>
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
function swapImage(){
	var image = document.getElementById("imageToSwap");
	var dropd = document.getElementById("dlist");
	image.src = dropd.value;	
};
function nextstep() {
	id("choosecollege").style.display = "none";
	id("fileuploading").style.display = "block";
}
function goback() {
	id("choosecollege").style.display = "block";
	id("fileuploading").style.display = "none";
}
function step1Submit() {
	id("step1shifter").method = "post";
	id("step1shifter").action = "Requirements_Upload";
	id("step1shifter").submit();
}
;</script>
</body>
</html>