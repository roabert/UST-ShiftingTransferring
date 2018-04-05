<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
       <%@ page import = "java.util.Date" %>
    <%@ page import = "java.text.*" %>
   <% Connection conn = SingletonDB.getConnection(); %>
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
<title>Student Transfer | Memo</title>
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
<div class="memo jumbotron">
<br>
<form onsubmit = "return false" id = "transfermemo_form">
<%
  DateFormat format = new SimpleDateFormat("yyyy/mm/dd");
format.setLenient(false);
  Date date = new Date();
try {
	
 PreparedStatement p = conn.prepareStatement("SELECT * FROM student_transfer WHERE userid = ?");
 p.setString(1, getuser);
 ResultSet r = p.executeQuery();
 while(r.next()) {
%>
<input type="hidden" name="getstudent" value="<%=getuser%>">
 Date: <input type="text" class="form-control" align="right" value = "<%=format.format(date) %>" name="date" placeholder="Date today" ><br><br>
<p>I, <input type="text" class="form-control" id="fname" name="fullname" value = "<%=r.getString("firstname") %> <%=r.getString("middlei") %> <%=r.getString("lastname") %>" placeholder="Full name here"  style="width:500px"  > wish to apply admission to the
Faculty/College/Institute <br><br><input type="text" class="form-control" id="fname" value = "<%=r.getString("newcourse") %>" name="newcourse" placeholder="Outgoing Faculty"  style="width:500px"  >,
Term # <input type="text" class="form-control" id="fname" name="semester" placeholder="Term #" style="width:50px">AY 20- <input type="text" class="form-control" id="fname" name="firstyear" placeholder="" style="width:50px">
- 20<input type="text" class="form-control" id="fname" name="secondyear" placeholder="" style="width:50px"> <br><br> My complete college attendance to date:  <input type="text" class="form-control" id="fname" value="<%=r.getString("oldcourse") %>" name="currentcourse" placeholder="Current Faculty" style="width:500px"  >
</p>
<center>
<p>
<table class="table-year">
   <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" class="form-control" id="fname" name="firstterm" placeholder="" style="width:50px"> AY 20- <input type="text" class="form-control" id="fname" name="firstterm_1year" placeholder="" style="width:50px">
- 20<input type="text" class="form-control" id="fname" name="firstterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" class="form-control" id="fname" name="specialterm_1" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" class="form-control" id="fname" name="secondterm" placeholder="" style="width:50px"> AY 20- <input type="text" class="form-control" id="fname" name="secondterm_1year" placeholder="" style="width:50px">
- 20<input type="text" class="form-control" id="fname" name="secondterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" class="form-control" id="fname" name="specialterm_2" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" class="form-control" id="fname" name="thirdterm" placeholder="" style="width:50px"> AY 20- <input type="text" class="form-control" id="fname" name="thirdterm_1year" placeholder="" style="width:50px">
- 20<input type="text" class="form-control" id="fname" name="thirdterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" class="form-control" id="fname" name="specialterm_3" placeholder="" style="width:50px"></td>
  </tr> 
     <tr>
    <td>1st Term</td>
    <td>-</td>
    <td>2nd Term</td>
    <td>:</td>
    <td>Term <input type="text" class="form-control" id="fname" name="fourthterm" placeholder="" style="width:50px"> AY 20- <input type="text" class="form-control" id="fname" name="fourthterm_1year" placeholder="" style="width:50px">
- 20<input type="text" class="form-control" id="fname" name="fourthterm_2year" placeholder="" style="width:50px"></td>
    <td>:</td>
    <td>Special Term <input type="text" class="form-control" id="fname" name="specialterm_4" placeholder="" style="width:50px"></td>
  </tr> 
 
</table><br><br>
<input type="checkbox" name="termsandcondition" value="Agree" id="termcheckbox">I agree that my enrollment will be AUTOMATICALLY CANCELLED if it turns out that I have been debarred from the prevoius college.
</p><br><br>
<button onClick="submitMemo()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-chevron-right"></span> Submit</button>
</center>
<%}}catch(SQLException e) {out.print(e);} %>
 </form>
</div>
     
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
function submitMemo() {
	var terms = id("termcheckbox");
	if(terms.checked == true) {
	id("transfermemo_form").method = "post";
	id("transfermemo_form").action = "SubmitMemoTransferProcess";
	id("transfermemo_form").submit();
	}
	else {
		alert('You must agree first the condition!');
	}
}
</script>
</body>
</html>