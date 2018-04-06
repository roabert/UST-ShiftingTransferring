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
		
		<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Student | Shifting</title>
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
				 <%
    
    String returnsql1 = "SELECT * FROM student_shifter WHERE studentid = ?";
    try{
    PreparedStatement psts = conn.prepareStatement(returnsql1);
    psts.setString(1, getuser);
    ResultSet rs = psts.executeQuery();
     
    while(rs.next()) {
    %>
   
			<center><img src="DisplayProfilePic?pkey=<%=rs.getInt("studentid")%>" width ="150" height = "150" class="responsive">
			<%} }catch(SQLException e) {out.print(e);} %>
			 <navhead>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</navhead>
			</center>
			
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Shifter-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Shifter-Shifting.jsp" class="active"><span class="glyphicon glyphicon-random"></span> Shifting</a></li>
    <li><a href="Shifter-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
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
   
  STEP 2: TAKE EXAM
   </a>
   </center>
</div>


<br>
</div>
         <%
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_exams WHERE shifter_id = ? AND exam_schedule_date is NOT NULL");
         ps.setString(1, getuser);
         ResultSet rs = ps.executeQuery();
         if(!rs.next()) {
      	 response.sendRedirect("Shifter-Step1Done.jsp");
       }
  
         %>
</div>  <br>
     <div class="container">
       
        <div class="jumbotron">
        
        <% try{
        	PreparedStatement p = conn.prepareStatement("SELECT * FROM exam_schedules_shifters WHERE shifter_id = ?");
        	p.setString(1, getuser);
        	ResultSet r = p.executeQuery();
        	while(r.next()) {
        	%>
        <h4><i>Date of Exam:</i> <%=r.getString("date") %></h4>
        <h4><i>Time of Exam:</i> <%=r.getString("start_time") %> AM - <%=r.getString("end_time") %> PM</h4>
        <h4><i>Venue:</i> <%=r.getString("venue") %></h4>
        <br>
        <h4><i>Bring:</i> </h4>
        <br>
        <h4>- Test Permit</h4>
        <h4>- OFFICIAL OR</h4>
        <h4>- Pencil</h4>
        <br>
        <h4><i>Remarks: </i> <%=r.getString("remarks") %></h4>
        <%}}catch(SQLException e) {out.print(e);} %>
        </div>
     

          </div>
  </div>
<div class="footer"></div>
<script language="javascript">
populateCountries("country", "state");
</script>

		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>
       
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
	id("text_steps").innerHTML = "<p><i>SHIFTING(Step 2-a): UPLOAD REQUIREMENTS</i></p>";
	id("choosecollege").style.display = "none";
	id("fileuploading").style.display = "block";
}
function goback() {
	id("text_steps").innerHTML = "<p><i>SHIFTING(Step 1-a): SELECT OUTGOING PROGRAM</i></p>";
	id("choosecollege").style.display = "block";
	id("fileuploading").style.display = "none";
}
function step1Submit() {
	id("step1shifter").method = "post";
	id("step1shifter").action = "Requirements_Upload";
	id("step1shifter").submit();
}
;

</script>
</body>
</html>