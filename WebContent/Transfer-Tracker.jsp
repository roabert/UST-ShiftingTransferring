<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
    <%@ page import = "ust.registrar.model.studentprocess.*" %>
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
 TRANSFEREE : PROCESS TRACKER
   </a>
   </center>
</div>
</div>
 <div class="container">
<div class="row">
<center>
<ol class="progress-meter">
<h2>PHASE ONE:<h2>
    <div class="breadcrumb flat">
   <%
     TransfereeTracker tracker = new TransfereeTracker();
   tracker.setStudentid(getuser);
   tracker.TransferTrackerVerification(conn);
   tracker.TransferTrackerExams(conn);
   tracker.TransferTrackerEncodeScore(conn);
   tracker.TransferTrackerMemo(conn);
   %>
     <%if(tracker.getOsaverified() != null) {%>
   <% if(tracker.getOsaverified().equals("In-progress")) {%>
	  <a class="modal-btn inp">OSA Verification</a>
	  <%} else if(tracker.getOsaverified().equals("Approved")) {%>
	   <a class="modal-btn active" href="#osaverified">OSA Verification</a>
	   <%} else if(tracker.getOsaverified().equals("Disapproved")) {%>
	    <a class="modal-btn reject" href="#osaverified">OSA Verification</a>
	    <%} else { %>  <%} %>
	      <%} else {
	    	  %> <a class="modal-btn" href="#open-modal">OSA Verification</a> <% 
	      } %>
	      
	<%if(tracker.getDeanverified() != null)  {%>
	    <%if (tracker.getDeanverified().equals("In-progress")) {%>
	  	<a class="modal-btn inp">Dean Verification</a>
	  	<%} else if (tracker.getDeanverified().equals("Approved")) {%>
	  	<a class="modal-btn active" href="#deanverified">Dean Verification</a>
	  	<%} else if (tracker.getDeanverified().equals("Disapproved")) {%>
	  	<a class="modal-btn reject" href="#deanverified">Dean Verification</a>
	  	<%} else {%> <%} %>
	  	<%} else { %>
	  	<a class="modal-btn">Dean Verification</a>
	  	<%} %>
	 
	 <%if(tracker.getOsgverified() != null) {%>
	  	   <%if (tracker.getOsgverified().equals("In-progress")) {%>
	   <a class="modal-btn inp">OSG Verification</a>
	   <%} else if (tracker.getOsgverified().equals("Approved")) {%>
	   <a class="modal-btn active" href="#secgenverified">OSG Verification</a>
	   <%} else if (tracker.getOsgverified().equals("Disapproved")) {%>
       <a class="modal-btn reject" href="#secgenverified">OSG Verification</a>
       <%} else {%>  <%} %>
     <%} else { %>
     <a class="modal-btn">OSG Verification</a>
     <%} %>

      <%if(tracker.getOfadverified()!=null) { %>
       <% if(tracker.getOfadverified().equals("In-progress")) {%>
	    <a class="modal-btn inp">OFAD Verification</a>
	    <%} else if(tracker.getOfadverified().equals("Approved")) {%>
	    <a class="modal-btn active" href="#ofadverified">OFAD Verification</a>
	    <%} else if(tracker.getOfadverified().equals("Disapproved")) {%>
	    <a class="modal-btn reject" href="#ofadverified">OFAD Verification</a>
	    <%} else {%> <%} %>
	    <%} else { %>
	    <a class="modal-btn">OFAD Verification</a>
	    <%} %>
	    </div>
	      <h2>PHASE TWO:<h2>
	    <div class="breadcrumb flat">
	  
	 <%if(tracker.getGetsched() != null && tracker.getIdsched() != null) {%>
	  <a class="modal-btn active" href="#ofadsched">OFAD Exam Schedule</a>
	  <%} else if(tracker.getGetsched() == null && tracker.getIdsched() != null) {%>
	   <a class="modal-btn inp">OFAD Exam Schedule</a>
	  <%} 
	  else if(tracker.getGetsched() == null && tracker.getIdsched() == null) {%>
	  <a class="modal-btn">OFAD Exam Schedule</a>
	  <%} %>
	  
	  <%if(tracker.getFinalscore() != null && tracker.getIdscore() != null) {%>
	<a class="modal-btn active" href="#ofadencoded">OFAD Encode Scores</a>
	<% }else if(tracker.getFinalscore() == null && tracker.getIdscore() != null) {%>
	<a class="modal-btn inp">OFAD Encode Scores</a>
	<%} else if(tracker.getFinalscore() == null && tracker.getIdscore() == null){%>
	<a class="modal-btn" href="#open-modal">OFAD Encode Scores</a>
	<%} %>
	
   <% if(tracker.getDeanreview() != null) {%>
	<%if(tracker.getDeanreview().equals("In-progress")) {%>
	<a class="modal-btn inp">Dean Verifies Results</a>
	<%} else if(tracker.getDeanreview().equals("Approved")) {%>
	<a class="modal-btn active" href="#deanreviewed">Dean Verifies Results</a>
	<%} else if(tracker.getDeanreview().equals("Disapproved")) {%>
	<a class="modal-btn reject" href="#deanreviewed">Dean Verifies Results</a>
	<%} %>
   <%} else {%>
   <a class="modal-btn" href="#open-modal">Dean Verifies Results</a>
   <%} %>
	
	</div>
	<h2>PHASE THREE:<h2>
	<div class="breadcrumb flat">
	
 <%if(tracker.getMemostudentid() != null && tracker.getRegistrarindorsed() == null) { %>
	<a class="modal-btn inp" href="Transfer-Memo.jsp">Memo Form: Active</a>
	<%}else if(tracker.getMemostudentid() != null && tracker.getRegistrarindorsed() != null) {  %>
	<a class="modal-btn active" href="#studentmemo">Memo Form: Active</a>
	<%} else {%>
	<a class="modal-btn">Memo Form: Active</a>
	<%} %>
	
   <%if (tracker.getRegistrarindorsed() != null) {%>
    <% if(tracker.getRegistrarindorsed().equals("In-progress")) {%>
	<a class="modal-btn inp">Memo: Registrar</a>
	<%} else if(tracker.getRegistrarindorsed().equals("Approved")) {%>
	<a class="modal-btn active" href="#registrarindorsed">Memo: Registrar</a>
	<%} else if(tracker.getRegistrarindorsed().equals("Disapproved")) {%>
	<a class="modal-btn reject" href="#registrarindorsed">Memo: Registrar</a>
	  <%} else { %>
	   <%} %>
   <%} else {%>
   <a class="modal-btn" href="#open-modal">Memo: Registrar</a>
   <%} %>
	
   <%if(tracker.getSecgenindorsed() != null) {%>
	 <% if(tracker.getSecgenindorsed().equals("In-progress")) {%>
	  <a class="modal-btn inp">Memo: Sec Gen</a>
	  <a  class="modal-btn">Transferring: Finished</a>
	<%} else if(tracker.getSecgenindorsed().equals("Approved")) {%>
	  <a class="modal-btn active" href="#secgenindorsed">Memo: Sec Gen</a>
	  <a  class="modal-btn active" href="Transfer-Transferring-Done.jsp">Transferring: Finished</a>
	<%} else if(tracker.getSecgenindorsed().equals("Disapproved")) {%>
	   <a class="modal-btn reject" href="#secgenindorsed">Memo: Sec Gen</a>
	   <a  class="modal-btn" href="Transfer-TransferFailed.jsp">Transferring: Finished</a>
	<%}  else { %><% }
   }else { %>
   <a class="modal-btn">Memo: Sec Gen</a>
   <a  class="modal-btn">Transferring: Finished</a>
	<%} %>
	
	
	</div>
</ol>

<button type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#legend">Legend</button>
 <div id="legend" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      
      <div class="modal-body">
        
<img src="Images/legends.png" class="responsive-legend"style="width:300px;height:120px;">
      </div>
     
    </div>

  </div>
</div>
  </div>

  

<!-- 
<ul class="legend">
   
<img src="Images/legend2.png" class="responsive-legend"style="width:300px;height:120px;">
</ul> -->

<br>
  </center>
</div>
</div>
</div>

<div id="osaverified" class="modal-window">
  <div>
  		<legend>
		OSA Verification
		</legend>		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>

   
    <div><h4>Time Stamp: <%=tracker.getOsa_timestamp()%></h4>
    </div>
    <br>
    <br>
  </div>
</div>

<div id="deanverified" class="modal-window">
  <div>
  		<legend>
		Dean Verification
		</legend>		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>

   
    <div><h4>Time Stamp: <%=tracker.getDean_timestamp()%></h4>
    </div>
    <br>
    <br>
  </div>
</div>

<div id="secgenverified" class="modal-window">
	<div>	 

  		<legend>
		OSG Verification
		</legend>	
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>

   
    <div><h4>Time Stamp: <%=tracker.getSecgen_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>

<div id="ofadverified" class="modal-window">
 <div>		 

  		<legend>
		OFAD Verification
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getOfad_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>
    
    <div id="ofadsched" class="modal-window">
     <div>
      <legend>Exam Schedule</legend>
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>

    <p>Kindly see the shifting page for details.</p>
    <div>Time Stamp: <%=tracker.getGetsched_timestamp() %></div>
    </div>
    </div>
    
  <div id="ofadencoded" class="modal-window">
 <div>		 

  		<legend>
	 Exam Results
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getEncoded_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>

<div id="deanreviewed" class="modal-window">
 <div>		 

  		<legend>
		Exam Results Reviewed
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getReviewed_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>
<div id="studentmemo" class="modal-window">
 <div>		 

  		<legend>
		Student Memo Application
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getReviewed_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>
<div id="registrarindorsed" class="modal-window">
 <div>		 

  		<legend>
		First Indorsement
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getIndorsed1_timestamp()%></h4>
    </div>
    <br>
    <br>
   </div>
</div>

<div id="secgenindorsed" class="modal-window">
 <div>		 

  		<legend>
		Second Indorsement
		</legend>
		
    <a href="#modal-close" title="Close" class="modal-close">&times;</a>
	
   
    <div><h4>Time Stamp: <%=tracker.getIndorsed2_timestamp()%></h4>
    </div>
    <br>
    <br>
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