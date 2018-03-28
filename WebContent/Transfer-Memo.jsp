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
	<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/style.css"type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="scripts/list.js"></script>
<head>
<style>
 form#step1transfer > #fileuploading {display:none;}
 select {
    width: 50%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}
</style>
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
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Transfer-Welcome.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Transfer-Transferring.jsp" class="active"><span class="glyphicon glyphicon-random"></span> Transferring</a></li>
    <li><a href="Transfer-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
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
 <span style="fo	nt-size:50px;margin-top:-20px;cursor:pointer;color: black" class="js-toggle-left-slidebar">&#9776;</span>
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
      
</div>
<br>    <p id="text_steps"><i>STEP 3: FILL UP MEMO</i></p>

     <div class="container">
  <div class="memo">
<br>
<form action = "SubmitMemoTransferProcess" method="post">
<input type="hidden" name="getstudent" value="<%=getuser%>">
Date: <input type="date" align="right" name="date" placeholder="Date today" ><br><br>
<p>I, <input type="text" id="fname" name="fullname" placeholder="Full name here"  style="width:500px"  > wish to apply admission to the
Faculty/College/Institute <br><br><input type="text" id="fname" name="newcourse" placeholder="Outgoing Faculty"  style="width:500px"  >,
Term # <input type="number" id="fname" name="semester" placeholder="Term #" style="width:50px">AY 20- <input type="number" id="fname" name="firstyear" placeholder="" style="width:50px">
- 20<input type="number" id="fname" name="secondyear" placeholder="" style="width:50px"> <br><br> My complete college attendance to date:  <input type="text" id="fname" name="currentcourse" placeholder="Current School and Faculty/Program" style="width:500px"  >
</p>
<center>
<p>
<table class="table-year">
   <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" id="fname" name="firstterm" placeholder="" style="width:50px"> AY 20- <input type="number" id="fname" name="firstterm_1year" placeholder="" style="width:50px">
- 20<input type="number" id="fname" name="firstterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" id="fname" name="specialterm_1" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" id="fname" name="secondterm" placeholder="" style="width:50px"> AY 20- <input type="number" id="fname" name="secondterm_1year" placeholder="" style="width:50px">
- 20<input type="number" id="fname" name="secondterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" id="fname" name="specialterm_2" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" id="fname" name="thirdterm" placeholder="" style="width:50px"> AY 20- <input type="number" id="fname" name="thirdterm_1year" placeholder="" style="width:50px">
- 20<input type="number" id="fname" name="thirdterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" id="fname" name="specialterm_3" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" id="fname" name="fourthterm" placeholder="" style="width:50px"> AY 20- <input type="number" id="fname" name="fourthterm_1year" placeholder="" style="width:50px">
- 20<input type="number" id="fname" name="fourthterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" id="fname" name="specialterm_4" placeholder="" style="width:50px"></td>
  </tr> 
 
</table><br><br>
<input type="checkbox" name="termsandcondition" value="Agree" id="termcheckbox">I agree that my enrollment will be AUTOMATICALLY CANCELLED if it turns out that I have been debarred from the prevoius college.
</p><br><br>
<button type="submit" class="btn btn-warning btn-lg">Submit</button>
</center>
 </form>
</div>
     
          </div>
  </div>
     
<footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
					

</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>
  
  <script language="javascript">
populateCountries("country", "state");
</script>
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
	id("text_steps").innerHTML = "<p><i>TRANSFERRING(Step 2-a): UPLOAD REQUIREMENTS</i></p>";
	id("choosecollege").style.display = "none";
	id("fileuploading").style.display = "block";
}
function goback() {
	id("text_steps").innerHTML = "<p><i>TRANSFERRING(Step 1-a): SELECT OUTGOING PROGRAM</i></p>";
	id("choosecollege").style.display = "block";
	id("fileuploading").style.display = "none";
}
function step1Submit() {
	id("step1transfer").method = "post";
	id("step1transfer").action = "Requirements_Upload";
	id("step1transfer").submit();
}
</script>
</body>
</html>