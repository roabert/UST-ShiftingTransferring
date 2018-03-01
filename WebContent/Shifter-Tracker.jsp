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
<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/style.css"type="text/css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" type="text/css">
	
		 
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
    <li><a href="Shifter-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Shifter-Shifting.jsp"><span class="glyphicon glyphicon-random"></span> Shifting</a></li>
    <li><a href="Shifter-Tracker.jsp" class="active"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
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
  <a href="#">Guidelines</a>
</div>


<br>
<p><i>STEP 1: UPLOAD PRE-REQUIREMENTS</i></p>
 <div class="container">
<div class="row">
<center>
<ol class="progress-meter">
    <div class="breadcrumb flat">
    <%
    try {
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ?");
    ps.setString(1, getuser);
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
    %>
       <%if(rs.getString("dean_verified")!=null){
       if(rs.getString("dean_verified").equals("approved"))  {%> 
   	<a class="modal-btn active" href="#open-modal">Dean Verification</a>
   	<%} else if(rs.getString("dean_verified").equals("in-progress")) { %>
   	<a class="modal-btn inp" href="#open-modal">Dean Verification</a>
   	   <%} else if(rs.getString("dean_verified").equals("disapproved")){%>
          <a class="modal-btn reject" href="#open-modal">Dean Verification</a>
          <%} %>
       <%
       } else{
    	%>
    	<a class="modal-btn" href="#open-modal">Dean Verification</a>
    	<%
       }%>
       
       <%if(rs.getString("secgen_verified")!=null){
       if(rs.getString("secgen_verified").equals("approved"))  {%> 
   	<a class="modal-btn active" href="#open-modal">Sec Gen Endorsement</a>
   	<%} else if(rs.getString("secgen_verified").equals("in-progress")) { %>
   	<a class="modal-btn inp" href="#open-modal">Sec Gen Endorsement</a>
   	   <%} else if(rs.getString("secgen_verified").equals("disapproved")){%>
          <a class="modal-btn reject" href="#open-modal">Sec Gen Endorsement</a>
          <%} %>
       <%
       } else{
    	%>
    	<a class="modal-btn" href="#open-modal">Sec Gen Endorsement</a>
    	<%
       }%>
       
       <%if(rs.getString("ofad_verified")!=null){
       if(rs.getString("ofad_verified").equals("approved"))  {%> 
   	<a class="modal-btn active" href="#open-modal">OFAD Verification</a>
   	<%} else if(rs.getString("ofad_verified").equals("in-progress")) { %>
   	<a class="modal-btn inp" href="#open-modal">OFAD Verification</a>
   	   <%} else if(rs.getString("ofad_verified").equals("disapproved")){%>
          <a class="modal-btn reject" href="#open-modal">OFAD Verification</a>
          <%} %>
       <%
       } else{
    	%>
    	<a class="modal-btn" href="#open-modal">OFAD Verification</a>
    	<%
       }%>
	 
	 
	<a class="modal-btn" href="#open-modal2">OFAD Exam Schedule</a>
	<a class="modal-btn" href="#open-modal">OFAD Encode Scores</a>
	<a class="modal-btn" href="#open-modal">Dean Verifies Results</a>
	</div>
	<br><br><br><br>
	<div class="breadcrumb flat">
	<a href="#" class="">Memo Form Now Active</a>
	<a href="#" class="">Memo Endorsement: Registrar</a>
	<a href="#" class="">Memo Endorsement: Sec Gen</a>
	<a href="#">Memo Confirmation: Registrar & Dean</a>
	<%  
    }
    }
     catch(SQLException e) {
    	 out.print(e);
     }
    %>
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
          			       <footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>

		</div>

<div id="open-modal" class="modal-window">
		 
  <div>
   <i>Dean Verification</i>
    <a href="#modal-close" title="Close" class="modal-close">Close</a>
   
    <div>Time Stamp: May 4, 2018 | 7:00 AM</div>
    </div>
    </div>
    <div id="open-modal2" class="modal-window">
     <div>
    <a href="#modal-close" title="Close" class="modal-close">Close</a>
    <i>Exam Schedule</i>
    <div>Time: 7:00 AM-12:00PM</div>
    <div>Venue: Roque Ruano</div>
    <div>Bring: Official OR | Test Permit | Pencil</div>
    <div>Time Stamp: May 4, 2018 | 7:00 AM</div>
    </div>
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
function swapImage(){
	var image = document.getElementById("imageToSwap");
	var dropd = document.getElementById("dlist");
	image.src = dropd.value;	
};
</script>
</body>
</html>