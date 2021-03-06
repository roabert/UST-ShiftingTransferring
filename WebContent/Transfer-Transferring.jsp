<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
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
String getCourses = "SELECT * FROM courses WHERE status = 'active' ORDER BY faculty";
try{
PreparedStatement pst = conn.prepareStatement(getCourses);
ResultSet colleges = pst.executeQuery();
while(colleges.next()) { 
	
	
%>
//Notice the quotation marks
"<%= colleges.getString("courses_name") %>",

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
			
		%>
		s_a[<%= index %>] = "<%= courses.getString("faculty") %>";
		<%

			index++;
		}
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
 stateElement.selectedIndex = 1;

 var state_arr = s_a[selectedCountryIndex].split("|");

 for (var i = 0; i < state_arr.length; i++) {
     stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
 }
}

function populateCountries(countryElementId, stateElementId) {
 // given the id of the <select class="form-control"> tag as function argument, it inserts <option> tags
 var countryElement = document.getElementById(countryElementId);
 countryElement.length = 0;
 countryElement.options[0] = new Option('------Select Program------', '-1');
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
<title>Step 1: Transferees</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	%>
	 <script>
	 	window.location.href = 'logout.jsp';
	 </script>
	<%
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
    <li><a href="logout.jsp?userset=<%=getuser%>"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
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
    STEP 1: Choosing your course and Uploading Requirements
   </a>
   </center>
</div>
       <br>     
       <%
String webpage = "";
       
PreparedStatement pm = conn.prepareStatement("SELECT * FROM student_transfer WHERE userid = ? AND passwordchanged is NULL");
pm.setString(1, getuser);
ResultSet rm = pm.executeQuery();
if(rm.next()) {
	
		out.print("<script type = \"text/javascript\"> $(window).on('load',function(){  $('#changepassword').modal({backdrop: 'static', keyboard: false, show: true});  });</script>");
	
}

PreparedStatement pss = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (osa_verified = 'Disapproved' OR dean_verified = 'Disapproved' OR secgen_verified = 'Disapproved' OR ofad_verified = 'Disapproved')");
pss.setString(1, getuser);
ResultSet rss = pss.executeQuery();
if(rss.next()) {

%>
 <script>
 	window.location.href = 'Transfer-TransferFailed.jsp';
 </script>
<%
}

PreparedStatement pst = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (dean_verified = 'In-progress' OR secgen_verified = 'In-progress' OR osa_verified = 'In-progress' OR ofad_verified = 'In-progress')");
pst.setString(1, getuser);
ResultSet rst = pst.executeQuery();
if(rst.next()) {

%>
 <script>
 	window.location.href = 'Transfer-Step1Done.jsp';
 </script>
<%
}

PreparedStatement pss1 = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ? AND exam_schedule_date is NULL");
pss1.setString(1, getuser);
ResultSet rss1 = pss1.executeQuery();
if(rss1.next()) {

%>
 <script>
 	window.location.href = 'Transfer-Step1Done.jsp';
 </script>
<%
} 

PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM transferees_exams WHERE transferee_id = ? AND (exam_schedule_date is not NULL AND exam_taken is NULL)");
ps1.setString(1, getuser);
ResultSet rs1 = ps1.executeQuery();
if(rs1.next()) {

%>
 <script>
 	window.location.href = 'Transfer-Transferring-2.jsp';
 </script>
<%
} 

PreparedStatement pss2 = conn.prepareStatement("SELECT * FROM transferees_scores WHERE transferee_id = ? AND dean_reviewed = 'Disapproved'");
pss2.setString(1, getuser);
ResultSet rss2 = pss2.executeQuery();
if(rss2.next()) {

%>
 <script>
 	window.location.href = 'Transfer-TransferFailedExam.jsp';
 </script>
<%
} 
PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM transferees_indorsement WHERE transferee_id = ? AND registrar_indorsed is NULL");
ps2.setString(1, getuser);
ResultSet rs2 = ps2.executeQuery();
if(rs2.next()) {

%>
 <script>
 	window.location.href = 'Transfer-Memo.jsp';
 </script>
<%
} 
PreparedStatement ps3 = conn.prepareStatement("SELECT * FROM transferees_indorsement WHERE transferee_id = ?  AND (secgen_indorsed = 'In-progress' OR registrar_indorsed = 'In-progress')");
ps3.setString(1, getuser);
ResultSet rs3 = ps3.executeQuery();
if(rs3.next()) {

%>
 <script>
 	window.location.href = 'Transfer-MemoDone.jsp';
 </script>
<%
} 
PreparedStatement ps4 = conn.prepareStatement("SELECT * FROM transferees_indorsement WHERE transferee_id = ? AND (transfer_transferring_approved = 'Approved' OR secgen_indorsed = 'Approved')");
ps4.setString(1, getuser);
ResultSet rs4 = ps4.executeQuery();
if(rs4.next()) {

%>
 <script>
 	window.location.href = 'Transfer-Transferring-Done.jsp';
 </script>
<%
}
%>
</div>

     <div class="container">
     <br>
     <form id="step1transfer" onsubmit = "false" enctype="multipart/form-data">
     <div id = "choosecollege" class="jumbotron">
     
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
<<<<<<< HEAD
        <h2>Please choose your destined course/program: </h2>
    <select class="form-control" style="width:600px; max-width:100%;" id="state" name="outgoing_program">
=======
    <h2>Select Program</h2>
    <select class="form-control" style="width:600px; max-width:100%;" id="country" name="outgoing_program">

</select> <br>
    <h2>College of Program</h2>
    <select class="form-control" style="width:600px; max-width:100%;" id="state" name="outgoing_college">
>>>>>>> 36120255b90951ed1eb03ac933bb578cef4d52db

</select><br>
    <h2>Faculty</h2>
    <select class="form-control" readonly style="width:600px; max-width:100%;" id="country" name="outgoing_college">

</select> 


   <br>
  
  <br><br>
 
  <button type = "button" onclick="nextstep()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-chevron-right"></span> Next</button>
  </center>
 </div>
 <div id = "fileuploading" class="jumbotron">
    <div class="container">

		 	<fieldset>
		 	 <div class="announcement">
 <h3>Instructions</h3>
  <p>1.) File Must Be In JPEG format.</p>
  <p>2.) Maximum file size is 2MB.</p>
  <p>3.) All files must be in the same folder.</p>
  <h3>Documents Needed:</h3>
  <p>1.) Official OTR</p>
  <p>2.) Certificate of Good Moral.</p>
  <p>3.) Letter of Intent to the Dean</p>
  <p>4.) Letter of Intent to the Guidance</p>
</div><br>
		<center>
		  <input type="file" size="50" id="requirements_images" name="requirements_images" type="file" accept="image/*" multiple="multiple"> 
		</center>
   
		 </fieldset>
        
		
	
</div>
<br><br>
   <center>
   <button type = "button" onclick="goback()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-chevron-left"></span> Back</button>
   <button onclick="step1Submit()" id="submit-button" class="btn btn-warning btn-lg" disabled><span class="glyphicon glyphicon-check"></span> Submit</button>
   </center>
 </div>
 </form>
    <br> <br><br><br><br><br><br>
          </div>
          <br><br><br><br><br><br><br>
   </div>    
   
</div>

<div class="footer"></div>

 
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>
  <div class="modal fade" role="dialog" id="changepassword">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
          <div class="modal-header" style="background-color:#EFB652">
          <h4 class="modal-title"><span class="glyphicon glyphicon-lock"></span> Transferee change password</h4>
          </div>
          <form onsubmit ="return false" id = "changepasswordform">
          <div class="modal-body">
      
           <input type="hidden" name="getuser" value="<%=getuser%>">
          <h4>Default passwords must be changed after registering.</h4>
          <br>
             <center>
             
              <table class="table">
                <tr> 
                   <td>Password: </td>
                   <td><input type="password" class="form-control" id="password1" name="change_password" required></td>
                </tr>
                   <tr> 
                   <td>Confirm Password: </td>
                   <td><input type="password" class="form-control" id="passwordconfirm" name="change_retypepassword"  required></td>
                </tr>
              </table>
           
             </center>
          </div>
          <div class="modal-footer">
          <button type="button" onclick = "changePassword()" class="btn btn-warning btn-md" value="Submit">Change Password</button>          
          </div>
             </form>
      </div>
    </div>
 </div>
  
  
  <script language="javascript">
populateCountries("country", "state");
</script>
<script>

//$('#changepassword').modal({backdrop: 'static', keyboard: false})  

function id(x) {
	return document.getElementById(x);
}
function changePassword() {
	var pw1 = id("password1").value;
	var pw2 = id("passwordconfirm").value;
  if(pw1.length > 0 && pw2.length > 0) {	
	if(pw1 == pw2) {
		id("changepasswordform").action = "NewPassword";
		id("changepasswordform").method = "post";
		id("changepasswordform").submit();
	}
	else {
		alert('Passwords are not the same!');
	}
  }
  else {
	  alert('Please input the fields.');
  }
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
	var faculty = id("country");
	var selectedfaculty = faculty.options[faculty.selectedIndex].text;
	var course = id("state");
	var selectedcourse = course.options[course.selectedIndex].text;
  if(selectedfaculty != "------Select Faculty------" && selectedcourse != "" && selectedcourse != "------Select Program------") {
	id("choosecollege").style.display = "none";
	id("fileuploading").style.display = "block";
  }
  else {
	  alert('Choose your destined course and program.');
  }
}
function goback() {
	id("choosecollege").style.display = "block";
	id("fileuploading").style.display = "none";
}
function step1Submit() {
	id("step1transfer").method = "post";
	id("step1transfer").action = "Requirements_Upload";
	id("step1transfer").submit();
}

$(document).ready(function() {
	  $('#requirements_images').change(function() {
	    if (this.files.length > 4){
	     alert('Too many files! Keep it exactly 4 files with each requirement as its own file')
	     document.getElementById("submit-button").disabled = true;}
	    else if (this.files.length < 4){
		 alert('Too few files! Keep it exactly 4 files with each requirement as its own file')
		 document.getElementById("submit-button").disabled = true;}
	    else if (this.files.length == 4){
		 alert('Tip: Make sure to recheck your requirements before submitting them')
		 document.getElementById("submit-button").disabled = false;}
	  });
	});
	
var file = document.getElementById('requirements_images');

file.onchange = function(e){
    var ext = this.value.match(/\.([^\.]+)$/)[1];
    switch(ext)
    {
        case 'jpg':
            break;
        default:
            alert('Supported file types are only .jpg files');
            this.value='';
   		 	document.getElementById("submit-button").disabled = false;
    }
};	
</script>
</body>
</html>