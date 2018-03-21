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
<title>OFAD | Exam Schedule</title>
<script>
$(document).ready(function() {

	$('.fancybox').fancybox(); 
	
	})
</script>
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
			<h1>OFAD<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Ofadpage.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Transactions</a>
    <ul class="submenu">
        <li><a href="OfadTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="OfadExamScheduler.jsp" class="active"><span class="glyphicon glyphicon-list-alt"></span> Exam Scheduling</a>
     
    </li>
 <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Encode Scores</a>
  <ul class="submenu">
        <li><a href="OfadScores_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadScores_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
   
   Exam Scheduler
   </a>
   </center>
</div>
<br>
 <div id="content">
    <div class="container">
<br>
            
            <form action="javascript:;">
            <button class="btn btn-lg btn-warning pull-right" type="button" data-target=".createsched" data-toggle="modal">
            Create Exam Schedule
            </button>
            </form>
</div>
     
    <br>
       
              
           <ul class = "nav nav-tabs">
          <li class="active"><a href="OfadExamScheduler.jsp">Shifters</a></li>
          <li><a href="OfadExamScheduler2.jsp">Transferees</a></li>
          </ul>
          <div class="tab-content">
          <fieldset>
          <div class="table-responsive" style="overflow-x:auto; height:500px;">
              <table class="table table-stripped table-sortable">
              <thead>
                 <th>Date</th>
                 <th>Time</th>
                 <th>Venue</th>
                 <th>Remarks</th>
                 <th>View Students</th>
                 <th></th>
              </thead>
              <tbody>
              <%
               try{
            	   PreparedStatement p = conn.prepareStatement("SELECT DISTINCT(date), start_time, end_time, remarks FROM exam_schedules_shifters");
            	   ResultSet r = p.executeQuery();
            	     if(!r.next()){
            	        	out.println("<tr><p style=color:red>No exam schedule set for students</p></tr>");
            	        }
            	        else {
            	           do {
              %>
              <tr>
                <td><%=r.getString("date") %></td>
                <td><%=r.getString("start_time") %> - <%=r.getString("end_time") %></td>
                <td>Venue?</td>
                <td><%=r.getString("remarks") %></td>
                <td><a  class="fancybox" href="#<%=r.getString("date") %>">View Students</a></td>
                <td><button type="submit" class="btn btn-warning">Edit</button></td>
              </tr>
			    <div id="<%=r.getString("date") %>" style="width:400px;display: none;">
					<%
						PreparedStatement p2 = conn.prepareStatement("SELECT * FROM shifters_exams where exam_schedule_date = ?");
						p2.setString(1, r.getString("date"));
	            	   	ResultSet r2 = p2.executeQuery();
	            	   	while(r2.next()){
						PreparedStatement p3 = conn.prepareStatement("SELECT * FROM student_shifter where studentid = ?");
						p3.setString(1, r2.getString("shifter_id"));
	            	   	ResultSet r3 = p3.executeQuery();
	            	   	while(r3.next()){
	            	   		%>
	            	   		<p><%=r3.getString("studentid") %> - <%=r3.getString("lastname") %>, <%=r3.getString("firstname") %>, <%=r3.getString("middlei") %></p>
	            	<% 
	            	   		}
					 
            	        }
					%>
				</div>
              <%}while(r.next());
                    }
               } catch(SQLException e) {out.print(e);}
              %>
              </tbody>
              </table>
              </div>
          </fieldset>
          </div>
          </div>
    
</div>
</div>

<div class="footer"></div>
<div class="modal fade createsched" role="dialog">
   <div class="modal-dialog modal-lg" style="width:1250px;">
      <div class="modal-content">
         <div class="modal-header" style="background-color:black">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <p class=""><i>Create Schedule</i></p>
         </div>
         <form action="CreateScheduleProcess" method="post">
         <div class="modal-body" style="overflow-x:auto;">
          <div class="container">
            
           <table>
           <tr>
              <th>  <h4>Date of Exam</h4></th>
              <th> <input type = "date" class="form-control" name = "examdate"></th>
       </tr>
          <tr>
               <th> <h4>Start Time</h4></th>
               <th><input type = "time" class="form-control" name = "starttime"></th>
          </tr>
           <tr>
               <th> <h4>End Time</h4></th>
               <th><input type = "time" class="form-control" name = "endttime"><br></th>
               </tr>
            </table><br><br>
         
            
            <legend><p>List of students for examination(Shifters)</p></legend>
            <div style="border-style:groove;">
            <br>
           <div class="table-responsive" style="overflow:auto; height:300px;">
           <center>
             <table class="table">
                 <tr>
                 <th><input type="checkbox" value="<%%>"></th>
                 <th>ID</th>
                 <th>Student Name</th>
                 <th>Outgoing</th>
                 </tr>
                 <%try {
               	  PreparedStatement ps = conn.prepareStatement("SELECT shifter_id, lastname, firstname, middlei, newcourse, newprogram FROM shifters_exams INNER JOIN student_shifter on shifters_exams.shifter_id = student_shifter.studentid WHERE exam_schedule_date is NULL");
               	  ResultSet rs = ps.executeQuery();
                 while(rs.next()) { %>
                 <tr>
                  <td><input type="checkbox" name="selectshifters" value ="<%=rs.getString("shifter_id") %>"></td>
                  <td><%=rs.getString("shifter_id") %></td>
                  <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
                  <td><%=rs.getString("newcourse") %>, <%=rs.getString("newprogram") %></td>
                  </tr>
                   <%
                   }  
                 } catch(SQLException e){out.print(e);} %>
             </table>
         </center>
         </div>
        
         <!--    <div id = "transferees" class="tab-pane fade">
            <div class="table-responsive" style="overflow:auto; height:300px;">
           <center>
             <table class="table">
                 <tr>
                 <th><input type="checkbox" value="<%%>"></th>
                 <th>ID</th>
                 <th>Student Name</th>
                 <th>Outgoing</th>
                 </tr>
                 <%try {
               	  PreparedStatement ps2 = conn.prepareStatement("SELECT transferee_id, lastname, firstname, middlei, newcourse, newprogram FROM transferees_exams INNER JOIN student_transfer on transferees_exams.transferee_id = student_transfer.userid WHERE exam_schedule_date is NULL");
               	  ResultSet rs2 = ps2.executeQuery();
                 while(rs2.next()) { %>
                 <tr>
                  <td><input type="checkbox" name="selectstransferees" value ="<%=rs2.getString("transferee_id") %>"></td>
                  <td><%=rs2.getString("transferee_id") %></td>
                  <td><%=rs2.getString("lastname") %>, <%=rs2.getString("firstname") %> <%=rs2.getString("middlei") %></td>
                  <td><%=rs2.getString("newcourse") %>, <%=rs2.getString("newprogram") %></td>
                  </tr>
                   <%
                   }  
                 } catch(SQLException e){out.print(e);} %>
             </table>
         </center>
         </div>
            </div> -->
            
             <br>
            
         </div>
           
            </div>
            
            <br>
            <center>   <textarea rows="10" cols="100%" name = "exam_remarks" placeholder="Remarks"></textarea><br><br>
           </center>
         </div>
         <div class="modal-footer">
           <button type="submit" class="btn btn-warning">Submit</button>
         </div>
         </form>
      </div>
   </div>
</div>

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