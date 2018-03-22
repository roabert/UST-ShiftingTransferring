<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
    <%@ page import = "ust.registrar.model.shifting.*" %>
     <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<meta charset="ISO-8859-1">
<title>Student-Shifter | Memo</title>
</head>
<style>
 form#step1shifter > #fileuploading {display:none;}
  select {
    width: 100%;
    padding: 16px 20px;
    border: none;
    border-radius: 4px;
    background-color: #f1f1f1;
}
</style>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("index.html");
}	

String webpage = "";
PreparedStatement pst = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ? AND (dean_verified = 'In-progress' OR secgen_verified = 'In-progress' OR ofad_verified = 'In-progress')");
pst.setString(1, getuser);
ResultSet rst = pst.executeQuery();
if(rst.next()) {
	webpage = "Shifter-Step1Done.jsp";
	 response.sendRedirect(webpage);
}
PreparedStatement pss = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ? AND (secgen_verified = 'Disapproved' OR dean_verified = 'Disapproved' OR ofad_verified = 'Disapproved')");
pss.setString(1, getuser);
ResultSet rss = pss.executeQuery();
if(rss.next()) {

	 response.sendRedirect("Shifter-ShiftFailed.jsp");
}
PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM shifters_exams WHERE shifter_id = ? AND exam_schedule_date is not NULL");
ps1.setString(1, getuser);
ResultSet rs1 = ps1.executeQuery();
if(rs1.next()) {
	webpage = "Shifter-Shifting-2.jsp";
	 response.sendRedirect("Shifter-Shifting-2.jsp");
} 
PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ? AND dean_reviewed = 'Approved'");
ps2.setString(1, getuser);
ResultSet rs2 = ps2.executeQuery();
if(rs2.next()) {
	response.sendRedirect("Shifter-Memo.jsp");
}

MemoDoneDAO md = new MemoDoneDAO();
md.setStudentid(getuser);
md.memoDoneStatus(conn);
if(md.getDean() != null || md.getSecgen() != null || md.getRegistrar() != null) {
	 response.sendRedirect("Shifter-MemoDone.jsp");
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
			<center><img src="DisplayProfilePic?pkey=<%=rs.getInt("studentid")%>" width ="120" height = "120">
			<%} }catch(SQLException e) {out.print(e);} %>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
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
         
</div>
<br>    <p id="text_steps"><i>SHIFTING(Step 1-a): SELECT OUTGOING PROGRAM</i></p>
     <div class="container">
     
     <form id="step1shifter" onsubmit = "return false" enctype="multipart/form-data">
     <div id = "choosecollege">
     
     <br>
<div class="row">
  <div class="column">
    
    <center>
    <%
      String getcoursesql = "SELECT * FROM student_shifter WHERE studentid = ?";
    try{
    PreparedStatement ps = conn.prepareStatement(getcoursesql);
    ps.setString(1, getuser);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
    %>
    <input type="hidden" name="studentid" value="<%=rs.getString("studentid")%>">
    <input type="hidden" name="typeofstudent" value="<%=rs.getString("typeofstudent")%>">
    <h2>Current College</h2>
     <p style="font-size:23px; color:gold;"><b><u><%=rs.getString("oldcourse") %></u></b></p>
    <h2>Current Program</h2>
     <p style="font-size:23px; color:gold;"><b><u><%=rs.getString("oldprogram") %></u></b></p>
     
    <%} 
    } catch(Exception e) {
    	out.print(e);
    } %>
    </center>
    <img id="imageToSwap" src="images/d.gif" />
  </div>
 
  <div class="column">
    <center>
    <h2>Outgoing College</h2>
    <select id="country" name="outgoing_college">

</select>
    <h2>Outgoing Program</h2>
    <select id="state" name="outgoing_program">

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

		 	<fieldset>
		 	 <div class="announcement">
  <h3>Instructions</h3>
  <p>1.) File Must Be In JPEG format.</p>
  <p>2.) Maximum file size is 2MB.</p>
  <p>3.) Filename must be in this format: <strong>studentnumber-documentname*</strong></p>
  <h3>Documents Needed:</h3>
  <p>1.) Official OTR (studentnumber-otr)</p>
  <p>2.) Certificate of Good Moral (studentnumber-goodmoral)</p>
  <p>3.) Letter to the Dean (studentnumber-lettertodean)</p>
  <p>4.) Letter to the Guidance(studentnumber-lettertoguidance)</p>
  <p>5.) Photocopy of ID (studentnumber-id)</p>
</div><br>

		<center>
		  <input type="file" size="50" name="requirements_images" type="file" multiple="multiple"> 
		</center>
 
</table>
		
		 </fieldset>
        
		
	
</div>
<br><br>
   <center>
   <button type = "button" onclick="goback()" class="btn btn-warning btn-lg">Back</button>
   <button onclick="step1Submit()" class="btn btn-warning btn-lg">Shift Now</button>
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
<script language="javascript">
populateCountries("country", "state");
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
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
;</script>
</body>
</html>