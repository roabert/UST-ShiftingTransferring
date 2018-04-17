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
<script src="datatables/js/jquery.dataTables.js"></script>
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
String getuser = (String)session.getAttribute("ofaduser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
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
        <li><a href="OfadApprovedTransactions_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadApprovedTransactions_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="OfadExamScheduler.jsp" class="active"><span class="glyphicon glyphicon-list-alt"></span> Exam Scheduling <% if(totalShiftersExam+totalTransfersExam>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
     
    </li>
 <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Encode Scores <% if(totalShiftersScores+totalTransfersScores>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
  <ul class="submenu">
        <li><a href="OfadScores_Shifter.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Shifters <% if(totalShiftersScores>0){ %> <span class="notification"><% if(totalShiftersScores<=99){ %> <%= totalShiftersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadScores_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfersScores>0){ %> <span class="notification"><% if(totalTransfersScores<=99){ %> <%= totalTransfersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        
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
    <div class="container-fluid">
<br>
            
            <form action="javascript:;">
            <button class="btn btn-lg btn-warning pull-right" type="button" data-target=".createsched" data-toggle="modal">
            Create Exam Schedule
            <% if(totalTransfersExam>0){ %> <span class="notification"><% if(totalTransfersExam<=99){ %> <%= totalTransfersExam %> <% }else{ %> 99+ <%} %></span> <% } %>
            </button>
            </form>
     
    <br><br>
           <ul class = "nav nav-tabs">
          <li><a href="OfadExamScheduler.jsp">Shifters <% if(totalShiftersExam>0){ %> <span class="notification alert-notif"><%= totalShiftersExam %></span> <% } %></a></li>
          <li class="active"><a href="OfadExamScheduler2.jsp">Transferees <% if(totalTransfersExam>0){ %> <span class="notification alert-notif"><%= totalTransfersExam %></span> <% } %></a></li>
          </ul>
          <div class="tab-content">
          <br>
          <fieldset>
          <div class="table-responsive" style="overflow:auto; ">
              <table class="table table-stripped table-sortable">
              <thead>
              <tr>
                  <th>Date</th>
                 <th>Time</th>
                 <th>Venue</th>
                 <th>Remarks</th>
                 <th>View Students</th>
          </tr>
              </thead>
			  <tbody>
              <%
              int count = 0;
               try{
            	   PreparedStatement p = conn.prepareStatement("SELECT DISTINCT(date), start_time, end_time, venue, remarks, exam_date_added FROM exam_schedules_transferees");
            	   ResultSet r = p.executeQuery();
            	     while(r.next()){
            	    	 count++;

              %>
              <tr>
                   <td><%=r.getString("date") %></td>
                <td><%=r.getString("start_time") %> - <%=r.getString("end_time") %></td>
                <td><%=r.getString("venue") %></td>
                <td><%=r.getString("remarks") %></td>
                <td><button class="fancybox btn" href="#<%=count %>">View Students</button></td>
           
              </tr>
               <div id="<%=count %>" style="width:500px;display: none; overflow:auto; height: 600px;">
			    <h3>Exam Schedule: <%=r.getString("date") %></h3><br>
					<%
						PreparedStatement p2 = conn.prepareStatement("SELECT * FROM transferees_exams where exam_date_added = ?");
						p2.setString(1, r.getString("exam_date_added"));
	            	   	ResultSet r2 = p2.executeQuery();
	            	   	while(r2.next()){
						PreparedStatement p3 = conn.prepareStatement("SELECT * FROM student_transfer where userid = ?");
						p3.setString(1, r2.getString("transferee_id"));
	            	   	ResultSet r3 = p3.executeQuery();
	            	   	while(r3.next()){
	            	   		%>

	            	   		<p><%=r3.getString("lastname") %>, <%=r3.getString("firstname") %>, <%=r3.getString("middlei") %></p>
	            	<% 
	            	   		}
					 
            	        }
					%>
				</div>
              <%}
                   
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
</div>
<div class="footer"></div>
<div class="modal fade createsched" role="dialog">
   <div class="modal-dialog modal-lg" style="width:1250px;">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#EFB652">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3 class="modal-title"><span class="glyphicon glyphicon-calendar"></span> Create Schedule</h3>
         </div>
         <form onsubmit = "return false" id = "createscheduleform">
         <div class="modal-body" style="overflow:auto; height:500px; width:100%;">
          <div class="container">
            
           <table>
           <tr>
              <th>  <h4>Date of Exam</h4></th>
              <th> <input type = "date" class="form-control"  name = "examdate" required></th>
       </tr>
          <tr>
               <th> <h4>Start Time</h4></th>
               <th><input type = "time" class="form-control" id="starttime"  name = "starttime" required></th>
          </tr>
           <tr>
               <th> <h4>End Time</h4></th>
               <th><input type = "time" class="form-control" id = "endtime"  name = "endttime" required><br></th>
               </tr>
                <tr>
              <th><h4>Venue</h4></th>
               <th><select name = "venueexam" class="form-control" required>
               <option value = "" selected disabled>Venue of exam</option>
               <% try{ 
                PreparedStatement p = conn.prepareStatement("SELECT * FROM venue");
                ResultSet r = p.executeQuery();
                while(r.next()) {
               %>
               <option value = "<%=r.getString("venue")%>"><%=r.getString("venue") %></option>
               <% } } catch(SQLException e) {out.print(e);}%>
               </select><br><p style="color:red"><i>Note: Conflict schedules will not be set.</i></p></th>
               </tr>
            </table><br><br>
         
            
            <legend><p>List of students for examination(Transferees)</p></legend>
            <div style="border-style:groove;">
            <br>
            <div class="table-responsive" style="overflow:auto; height:300px;">
           <center>
             <table class="table table-striped table-sortable">
                 <tr>
                 <th><input type="checkbox" onClick="toggle(this)"></th>
                 <th>ID</th>
                 <th>Student Name</th>
                 <th>Outgoing</th>
                 </tr>
                 <%try {
               	  PreparedStatement ps2 = conn.prepareStatement("SELECT * FROM transferees_exams INNER JOIN student_transfer on transferees_exams.transferee_id = student_transfer.userid WHERE exam_schedule_date is NULL");
               	  ResultSet rs2 = ps2.executeQuery();
                 while(rs2.next()) { %>
                 <tr>
                  <td><input type="checkbox" name="selectstransferees" id="selectstudents" value ="<%=rs2.getString("transferee_id") %>"></td>
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
          
            
             <br>
            
         </div>
           
            </div>
            
            <br>
            <center>   <textarea required rows="10" cols="100%" name = "exam_remarks" placeholder="Remarks"></textarea><br><br>
           </center>
         </div>
         <div class="modal-footer">
             <button type="button" data-dismiss="modal" class="btn btn-default btn-md">Cancel</button>
           <button onclick = "createSched()" class="btn btn-warning btn-md">Submit</button>
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
});
function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("main").style.marginLeft = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
function toggle(source) {
	var checkbox = document.querySelectorAll('input[type="checkbox"]');
	for(var i = 0; i < checkbox.length; i++) {
		if(checkbox[i] != source) {
		checkbox[i].checked = source.checked;
		}
	}
}
function createSched() {
	var checkstudents = document.getElementsByName("selectstransferees");
	var isChecked =false;
	var start = document.getElementById("starttime").value;
	var end = document.getElementById("endtime").value;
	for(var i = 0; i < checkstudents.length; i++) {
		if(checkstudents[i].checked) {
			isChecked = true;
			break;
			
		}
		
	}
	
	if(isChecked) {
		 if((start >= "05:59:59" && end <= "17:59:59") && (start != end) ) {
		document.getElementById("createscheduleform").method = "post";
		document.getElementById("createscheduleform").action = "CreateScheduleProcess2";
		document.getElementById("createscheduleform").submit();
		 }
	     else {
			  alert("Exam schedule time should only be between 6:00 AM and 6:00 PM");
			  
		  }
	}
	
	else {
		alert("Please select student(s).");
	}
	//document.getElementById("CreateScheduleProcess2");
}
</script>
     
</body>
</html>