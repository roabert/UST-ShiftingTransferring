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
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Transactions <% if(totalShifters+totalTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
    <ul class="submenu">
        <li><a href="OfadTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalShifters>0){ %> <span class="notification"><% if(totalShifters<=99){ %> <%= totalShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OfadTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfers>0){ %> <span class="notification"><% if(totalTransfers<=99){ %> <%= totalTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
      </ul>
    </li>
     <li><a href="#"  class="active"><span class="glyphicon glyphicon-briefcase"></span> Student Reports</a>
    <ul class="submenu">
        <li><a href="OfadApprovedTransactions_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="OfadApprovedTransactions_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
   
   TRANSACTIONS: TRANSFEREES
   </a>
   </center>
</div>
<br><br>
 <div id="content">
    <div class="container-fluid">
    <h5>Total Transferee Attempts : <%= gT.CountTransferSpecificTransactions(conn, getuser) %></h5>
    <h5>Total Transferees with valid requirements submissions : <%= gT.CountTransactionsTrDeanGood(conn, getuser) %></h5>
    <h5>Total Transferees with invalid requirements submissions :<%= gT.CountTransactionsTrDeanBad(conn, getuser) %></h5>
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
          <th>Current School</th>
          <th>Transferring To: </th>
          <th>Requirements</th>
          <th>Status</th>
          </tr>
        </thead>
        
        <tbody>
        <%
         try{
        String displaystudents_ofad = "SELECT * FROM transferees_status INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE ofad_verified = 'Approved' OR ofad_verified = 'Disapproved'";
        PreparedStatement ps = conn.prepareStatement(displaystudents_ofad); 
        ResultSet rs = ps.executeQuery();
       while(rs.next()) {

        %>
        
        <tr>
        <td><%= rs.getString("school_year") %></td>
		<td><%= gT.CountTransactionsSpecificBad(conn, rs.getString("transferee_id"), "ofad")+1 %></td>
        <td><%=rs.getString("transferee_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("oldschool") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><button type="button" class="btn" id="<%=rs.getString("transferee_id")%>" href="javascript:;">View Documents</button></td>
       <td><b><%=rs.getString("ofad_verified") %></b></td>
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

		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>


<div class="footer"></div>
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

      <script type="text/javascript">
		 $(document).ready(function() {
		        <%
		         try{
		        String displaystudentagain = "SELECT * FROM transferees_status INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE ofad_verified = 'Approved' OR ofad_verified = 'Disapproved'";
		        PreparedStatement ps2 = conn.prepareStatement(displaystudentagain); 
		        ResultSet rs2 = ps2.executeQuery();
		        if(!rs2.next()){
		        }
		        else {
		          do {
		        %>   
				$("#<%=rs2.getString("transferee_id")%>").click(function() {
					$.fancybox.open([
				        <%
				        String displayrequirement = "SELECT * FROM transferees_requirements WHERE transferee_id = ?";
				        PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
				        ps3.setString(1, rs2.getString("transferee_id"));
				        ResultSet rs3 = ps3.executeQuery();
				        while(rs3.next()){
				        %>
						{
							href : "DisplayRequirementTransfer?pkey=<%=rs3.getInt("id")%>.jpg",
							title: "<a href='DisplayRequirementTransfer?pkey=<%=rs3.getInt("id")%>.jpg' target='_blank' download='<%= rs2.getString("transferee_id") %>.jpg'>Download</a>"
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