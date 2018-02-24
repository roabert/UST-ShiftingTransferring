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
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Welcome Student!</title>

</head>

<body>
<%String getuser = (String)session.getAttribute("setuser"); 
 if(getuser == null) {
	 response.sendRedirect("index.html");
 }
%>
<div id="mySidenav" class="sidenav">
<center>
<img src="Images/dp.png" style="width:40%; height:15%;">
<a href="Transfer-Welcome.jsp"><%=getuser %></a>
<br>
</center>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Transfer-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="Transfer-Transferring.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-random"></span> Transferring</a>
  <a href="Transfer-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a>
  <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a>
</div>

<div id="main">
<div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>
<br>
 <div class="container">
 <p><i>SHIFTING: SELECT OUTGOING PROGRAM</i></p><br>
<div class="row">
  <div class="column">
    
    <center>
    <h2>Column 1</h2>
    <select id="dlist" onChange="swapImage()" class="form-control">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>
    <h2>Column 1</h2>
    <select id="dlist" onChange="swapImage()" class="form-control">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>

    </center>
    <img id="imageToSwap" src="images/d.gif" />
  </div>
  
  
  
  
  <div class="column">
    <center>
    <h2>Column 1</h2>
    <select id="dlist" onChange="swapImage()" class="form-control">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>
    <h2>Column 1</h2>
    <select id="dlist" onChange="swapImage()" class="form-control">
<option value="images/a.gif">Institute of Information and Computing Sciences</option>
<option value="images/b.gif">Faculty of Engineering</option>
<option value="images/c.gif">College of Fine Arts and Design</option>
</select>

    </center>
    <img id="imageToSwap" src="images/d.gif" />
  </div>
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
</script>
</body>
</html>