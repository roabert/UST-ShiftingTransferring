<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="ust.registrar.utility.GetTransactions"%>
    <%@ page import="ust.registrar.model.admin.SchoolYearDAO" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
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
<title>Dean | Transactions</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("deanuser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}
notification notifs = new notification();
notifs.setDeanCollege(conn, getuser);
SchoolYearDAO scDAO = new SchoolYearDAO();
GetTransactions gT = new GetTransactions();
String schoolYear = scDAO.getSchoolYear(conn);
int schoolYearToo = Integer.parseInt(schoolYear)+1;
String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
int totalShifts = notifs.getDeanShiftTransactions(conn);
int totalTransfers = notifs.getDeanTransferTransactions(conn);
int totalShiftsExam = notifs.getDeanShiftScores(conn);
int totalTransfersExam = notifs.getDeanTransferScores(conn);
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
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Transactions
	<% if(totalShifts+totalTransfers>0){ %>
        <span class="notification alert-notif">!</span>
	<%	} %>    
	</a>
    <ul class="submenu">
        <li><a href="DeanTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters
		<% if(totalShifts>0){ %>
	        <span class="notification"><%
	        if(totalShifts<=99){
			%>
			<%= totalShifts %>
			<%
			}else{
	        %>
	        99+
	        <%} %></span>
		<%	} %>    
		</a></li>
        <li><a href="DeanTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees
		<% if(totalTransfers>0){ %>
	        <span class="notification"><%
	        if(totalTransfers<=99){
			%>
			<%= totalTransfers %>
			<%
			}else{
	        %>
	        99+
	        <%} %></span>
		<%	} %>       
		</a></li>
        
      </ul>
    </li>
     <li><a href="#" class="active"><span class="glyphicon glyphicon-briefcase"></span> Student Reports</a>
    <ul class="submenu">
        <li><a href="DeanApprovedTransactions_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="DeanApprovedTransactions_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span> Exam Results
	<% if(totalShiftsExam+totalTransfersExam>0){ %>
        <span class="notification alert-notif">!</span>
	<%	} %>      
	</a>
      <ul class="submenu">
        <li><a href="DeanExam_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters
		<% if(totalShiftsExam>0){ %>
	        <span class="notification"><%
	        if(totalShiftsExam<=99){
			%>
			<%= totalShiftsExam %>
			<%
			}else{
	        %>
	        99+
	        <%} %></span>
		<%	} %>      
		</a></li>
        <li><a href="DeanExam_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees
		<% if(totalTransfersExam>0){ %>
	        <span class="notification"><%
	        if(totalTransfersExam<=99){
			%>
			<%= totalTransfersExam %>
			<%
			}else{
	        %>
	        99+
	        <%} %></span>
		<%	} %> 
		</a></li>
        
      </ul>
    </li>
 <li><a href="#"><span class="glyphicon glyphicon-folder-open"></span> Completed Memos</a>
  <ul class="submenu">
        <li><a href="DeanMemo_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="DeanMemo_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
   TRANSACTIONS: SHIFTERS
   </a>
   </center>
</div>
<br>
 <div id="content">
    <div class="container-fluid">
    <h5>Total Shifter Attempts : <%= gT.CountShifterSpecificTransactions(conn, getuser) %></h5>
    <h5>Total Shifter Attempts with valid requirements submissions : <%= gT.CountTransactionsDeanGood(conn, getuser) %></h5>
    <h5>Total Shifter Attempts with invalid requirements submissions : <%= gT.CountTransactionsDeanBad(conn, getuser) %></h5>
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
	          <th>Documents</th>
	          <th>Status</th>
	        </tr>
        </thead>
        
        <tbody>
        <%
        try{
            String displaystudent = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid INNER JOIN dean on student_shifter.newcourse = dean.college WHERE dean_verified = 'Approved' OR dean_verified = 'Disapproved' AND dean.userid = ?";                               
            PreparedStatement ps = conn.prepareStatement(displaystudent); 
            ps.setString(1, getuser);
            ResultSet rs = ps.executeQuery();
           while(rs.next()) {
       
 %>
         
        <tr>
        <td><%= rs.getString("school_year") %></td>
		<td><%= gT.CountTransactionsSpecificDeanBad(conn, rs.getString("shifter_id"), getuser)+1 %></td>
        <td><%=rs.getString("shifter_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><center><button type="button" class="btn" id="<%=rs.getString("shifter_id")%>" href="javascript:;">View Documents</button><br>
   
        </center>
        </td>   
        <td>
		 <b><%=rs.getString("dean_verified") %></b>
        </td>
        </tr>	
        
        <%}
         
        }
         catch(Exception e) {
        	out.print(e);
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

<div class="modal fade disapprovestudent" role=dialog>
  <div class="modal-dialog" style="height:400px">
     <div class="modal-content">
     <form action = "Dean_verifyprocess" method = "post">
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
          <center>
          <textarea required name="remarks" rows="30" cols="60" placeholder="Remarks.." style="margin: 0px; width: 100%; height: 270px;"></textarea><br><br>
            </center>
       </div>
       <div class="modal-footer">
       <button class="btn btn-default btn-md" type="button" data-dismiss="modal">Cancel</button>
        <button class="btn btn-warning btn-md" type="submit" name ="optionverify" value="Disapproved">Submit</button>
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
        <!-- 
        Requirements
         --> <script>
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
		        String displaystudentagain = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid INNER JOIN dean on student_shifter.newcourse = dean.college WHERE dean_verified = 'Approved' OR dean_verified = 'Disapproved'";
		        PreparedStatement ps2 = conn.prepareStatement(displaystudentagain); 
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
          <div class="footer"></div>
</body>
</html>