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
	<link rel="stylesheet" href="CSS/tracker.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" type="text/css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Student | Tracker</title>
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
 TRACKER
   </a>
   </center>
</div>


<br>
</div>
 <div class="container">
<div class="row">
<center>
<ol class="progress-meter">
    <div class="breadcrumb flat">
    <%try { 
     PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ?");
     ps.setString(1, getuser);
     ResultSet rs = ps.executeQuery();
     if(rs.next())  {
    %>
    <%if (rs.getString("osa_verified") != null) { %>
   <%if (rs.getString("osa_verified").equals("Approved")) {%>
	<a class="modal-btn active" href="#open-modal">OSA Verification</a>
	<%}else if(rs.getString("osa_verified").equals("In-progress")) {%>
	<a class="modal-btn inp" href="#open-modal">OSA Verification</a>
	<% %>
	<%}else if(rs.getString("osa_verified").equals("Disapproved")) {%>
	<a class="modal-btn rejected" href="#open-modal">OSA Verification</a>
	<%} 
	} else {%>
	  <a class="modal-btn" href="#open-modal">OSA Verification</a>
	<%} %>
	
	<%if (rs.getString("dean_verified") != null) { %>
	<%if (rs.getString("dean_verified").equals("Approved")) { %>
	<a class="modal-btn active" href="#open-modal">Dean Verification</a>
		<%}else if(rs.getString("dean_verified").equals("In-progress")) {%>
		<a class="modal-btn inp" href="#open-modal">Dean Verification</a>
		<%} else if(rs.getString("dean_verified").equals("Disapproved")) {%>
		<a class="modal-btn rejected" href="#open-modal">Dean Verification</a> <%} %>
	<%} else { %>
	  	<a class="modal-btn" href="#open-modal">Dean Verification</a>
	<%} %>
	
	<%if(rs.getString("secgen_verified") != null) { %>
		<%if (rs.getString("secgen_verified").equals("Approved")) { %>
	<a class="modal-btn active" href="#open-modal">OSG Verification</a>
	<%}else if(rs.getString("secgen_verified").equals("In-progress")) { %>
	<a class="modal-btn inp" href="#open-modal">OSG Verification</a>
	<%}else if(rs.getString("secgen_verified").equals("Disapproved")) {%>
	<a class="modal-btn rejected" href="#open-modal">OSG Verification</a> <%} %>
	<%} else { %>
	   <a class="modal-btn" href="#open-modal">OSG Verification</a>
	<%} %>
	
	<%if(rs.getString("ofad_verified")!=null) { %>
	<%if(rs.getString("ofad_verified").equals("Approved")) {%>
	<a class="modal-btn active" href="#open-modal">OFAD Verification</a>
	<%}else if(rs.getString("ofad_verified").equals("In-progress")) {%>
	<a class="modal-btn inp" href="#open-modal">OFAD Verification</a>
	<%}else if(rs.getString("ofad_verified").equals("Disapproved")) {%>
	<a class="modal-btn rejected" href="#open-modal">OFAD Verification</a> <%} %>
	<%}else{ %>
	    <a class="modal-btn" href="#open-modal">OFAD Verification</a>
	<%} %>
	
	<%} 
     else {%>
     	<a class="modal-btn" href="#open-modal">OSA Verification</a>
	<a class="modal-btn" href="#open-modal">Dean Verification</a>
	 <a class="modal-btn" href="#open-modal">OSG Verification</a>
	 <a class="modal-btn" href="#open-modal">OFAD Verification</a>
     <% 
    }
     } catch(SQLException e) {out.print(e);} %>
	
	

	<%try {
		PreparedStatement p1 = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ?");
		p1.setString(1, getuser);
		ResultSet r1 = p1.executeQuery();
		while(r1.next()){
		%>
	<%if(r1.getString("exam_schedule_date") != null && r1.getString("transferee_id") != null){ %>
	   
       	<a class="modal-btn active" href="#open-modal2">OFAD Exam Schedule</a>
	<%} else if(r1.getString("transferee_id") != null && r1.getString("exam_schedule_date") == null ){%>
	   <a class="modal-btn inp" href="#open-modal2">OFAD Exam Schedule</a>
	  <%} else {%>
	  <a class="modal-btn" href="#open-modal2">OFAD Exam Schedule</a>
	  <%} %>
	<%}}catch(SQLException e) {out.print(e);} %>
	<a class="modal-btn" href="#open-modal">OFAD Encode Scores</a>
	<a class="modal-btn" href="#open-modal">Dean Verifies Results</a>
	</div>
	<br><br><br><br>
	<div class="breadcrumb flat">
	<a class="modal-btn" href="#open-modal">Memo Form: Active</a>
	<a  class="modal-btn" href="#open-modal">Memo: Registrar</a>
	<a  class="modal-btn" href="#open-modal">Memo: Sec Gen</a>
	<a  class="modal-btn" href="#open-modal">Memo: Registrar & Dean</a>
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