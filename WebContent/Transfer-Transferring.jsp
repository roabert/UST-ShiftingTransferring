<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
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
			<center><img src="DisplayProfileTransfer?pkey=<%=rs.getString("userid")%>" width ="120" height = "120">
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
   <a id="text_steps">
   <span style="font-size:30px;cursor:pointer;color: white; float:left" class="js-toggle-left-slidebar">&#9776;</span>
   STEP 1: SELECT OUTGOING PROGRAM
   </a>
   </center>
</div>
       <br>     
       <%
String webpage = "";
PreparedStatement pst = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (dean_verified = 'In-progress' OR secgen_verified = 'In-progress' OR osa_verified = 'In-progress' OR ofad_verified = 'In-progress')");
pst.setString(1, getuser);
ResultSet rst = pst.executeQuery();
if(rst.next()) {
	webpage = "Transfer-Step1Done.jsp";
	 response.sendRedirect(webpage);
}
PreparedStatement pss = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (osa_verified = 'Disapproved' OR dean_verified = 'Disapproved' OR ofad_verified = 'Disapproved')");
pss.setString(1, getuser);
ResultSet rss = pss.executeQuery();
if(rss.next()) {

	 response.sendRedirect("Transfer-TransferFailed.jsp");
}
PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ? AND exam_schedule_date is not NULL");
ps1.setString(1, getuser);
ResultSet rs1 = ps1.executeQuery();
if(rs1.next()) {
	
	 response.sendRedirect("Transfer-Transferring-2.jsp");
} 
PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM transferees_indorsement WHERE transferee_id = ?");
ps2.setString(1, getuser);
ResultSet rs2 = ps2.executeQuery();
if(rs2.next()) {
	
	 response.sendRedirect("Transfer-Memo.jsp");
} 
%>
</div>

     <div class="container">
     <form id="step1transfer" onsubmit = "false" enctype="multipart/form-data">
     <div id = "choosecollege">
     
     <br>  
      <%
      String getcoursesql = "SELECT * FROM student_transfer WHERE userid = ?";
    try{
    PreparedStatement ps = conn.prepareStatement(getcoursesql);
    ps.setString(1, getuser);
    ResultSet rs = ps.executeQuery();
    while(rs.next()) {
    %>
    <input type= "hidden" name="studentid" value = "<%=rs.getString("userid")%>">
    <input type= "hidden" name="typeofstudent" value = "<%=rs.getString("typeofstudent")%>">
    <%}
     } catch(Exception e) {
    	out.print(e);
    } %>
    <center>
    <h2>Outgoing College</h2>
    <select id="country" name="outgoing_college">

</select>
    <h2>Outgoing Program</h2>
    <select id="state" name="outgoing_program">

</select>

   <br>
    <img id="imageToSwap" src="images/d.gif" />
  <br><br>
 
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
  <p>3.) Filename must be in this format: <strong>lastname-firstname-document(otr/goodmoral.. etc))</strong></p>
  <h3>Documents Needed:</h3>
  <p>1.) Official OTR</p>
  <p>2.) Certificate of Good Moral.</p>
  <p>3.) Letter of Intent to the Dean</p>
  <p>4.) Letter of Intent to the Guidance</p>
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
   <button onclick="step1Submit()" class="btn btn-warning btn-lg">Transfer Now</button>
   </center>
 </div>
 </form>
          </div>
   </div>    
   
</div>

<div class="footer"></div>

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
	id("text_steps").innerHTML = "<a><span style=\"font-size:30px;cursor:pointer;color: white; float:left\" class=\"js-toggle-left-slidebar\">&#9776;</span>STEP 1: UPLOAD REQUIREMENTS</span></a>";
	id("choosecollege").style.display = "none";
	id("fileuploading").style.display = "block";
}
function goback() {
	id("text_steps").innerHTML = "<a><span style=\"font-size:30px;cursor:pointer;color: white; float:left\" class=\"js-toggle-left-slidebar\">&#9776;</span>STEP 1: SELECT OUTGOING PROGRAM</a>";
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