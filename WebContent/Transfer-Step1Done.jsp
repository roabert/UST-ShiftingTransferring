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
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="scripts/list.js"></script>
<head>

<meta charset="ISO-8859-1">
<title>Transferee | Requirements Submitted!</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}	
%>

<div off-canvas="slidebar-1 left reveal">
		<div>
		<br>
<%     String returnsql1 = "SELECT * FROM student_transfer WHERE userid= ?";
    try{
    PreparedStatement psts = conn.prepareStatement(returnsql1);
    psts.setString(1, getuser);
    ResultSet rs = psts.executeQuery();
     
    while(rs.next()) {
    %><navhead>
			<center><img src="DisplayProfileTransfer?pkey=<%=rs.getString("userid")%>" width ="150" height = "150">
			<%} }catch(SQLException e) {out.print(e);} %>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
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
   FILES UPLOADED! SEE TRACKER FOR UPDATES
   </a>
   </center>
</div>
       <%
    
         PreparedStatement pss = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (osa_verified = 'Disapproved' OR dean_verified = 'Disapproved' OR ofad_verified = 'Disapproved')");
         pss.setString(1, getuser);
         ResultSet rss = pss.executeQuery();
         if(rss.next()) {
         
         	 response.sendRedirect("Transfer-TransferFailed.jsp");
         }
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ? AND exam_schedule_date is NOT NULL");
         ps.setString(1, getuser);
         ResultSet rs = ps.executeQuery();
         if(rs.next()) {
      	 response.sendRedirect("Transfer-Transferring-2.jsp");
       }
         %>
</div>

     <div class="container">
<br>
<br>
       <center>
       <br><br>
       <p><span class="glyphicon glyphicon-search" style="font-size:120px;"></span></p>
       <br><br><br>
       <form action="Transfer-Tracker.jsp"><button type="submit" class="btn btn-lg btn-warning">See Tracker</button></form>
       </center>
          </div>
  </div>
</div>



 
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

 <div class="footer"></div>
</body>
</html>