<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
      <%@ page import = "ust.registrar.model.studentprocess.processfailed" %>
     <% Connection conn = SingletonDB.getConnection(); %>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Process | Failed</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("shifteruser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
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
    %><navhead>
			<center><img src="DisplayProfilePic?pkey=<%=rs.getInt("studentid")%>" width ="150" height = "150">
			<%} }catch(SQLException e) {out.print(e);} %>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Shifter-Welcome.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Shifter-Shifting.jsp" class="active"><span class="glyphicon glyphicon-random"></span> Shifting</a></li>
    <li><a href="Shifter-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
    <li><a href="logout.jsp?userset=<%=getuser%>"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
  </ul>
</nav>
			</div>



		</div>
<div canvas="contain">
<div id="wrapper">
<div id="main">
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
 PROCESS CANCELLED
   </a>
   </center>
</div>
         <%
        
         %>
</div>

      <div class="container">
<br>
<br>
<%
   processfailed pf = new processfailed();
   pf.setGetstudentid(getuser);
   pf.displayRemarksShifter(conn);
 %>
       <center>
       <p><span class="glyphicon glyphicon-remove-sign" style="font-size:100px; color:red;"></span></p>
       <br><br><br>
         <p style="font-size:20px;">We regret to inform you that your application for transferring has failed.</p>
         <i style ="font-size:20px">
         <%if(pf.getDeanremarks() != null && pf.getOsgremarks() == null && pf.getOfadremarks() == null) {%>
         <%=pf.getDeanremarks() %>
         <%} else if(pf.getDeanremarks() == null && pf.getOsgremarks() != null && pf.getOfadremarks() == null) {%>
         <%=pf.getOsgremarks() %>
         <%} else if(pf.getDeanremarks() == null && pf.getOsgremarks() == null && pf.getOfadremarks() != null) {%>
         <%=pf.getOfadremarks()%>
         <%} else {}%>
         </i>
         <br>
         <br>
         
         <form action="RetryShifting" method="post">
         <% %>
         <input type="hidden" name="getuser_retry" value="<%=getuser%>">
         <button type="submit" class="btn btn-lg btn-warning"><span class="glyphicon glyphicon-refresh" style="color:white"></span> Retry Application</button>
         </form>
         
       </center>
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
;</script>
</body>
</html>