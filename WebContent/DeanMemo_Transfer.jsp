<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
<link rel="stylesheet" href="CSS/styles.css"type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="datatables/css/jquery.dataTables.min.css"type="text/css">
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="fancybox/lib/jquery.mousewheel.pack.js?v=3.1.3"></script>
<!-- Add fancyBox main JS and CSS files -->
<script type="text/javascript" src="fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
<link rel="stylesheet" type="text/css" href="fancybox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
<!-- Add Button helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<!-- Add Thumbnail helper (this is optional) -->
<link rel="stylesheet" type="text/css" href="fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
<!-- Add Media helper (this is optional) -->
<script type="text/javascript" src="fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

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
		<navhead>
		<br>
		
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Dean<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Deanpage.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href=""><span class="glyphicon glyphicon-random"></span> Transactions</a>
    <ul class="submenu">
        <li><a href="DeanTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
    <li><a href=""><span class="glyphicon glyphicon-list-alt"></span> Exam Results</a>
      <ul class="submenu">
        <li><a href="DeanExam_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanExam_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
  <li><a href="" class="active"><span class="glyphicon glyphicon-folder-open"></span> Memo</a>
  <ul class="submenu">
        <li><a href="DeanMemo_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanMemo_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
 </li>
    <li><a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
  </ul>
</nav>
			</div>



		</div>
<div canvas="contain">
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
MEMO: TRANSFERRING
   </a>
   </center>
</div>
<br>
   <div id="content">
    <div class="container">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-striped table-sortable">
        <thead>        
          <th>Student Name</th> 
          <th>Incoming</th>
          <th>Memo</th>
          <th>Finish</th>
        </thead>
        <% %>
        <tbody>
        <!-- Obar dito mo lagay sa loob nito yung loop na nagooutput nung students -->
        </tbody>
      </table>
      </center>
      </div>
  </fieldset>
  </div>
  </div>
</div>
</div>
 <div class="footer"></div>

		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>


<script>
$(document).ready(function() {
    $('table.table-sortable').DataTable();
});

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