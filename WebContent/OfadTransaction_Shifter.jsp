<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
        <%@ page import = "DatabaseHandler.SingletonDB" %>
    <%@ page import="ust.registrar.utility.GetTransactions"%>
    <%@ page import="ust.registrar.model.admin.SchoolYearDAO" %>
    <%@ page import = "ust.registrar.model.studentprocess.notification" %>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
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
<title>OFAD | Transactions</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("ofaduser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}
notification notifs = new notification();
SchoolYearDAO scDAO = new SchoolYearDAO();
GetTransactions gT = new GetTransactions();
String schoolYear = scDAO.getSchoolYear(conn);
int schoolYearToo = Integer.parseInt(schoolYear)+1;
String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
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
    <li><a href="Ofadpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-random"></span> Transactions <% if(totalShifters+totalTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
    <ul class="submenu">
        <li><a href="OfadTransaction_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalShifters>0){ %> <span class="notification"><% if(totalShifters<=99){ %> <%= totalShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfers>0){ %> <span class="notification"><% if(totalTransfers<=99){ %> <%= totalTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>  
      </ul>
    </li>
      <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span> Student Reports</a>
    <ul class="submenu">
        <li><a href="OfadApprovedTransactions_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadApprovedTransactions_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="OfadExamScheduler.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Scheduling <% if(totalShiftersExam+totalTransfersExam>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
      
    </li>
 <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Encode Scores <% if(totalShiftersScores+totalTransfersScores>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
  <ul class="submenu">
        <li><a href="OfadScores_Shifter.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Shifters <% if(totalShiftersScores>0){ %> <span class="notification"><% if(totalShiftersScores<=99){ %> <%= totalShiftersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadScores_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfersScores>0){ %> <span class="notification"><% if(totalTransfersScores<=99){ %> <%= totalTransfersScores %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        
      </ul>
 </li>
    <li><a href="logout.jsp?userset=<%=getuser%>"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
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
   
   TRANSACTIONS: SHIFTER
   </a>
   </center>
</div>
<br><br>
 <div id="content">
    <div class="container-fluid">
  <fieldset>
      <div class="table-responsive" style="overflow:auto; height:500px;">
      <center>
      <table class="table table-striped table-sortable">
        <thead>
        <tr> 
          <th>School Year</th>
          <th>No. of Tries</th>
          <th>ID</th>
          <th>Student Name</th>
          <th>Current Course/Program</th>
          <th>Incoming Course/Program</th>
          <th>View Requirements</th>
          <th></th>
          <th></th>
          </tr>
        </thead>
        
        <tbody>
        <%
         try{
        String displaystudent_ofad = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE ofad_verified = 'In-progress' AND secgen_verified = 'Approved'";
         PreparedStatement ps = conn.prepareStatement(displaystudent_ofad); 
        ResultSet rs = ps.executeQuery();
        
           while (rs.next()) {

        %>
        
        <tr>
        <td><%= rs.getString("school_year") %></td>
		<td><%= gT.CountTransactionsSpecificBad(conn, rs.getString("shifter_id"), "ofad")+1 %></td>
      
        <td><%=rs.getString("shifter_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
   
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><center><button type="button" class="btn" id="<%=rs.getString("shifter_id")%>" href="javascript:;">View Documents</button><br>
       
        </center>
        </td> 
        <td>
       <form action = "Ofad_verifyprocess" method = "post">
			<input type="hidden" value = "<%=rs.getString("shifter_id")%>" name = "studentid">
	        <input type="hidden" value = "<%=getuser%>" name = "getuser">
			 <button value="Approved" type="submit" class="btn btn-warning" name="optionverify"
	        onclick= "return confirm('Upon approving the application of student, you are also endorsing the student for admittance');"><span class="glyphicon glyphicon-thumbs-up" style="color:white;"></span> Approve</button>
	        
		</form>
		</td>
		<td><button type="button" class="btn btn-warning student_shift" data-toggle="modal"
	         data-target=".disapprovestudent"
	         data-shifter_id="<%=rs.getString("shifter_id")%>"
	         data-getuser="<%=getuser%>">
	        <span class="glyphicon glyphicon-thumbs-down" style="color:white;"></span> Disapprove</button></td>
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

<div class="modal fade disapprovestudent" role=dialog>
  <div class="modal-dialog" style="height:400px">
     <div class="modal-content">
     <form action = "Ofad_verifyprocess" method = "post">
      <div class="modal-header" style="background-color:#EFB652">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h3 class="modal-title"><span class="glyphicon glyphicon-thumbs-down" style="color:white;"></span> Disapprove Student</h3>
       </div>
       <div class="modal-body">
         <br>
         <input type="hidden" class="shifter_id" name="studentid">
         <input type="hidden" class="getuser" name="getuser">
         <h4>Are you sure you want to disapprove <i id="studentid"></i>'s request?</h4>
         <br>
  <textarea required name="remarks" rows="30" cols="60" placeholder="Remarks.." style="margin: 0px; width: 100%; height: 270px;"></textarea><br><br>

<h5>Fill out checkboxes of erroneous requirements: </h5>
  <input type="checkbox" name="otr" value="otr"> Official OTR <br>
  <input type="checkbox" name="letterdean" value="letterdean"> Letter of Intent to the Dean<br>
  <input type="checkbox" name="letterguide" value="letterguide"> Letter of Intent to the Guidance<br>
  <input type="checkbox" name="studid" value="studid"> Student ID <br>
  <input type="checkbox" name="good" value="good"> Good Moral <br>
       </div>
       <div class="modal-footer">
       <button class="btn btn-default btn-md" type="button" data-dismiss="modal">Cancel</button>
        <button class="btn btn-warning btn-md" type="submit" name ="optionverify" value="Disapproved">Submit</button>
        </div>
        </form>
     </div>
  </div>

</div>
    <script type="text/javascript">
        var alerted = localStorage.getItem('alerted') || '';
        if (alerted != 'yes') {
         alert("Hello! You have:\n <%= totalShifters %> Shifter Transactions\n <%= totalTransfers %> Transferee Transactions\n <%= totalShiftersExam %> Shifter Exam Schedule Pending\n <%= totalTransfersExam %> Transferee Exam Schedule Pending \n <%= totalShiftersScores%> Shifter Exam Scores \n <%= totalTransfersScores%> Transferee Exam Scores \nPlease view sidebar at all times to see notifications");
         localStorage.setItem('alerted','yes');
        }
    </script>
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
        <!-- 
        Requirements
         --><script>
     $(document).on( "click", '.student_shift',function(e) 
    		 {
    	    var shifter_id = $(this).data('shifter_id');
    	    var getuser = $(this).data('getuser');

    	    $(".shifter_id").val(shifter_id);
    	    $(".getuser").val(getuser);
    	    $("#studentid").html(shifter_id);
  
    	});
     </script>
         <script type="text/javascript">
		 $(document).ready(function() {
		        <%
		         try{
		        String displaystudent_ofadagain = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE ofad_verified = 'In-progress' AND secgen_verified = 'Approved'";
		        PreparedStatement ps2 = conn.prepareStatement(displaystudent_ofadagain); 
		        ResultSet rs2 = ps2.executeQuery();
		        if(!rs2.next()){
		        }
		        else {
		          do {
		        %>   
				$("#<%=rs2.getString("shifter_id")%>").click(function() {
					$.fancybox.open([
				        <%
				        String displayrequirement = "SELECT * FROM shifters_requirements WHERE shifter_id = ?";
				        PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
				        ps3.setString(1, rs2.getString("shifter_id"));
				        ResultSet rs3 = ps3.executeQuery();
				        while(rs3.next()){
				        %>
						{
							href : "DisplayRequirement?pkey=<%=rs3.getInt("id")%>.jpg",
							title: "<a href='DisplayRequirement?pkey=<%=rs3.getInt("id")%>.jpg' target='_blank' download='<%= rs2.getString("shifter_id") %>.jpg'>Download</a>"
						},
						<%
				        }
						%>
					], {
						helpers : {
							thumbs : {
								width: 75,
								height: 50
							}
						}
					});
	         	});
	        <%} while(rs2.next());
		         }  
		         }catch(Exception e) {
		        	e.printStackTrace();
		        } %> 
         })
         </script>
     
</body>
</html>