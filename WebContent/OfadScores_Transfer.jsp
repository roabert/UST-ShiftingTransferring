<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
        <%@ page import = "DatabaseHandler.SingletonDB" %>
    <%@ page import = "ust.registrar.model.studentprocess.notification" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/styles.css"type="text/css">
<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
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
<title>OFAD | EXAM SCORES</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
}
notification notifs = new notification();
int totalShifters = notifs.getOFADShiftTransactions(conn);
int totalTransfers = notifs.getOFADTransferTransactions(conn);
int totalShiftersExam = notifs.getOFADShiftForSched(conn);
int totalTransfersExam = notifs.getOFADTransferForSched(conn);
int totalShiftersScores = notifs.getOFADShiftExams(conn);
int totalTransfersScores = notifs.getOFADTransferExams(conn);
%>


 <div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>OFAD<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			<nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Ofadpage.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Transactions <% if(totalShifters+totalTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
    <ul class="submenu">
        <li><a href="OfadTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalShifters>0){ %> <span class="notification"><% if(totalShifters<=99){ %> <%= totalShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfers>0){ %> <span class="notification"><% if(totalTransfers<=99){ %> <%= totalTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        
      </ul>
    </li>
      <li><a href="#"><span class="glyphicon glyphicon-ok-sign"></span> Approved Transactions</a>
    <ul class="submenu">
        <li><a href="OfadApprovedTransaction_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadApprovedTransaction_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="OfadExamScheduler.jsp" ><span class="glyphicon glyphicon-list-alt"></span> Exam Scheduling</a>
     
    </li>
 <li><a href="#" class="active"><span class="glyphicon glyphicon-pencil"></span> Encode Scores <% if(totalShiftersScores+totalTransfersScores>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
  <ul class="submenu">
        <li><a href="OfadScores_Shifter.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Shifters <% if(totalShiftersScores>0){ %> <span class="notification"><% if(totalShiftersScores<=99){ %> <%= totalShiftersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadScores_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfersScores>0){ %> <span class="notification"><% if(totalTransfersScores<=99){ %> <%= totalTransfersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
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
   
   EXAM SCORES: TRANSFEREES
   </a>
   </center>
</div>
<br>
 <div id="content">
    <div class="container-fluid">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-striped table-sortable">
      <thead>
        <tr>
          <th>ID</th>
          <th>Student Name</th>
          <th>Current School</th>
          <th>Current Course/Program</th>
          <th>Incoming Course/Program</th>
          <th>Math</th>
          <th>Science</th>
          <th>English</th>
          <th>IQ</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <%
         try{
        String displayscores = "SELECT * FROM transferees_scores INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE transferee_id is not NULL AND ofad_id is NULL";
        String displaystudent = "SELECT studentid, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newprogram, newcourse FROM student_shifter UNION SELECT id, lastname, firstname, middlei, typeofstudent, oldschool, oldprogram, newprogram, newcourse FROM student_transfer";
        PreparedStatement ps = conn.prepareStatement(displayscores); 
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {

        %>
        <tr>
        <td><%=rs.getString("transferee_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("oldschool") %></td>
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <form action="EncodeScoresTransfer" class="form-inline" method="post">
        <td>
		<input type="hidden" name="getstudent" value="<%=rs.getString("transferee_id") %>">
		<input type="hidden" name="getuser" value="<%=getuser%>">
		<input type = "number" id="math" size="30" min="0" max="100" oninput="validity.valid||(value='');" placeholder="Math" class="form-control" name="mathscore" required></td>
	    <td><input type = "number" id="sci" size="30" min="0" max="100" oninput="validity.valid||(value='');" placeholder="Sci" class="form-control" name="sciencescore" required></td>
	    <td><input type = "number" id="eng" size="30" min="0" max="100" oninput="validity.valid||(value='');" placeholder="Eng" class="form-control" name="englishscore" required></td>
	    <td><input type = "number" id="iq" size="30" min="0" max="100" oninput="validity.valid||(value='');" placeholder="IQ" class="form-control" name="iqscore" required></td>
	    <td>
	    	<button type="submit"  class="btn btn-warning" 
		onclick="return confirm('Are you sure? Changes cannot be done after submitting.')">Submit</button>
	    </td>
	    
			</form>
        </tr>
      
        <%}
        
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
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
} );
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