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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
var country_arr = new Array
(
<% 
String getColleges = "SELECT * FROM faculty ORDER BY faculty_name";
String getCourses = "SELECT * FROM courses ORDER BY faculty";
try{
PreparedStatement pst = conn.prepareStatement(getColleges);
ResultSet colleges = pst.executeQuery();
while(colleges.next()) { 
	
	
%>
//Notice the quotation marks
"<%= colleges.getString("faculty_name") %>",

<%	
}
}catch(Exception e) {
	e.printStackTrace();
}
%>
);
<%
try{
	PreparedStatement pst = conn.prepareStatement(getColleges);
	PreparedStatement pst2 = conn.prepareStatement(getCourses);
	ResultSet colleges = pst.executeQuery();
	int index = 1;
	%>
	var s_a = new Array();
	s_a[0] = "";
	<%
	while(colleges.next()){
		ResultSet courses = pst2.executeQuery();
		String[] courseArray = new String[15];
		int arrayIndex = 0;
		%>
		<%
		while(courses.next()){
			if(courses.getString("faculty").equals(colleges.getString("faculty_name")))
			{
				courseArray[arrayIndex] = courses.getString("courses_name");
				arrayIndex++;
			}
			
		}
	    int count = 0;
	    for(String S : courseArray){
	        if (S != null)
	            ++count;
		}
	    String[] courseArrayFinal = new String[count];
	    int indexCount = 0;
	    for(String S : courseArray){
	        if (S != null)
	        	courseArrayFinal[indexCount] = S;
	            ++indexCount;
		}
		String coursesString = String.join("|", courseArrayFinal);
		%>
		s_a[<%= index %>] = "<%= coursesString %>";
		<%
		index++;
	}
}catch(Exception e) {
	e.printStackTrace();
}

%>
//Courses


function populateStates(countryElementId, stateElementId) {

 var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

 var stateElement = document.getElementById(stateElementId);

 stateElement.length = 0; // Fixed by Julian Woods
 stateElement.options[0] = new Option('------Select Program------', '');
 stateElement.selectedIndex = 0;

 var state_arr = s_a[selectedCountryIndex].split("|");

 for (var i = 0; i < state_arr.length; i++) {
     stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
 }
}

function populateCountries(countryElementId, stateElementId) {
 // given the id of the <select class="form-control"> tag as function argument, it inserts <option> tags
 var countryElement = document.getElementById(countryElementId);
 countryElement.length = 0;
 countryElement.options[0] = new Option('------Select Faculty------', '-1');
 countryElement.selectedIndex = 0;
 for (var i = 0; i < country_arr.length; i++) {
     countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
 }

 // Assigned all countries. Now assign event listener for the states.

 if (stateElementId) {
     countryElement.onchange = function () {
         populateStates(countryElementId, stateElementId);
     };
 }
}
</script>
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
			<center><img src="DisplayProfileTransfer?pkey=<%=rs.getString("userid")%>" width ="150" height = "150">
			<%} }catch(SQLException e) {out.print(e);} %>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Transfer-Welcome.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Transfer-Transferring.jsp"class="active"><span class="glyphicon glyphicon-random"></span> Transferring</a></li>
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
   STEP 2: TAKE EXAM
   </a>
   </center>
</div>
       <br>     
<%
         PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ? AND exam_schedule_date is NOT NULL");
         ps.setString(1, getuser);
         ResultSet rs = ps.executeQuery();
         if(!rs.next()) {
      	 response.sendRedirect("Transfer-Step1Done.jsp");
       }
  
         %>
</div>

<div class="container">
       
        <div class="jumbotron">
        
        <% try{
        	PreparedStatement p = conn.prepareStatement("SELECT * FROM exam_schedules_transferees WHERE transferee_id = ?");
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
   
</div>

<div class="footer"></div>

 
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

</script>
</body>
</html>