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
		<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="datatables/css/jquery.dataTables.min.css"type="text/css">
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Dean | Exam Results</title>
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
    <li><a href="Deanpage.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Transactions</a>
    <ul class="submenu">
        <li><a href="DeanTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="DeanExamResults.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Results</a>
      <ul class="submenu">
        <li><a href="DeanExam_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanExam_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
 <li><a href=""><span class="glyphicon glyphicon-folder-open"></span> Memo</a>
  <ul class="submenu">
        <li><a href="DeanMemo_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
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
   
   EXAM RESULTS : SHIFTERS
   </a>
   </center>
</div>


<br>
<br>
  <div id="content">
    <div class="container">
    
  <div class="container-fluid">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-striped">
        <thead>
        <tr>
          <th>ID</th>
          <th>Student Name</th>
          <th>Type</th>
          <th>Outgoing</th>
          <th>Incoming</th>
          <th>Score</th>
          <th>Remarks</th>
          <th>Finish</th>
        </tr>
       	</thead>
       	<tbody>
          <%
         try{
        String displaywithscore = "SELECT * FROM shifters_scores INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE dean_reviewed is NULL AND final_score is not NULL";
        String displaystudent = "SELECT studentid, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newprogram, newcourse FROM student_shifter UNION SELECT id, lastname, firstname, middlei, typeofstudent, oldschool, oldprogram, newprogram, newcourse FROM student_transfer";
        PreparedStatement ps = conn.prepareStatement(displaywithscore); 
        ResultSet rs = ps.executeQuery();
          if(!rs.next()) {
        	  out.print("<tr><p style=color:red>No scores of students encoded yet!</p></tr>");
          }
          else {
        	  do{
        %>
        <form action = "DeanVerifyScore" method = "post">
        <tr>
        <td><input type="hidden" name="getstudent" value="<%=rs.getString("shifter_id") %>"><%=rs.getString("shifter_id") %></td>
        <td><input type="hidden" name="getuser" value="<%=getuser%>"><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("typeofstudent") %></td>
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newprogram") %> - <%=rs.getString("newcourse") %></td>
        <td><%=rs.getString("final_score") %></td>
        <td><select class="form-control" name="studentstatus">
    <option value="Approved">Passed</option>
        <option value="Disapproved">Failed</option>
        </select></td>
        <td><button type="submit" onclick="return confirm('Are you sure? Changes will not be done once submitted.');" class="btn btn-warning">Submit</button></td>
        </tr>
        </form>
        <%} while(rs.next());
         }
           
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
</div>

<script src="scripts/slidebars.js"></script>
<script src="scripts/scripts.js"></script>



<script>
$(document).ready(function() {
    $('table.table').DataTable();
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
     
     <div class="footer"></div>
</body>
</html>