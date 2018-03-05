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

<div off-canvas="slidebar-1 left reveal">
		<div>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Transfer-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Transfer-Transferring.jsp"><span class="glyphicon glyphicon-random"></span> Transferring</a></li>
    <li><a href="Transfer-Tracker.jsp" class="active"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
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
       <br>     <p><i>PROFILE INFORMATION</i></p>
</div>
  <div class="container">
<div class="row">
<center>
<ol class="progress-meter">
    <div class="breadcrumb flat">
    <%try { 
     PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ?");
     ResultSet rs = ps.executeQuery();
     while(rs.next())  {
    %>
   <%if (rs.getString("osa_verified").equals("Approved")) {%>
	<a class="modal-btn active" href="#open-modal">OSA Verification</a>
	<%}else if(rs.getString("osa_verified").equals("In-progress")) {%>
	<a class="modal-btn inp" href="#open-modal">OSA Verification</a>
	<% %>
	<%}else if(rs.getString("osa_verified").equals("Disapproved")) {%>
	<a class="modal-btn rejected" href="#open-modal">OSA Verification</a>
	<%} %>
	<%if (rs.getString("dean_verified").equals("Approved")) { %>
	<a class="modal-btn active" href="#open-modal">Dean Verification</a>
		<%}else if(rs.getString("dean_verified").equals("In-progress")) {%>
		<a class="modal-btn inp" href="#open-modal">Dean Verification</a>
		<%} %>
	<a class="modal-btn" href="#open-modal">OSG Verification</a>
	<a class="modal-btn" href="#open-modal">OFAD Verification</a>
	<%} } catch(SQLException e) {out.print(e);} %>
	<a class="modal-btn" href="#open-modal2"">OFAD Exam Schedule</a>
	<a class="modal-btn" href="#open-modal">OFAD Encode Scores</a>
	<a class="modal-btn" href="#open-modal">Dean Verifies Results</a>
	</div>
	<br><br><br><br>
	<div class="breadcrumb flat">
	<a href="#" class="">Memo Form Now Active</a>
	<a href="#" class="">Memo Endorsement: Registrar</a>
	<a href="#" class="">Memo Endorsement: Sec Gen</a>
	<a href="#">Memo Confirmation: Registrar & Dean</a>
	</div>
</ol>


  </div>

  </ol>
  


<ul class="legend">
    <li><span class="approved"></span> Approved</li>
    <li><span class="rejected"></span> Rejected</li>
    <li><span class="inprogress"></span> In Progress</li>
</ul>

<br>
  </center>
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