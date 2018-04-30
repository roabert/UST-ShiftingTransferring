<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
       <%@ page import = "java.util.Date" %>
    <%@ page import = "java.text.*" %>
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

<meta charset="ISO-8859-1">
<title>Step 3: | Memo</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("shifteruser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}	
%>

<div off-canvas="slidebar-1 left reveal">
		
		<br>
			 <%
    
    String returnsql1 = "SELECT * FROM student_shifter WHERE studentid = ?";
    try{
    PreparedStatement psts = conn.prepareStatement(returnsql1);
    psts.setString(1, getuser);
    ResultSet rs = psts.executeQuery();
     
    while(rs.next()) {
    %>
    <navhead>
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
  
 STEP 3: FILL UP MEMO
   </a>
   </center>
</div>
<br>
</div>
     <div class="container">
    <br><br>

<div class="announcement jumbotron">
<br>
<form onsubmit = "return false" id = "shiftermemo_form">
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
String date = sdf.format(new Date());
try {
	
 PreparedStatement p = conn.prepareStatement("SELECT * FROM student_shifter WHERE studentid = ?");
 p.setString(1, getuser);
 ResultSet r = p.executeQuery();
 while(r.next()) {
%>
<input type="hidden" name="getstudent" value="<%=getuser%>">
Student Number: <input type="text" class="" id="fname" value = "<%=r.getString("studentid") %>" name="studentid" placeholder="Student Number" > Date: <input type="text" class="" align="right" value = "<%=date %>" name="date" placeholder="Date today" ><br><br>
<p>I, <input type="text" class="" id="fname" name="fullname" value = "<%=r.getString("firstname") %> <%=r.getString("middlei") %> <%=r.getString("lastname") %>" placeholder="Full name here"  style="width:500px"  > wish to apply admission to the
Faculty/College/Institute <br><br><input type="text" class="" id="fname" value = "<%=r.getString("newcourse") %>" name="newcourse" placeholder="Outgoing Faculty"  style="width:500px"  >,
Term # <select name="semester" placeholder="Term #" style="width:100px">
  <option value = "NA"  selected>--</option>
  <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
</select>AY 20- <input type="text" class="" id="firstyear" onchange="incrementFirstYear(this.value)" name="firstyear" placeholder="" style="width:60px"> 
- 20<input type="text" class="" id="secondyear" name="secondyear" placeholder="" style="width:60px"> <br><br> My complete college attendance to date:  <input type="text" class="" id="fname" value="<%=r.getString("oldcourse") %>" name="currentcourse" placeholder="Current Faculty" style="width:500px"  >
</p>
<center>
<div class="row">
<div class="col-sm-6">
<table class="table-year">
   <tr>
  
    <td>Term <select name="firstterm" style="width:100px">
    <option value = "NA"  selected>--</option>
      <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select> 
    AY 20- <input type="text" class="" id="firstterm_1year" onchange="firstTerm1year(this.value)" name="firstterm_1year" placeholder="" style="width:60px">
- 20<input type="text" class="" id="firstterm_2year" name="firstterm_2year" placeholder="" style="width:60px"></td>
   
  </tr> 
     <tr>
 
    <td>Term <select id="fname" name="secondterm" style="width:100px" class="">
      <option value = "NA"  selected>--</option>
      <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select>
     AY 20- <input type="text" class="" id="secondterm1_year" onchange="secondTerm1year(this.value)" name="secondterm_1year" placeholder="" style="width:60px">
- 20<input type="text" class="" id="secondterm_2year" name="secondterm_2year" placeholder="" style="width:60px"></td>
  </tr> 
     <tr>

    <td>Term <select id="fname" name="thirdterm" placeholder="" style="width:100px">
    <option value = "NA"  selected>--</option>
       <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select>
     AY 20- <input type="text" onchange="thirdTerm1year(this.value)" id="thirdterm_1year" name="thirdterm_1year" placeholder="" style="width:60px">
- 20<input type="text" class="" id="thirdterm_2year" name="thirdterm_2year" placeholder="" style="width:60px"></td>
 
  </tr> 
     <tr>

    <td>Term <select id="fname" name="fourthterm" placeholder="" style="width:100px">
    <option value = "NA"  selected>--</option>
      <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
     </select>
     AY 20- <input type="text" id="fourthterm_1year" onchange="fourthTerm1year(this.value)" name="fourthterm_1year" placeholder="" style="width:60px">
- 20<input type="text" class="" id="fourthterm_2year" name="fourthterm_2year" placeholder="" style="width:60px"></td>

  </tr> 
 
</table>
</div>
<div class="col-sm-6">
<table class="table-year">
   <tr>
  
    <td>Term <select name="fifthterm" style="width:100px">
    <option value = "NA"  selected>--</option>
      <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select> 
    AY 20- <input type="text" id="fifthterm_1year" onchange="fifthTerm1year(this.value)" name="fifthterm_1year" placeholder="" style="width:60px">
- 20<input type="text" id="fifthterm_2year" name="fifthterm_2year" placeholder="" style="width:60px"></td>
   
  </tr> 
     <tr>
 
    <td>Term <select id="fname" name="sixthterm" style="width:100px" class="">
    <option value = "NA"  selected>--</option>
       <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select>
     AY 20- <input type="text" id="sixthterm_1year" onchange="sixthTerm1year(this.value)" name="sixthterm_1year" placeholder="" style="width:60px">
- 20<input type="text" id="sixthterm_2year" onchange="sixthTerm1year(this.value)" name="sixthterm_2year" placeholder="" style="width:60px"></td>
  </tr> 
     <tr>

    <td>Term <select id="fname" name="seventhterm" placeholder="" style="width:100px">
    <option value = "NA"  selected>--</option>
       <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
    </select>
     AY 20- <input type="text" id="seventhterm_1year" onchange="seventhTerm1year(this.value)" name="seventhterm_1year" placeholder="" style="width:60px">
- 20<input type="text" class="" id="seventhterm_2year" name="seventhterm_2year" placeholder="" style="width:60px"></td>
 
  </tr> 
     <tr>

    <td>Term <select id="fname" name="eightterm" placeholder="" style="width:100px">
    <option value = "NA"  selected>--</option>
      <option value = "Summer Term">Summer Term</option>
      <option value="1st Term">1st Term</option>
      <option value="2nd Term">2nd Term</option>
     </select>
     AY 20- <input type="text" id="eightterm_1year" onchange="eightTerm1year(this.value)" name="eightterm_1year" style="width:60px">
- 20<input type="text" class="" id="eightterm_2year" name="eightterm_2year" style="width:60px"></td>

  </tr> 
 
</table>
</div>
</div><br><br>
<input type="checkbox" name="termsandcondition" value="Agree" id="termcheckbox">I agree that my enrollment will be AUTOMATICALLY CANCELLED if it turns out that I have been debarred from the prevoius college.
<br><br>
<button onClick="submitMemo()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-chevron-right"></span> Submit</button>

</center>
<%}}catch(SQLException e) {out.print(e);} %>
 </form>
 
</div>
     <br><br><br><br><br><br><br>
          </div>
  </div>
   
					

</div>
  <br><br><br><br><br>
 <div class="footer"></div>
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>
  
  <script language="javascript">
populateCountries("country", "state");
</script>
<script>
function checkYear() {
	
	var OyO = document.getElementById(firstterm_1year).value;
	var OyT = document.getElementById(firstterm_2year).value;
	var TyO = document.getElementById(secondterm_1year).value;
	var TyT = document.getElementById(secondterm_2year).value;
	var ThyO = document.getElementById(thirdterm_1year).value;
	var ThyT = document.getElementById(thirdterm_2year).value;
	var FyO = document.getElementById(fourthterm_1year).value;
	var FyT = document.getElementById(fourthterm_2year).value;
	var FiyO = document.getElementById(fifthterm_1year).value;
	var FiyT = document.getElementById(fifthterm_2year).value;
	var SyO = document.getElementById(sixthterm_1year).value;
	var SyT = document.getElementById(sixthterm_2year).value;
	var SeyO = document.getElementById(seventhterm_1year).value;
	var SeyT = document.getElementById(seventhterm_2year).value;
	var EyO = document.getElementById(eightterm_1year).value;
	var EyT = document.getElementById(eightterm_2year).value;
}
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
function submitMemo() {
	var terms = id("termcheckbox");
	if(terms.checked == true) {
	id("shiftermemo_form").method = "post";
	id("shiftermemo_form").action = "SubmitMemoProcess";
	id("shiftermemo_form").submit();
	}
	else {
		alert('You must agree first the condition!');
	}
}

function incrementFirstYear(num) {
	var newnum = ++num;
	document.getElementById("secondyear").value = newnum;
}

function firstTerm1year(num) {
	var newnum = ++num;
	document.getElementById("firstterm_2year").value = newnum;
}
function secondTerm1year(num) {
	var newnum = ++num;
	document.getElementById("secondterm_2year").value = newnum;
}
function thirdTerm1year(num) {
	var newnum = ++num;
	document.getElementById("thirdterm_2year").value = newnum;
}
function fourthTerm1year(num) {
	var newnum = ++num;
	document.getElementById("fourthterm_2year").value = newnum;
}
function fifthTerm1year(num) {
	var newnum = ++num;
	document.getElementById("fifthterm_2year").value = newnum;
}
function sixthTerm1year(num) {
	var newnum = ++num;
	document.getElementById("sixthterm_2year").value = newnum;
}
function seventhTerm1year(num) {
	var newnum = ++num;
	document.getElementById("seventhterm_2year").value = newnum;
}
function eightTerm1year(num) {
	var newnum = ++num;
	document.getElementById("eightterm_2year").value = newnum;
}


</script>
</body>
</html>