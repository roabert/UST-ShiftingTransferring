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
<title>Dean | Memo</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("deanuser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}
notification notifs = new notification();
notifs.setDeanCollege(conn, getuser);
int totalShifts = notifs.getDeanShiftTransactions(conn);
int totalTransfers = notifs.getDeanTransferTransactions(conn);
int totalShiftsExam = notifs.getDeanShiftScores(conn);
int totalTransfersExam = notifs.getDeanTransferScores(conn);
SchoolYearDAO scDAO = new SchoolYearDAO();
GetTransactions gT = new GetTransactions();
String schoolYear = scDAO.getSchoolYear(conn);
int schoolYearToo = Integer.parseInt(schoolYear)+1;
String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
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
    <li><a href=""><span class="glyphicon glyphicon-random"></span> Transactions
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
     <li><a href="#"><span class="glyphicon glyphicon-briefcase"></span> Student Reports</a>
    <ul class="submenu">
        <li><a href="DeanApprovedTransactions_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="DeanApprovedTransactions_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href=""><span class="glyphicon glyphicon-list-alt"></span> Exam Results
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
  <li><a href="" class="active"><span class="glyphicon glyphicon-folder-open"></span> Completed Memos</a>
  <ul class="submenu">
        <li><a href="DeanMemo_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="DeanMemo_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
  COMPLETED MEMO: TRANSFERRING
   </a>
   </center>
</div>
<br>
   <div id="content">
    <div class="container-fluid">
     <h5>Total Transferees enrollment approved :<%= gT.CountTransferSuccessDeanTransactions(conn, getuser) %></h5>
  <fieldset>
      <div class="table-responsive" style="overflow:auto; height:500px;">
      <center>
      <table class="table table-striped table-sortable">
		<thead>
        <tr>
          <th>School Year</th>
          <th>Student Name</th>
          <th>Incoming</th>
          <th>Student Memo</th>
          <th>Registrar Indorsement</th>
          <th>OSG Indorsement</th>
          <th></th>
        </tr>
        </thead>
        <tbody>
        <%
         try{
        String display_finalmemo = "SELECT * FROM transferees_indorsement INNER JOIN student_transfer on transferees_indorsement.transferee_id = student_transfer.userid INNER JOIN dean on student_transfer.newcourse = dean.college WHERE transfer_transferring_approved = 'Approved' AND dean.userid = ?";
       int cout = 0; 
       PreparedStatement ps = conn.prepareStatement(display_finalmemo);
       ps.setString(1, getuser);
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        	   cout++;
        %>
        <tr>
        <td><%=rs.getString("school_year") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
       <td><button class = "fancybox btn" href="#<%=rs.getString("transferee_id")%>">View Memo</button></td>
       <td><button href="#<%=rs.getString("id")%>" class="fancybox btn">View Indorsements</button></td>
       <td><button href="#<%=rs.getString("id")+"OSG"%>" class="fancybox btn">View Indorsements</button></td>
       <td><button class="btn" onclick="printAllPDF<%= cout %>()" ><span class="glyphicon glyphicon-print"></span> Print All</button></td>
        </tr>
        <div id="<%=rs.getString("transferee_id") %>Memo">
          <style>
          @media print {
          		.memo{
          			display:block!important;
          		}
          		
          		.studentmemo{
          			border-right:1px solid #000;
          			padding-right: 3%;
          			width:45%!important;
          			float:left;
          		}
          		
          		.firstindorsement{
          			width:45%!important;
          			padding-left: 3%;
          			float:left;
          		}
          		
          		.secondindorsement{
          			border-top:1px solid #000;
          			display:block;
          			float:left;
          			width:100%!important;
          		}
          		
          		.hide-in-print-all{
          			display:none!important;
          		}
          		
          		.dont-hide-in-print-all{
          			display:block!important;
          			margin-top:20px;
          		}
          		
          		p{
          			font-size:10px;
          		}
          		
          		
			}
          </style>
	      <center>
	          	<div class="dont-hide-in-print-all" style="display: none;">
	            	 	<h2>UNIVERSITY OF SANTO TOMAS</h2>
	            	 	<h4>OFFICE OF THE SECRETARY GENERAL</h4>
	           	</div>
	     </center>
         <div id="<%=rs.getString("transferee_id") %>" class="memo studentmemo" style="width:600px;display: none;">
          <div id = "studentmemo<%= cout %>">
          <style>
          @media print {
          		.col-sm-6{
          			display:inline-block!important;
          			width:45%!important;
          			vertical-align:top;
          		}
          		
          		button{
          			display:none;
          		}
          		
          		input{
          			display:none;
          		}
			}
          </style>
					<%
						PreparedStatement p3 = conn.prepareStatement("SELECT * FROM transferees_memo where transferee_id = ?");
						p3.setString(1, rs.getString("transferee_id"));
	            	   	ResultSet r3 = p3.executeQuery();
	            	   	while(r3.next()){
	            	   		%>
	            	   		<center>
	            	   		<div class="hide-in-print-all">
	            	   		<h2>UNIVERSITY OF SANTO TOMAS</h2>
	            	   		<h4>OFFICE OF THE SECRETARY GENERAL</h4>
	            	   		</div>
	            	   		</center>
	            	   		<br>
	            	   		<p>Date: <u><%=r3.getString("date") %></u></p><br>
	            	   	
	            	   		<p>I, <u><%=r3.getString("full_name") %></u> from college of <u><%=r3.getString("oldcourse") %></u></p>
	            	   		<p>wish to apply for admission to the College of <u><%=r3.getString("newcourse") %></u>, <u><%=r3.getString("semester_start") %></u>
	            	   		 Sem, 20<u><%=r3.getString("firstyear_start") %></u> - 20<u><%=r3.getString("secondyear_start") %></u></p>
	            	   		 <br>
	            	   		 <p>MY COMPLETE COLLEGE ATTENDANCE TO DATE:</p>
	            	   		 <p>College(s) previously attended: <u><%=r3.getString("oldcourse") %></u></p>
	            	   		 <br>
	            	   		  <div class="row">
	            	   		 <div class="col-sm-6">
	            	   		 <p>Term: <u><%=r3.getString("first_term") %></u> AY 20<u><%=r3.getString("firstterm_1year") %></u> - 20<u><%=r3.getString("firstterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("second_term") %></u> AY 20<u><%=r3.getString("secondterm_1year") %></u> - 20<u><%=r3.getString("secondterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("third_term") %></u> AY 20<u><%=r3.getString("thirdterm_1year") %></u> - 20<u><%=r3.getString("thirdterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("fourth_term") %></u> AY 20<u><%=r3.getString("fourthterm_1year") %></u> - 20<u><%=r3.getString("fourthterm_2year") %></u></p>
	            	   		 <br>
	            	   		 </div>
	            	   		 <div class="col-sm-6" style="float:left;">
	            	   		 <p>Term: <u><%=r3.getString("fifth_term") %></u> AY 20<u><%=r3.getString("fifthterm_1year") %></u> - 20<u><%=r3.getString("fifthterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("sixth_term") %></u> AY 20<u><%=r3.getString("sixthterm_1year") %></u> - 20<u><%=r3.getString("sixthterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("seventh_term") %></u> AY 20<u><%=r3.getString("seventhterm_1year") %></u> - 20<u><%=r3.getString("seventhterm_2year") %></u></p>
	            	   		 <p>Term: <u><%=r3.getString("eight_term") %></u> AY 20<u><%=r3.getString("eightterm_1year") %></u> - 20<u><%=r3.getString("eightterm_2year") %></u></p>
	            	   		 <br>
	            	   		 </div>
	            	   		 </div>
	            	   		 <p><input type="checkbox" checked disabled readonly> I agree that my enrollment will be automatically cancelled if it turns out that I have been debarred from the previous college.</p>
	            	   		     	                   
	            	<% 
	            	   		}
					 
            	       
					%>
					</div>
					<center>
	            	   		<button class="btn" onclick = "printStudentMemo<%= cout %>()">Print</button>
	            	   		</center>
	            	   		<br>
				</div>
				<div id="<%=rs.getString("id") %>" class="memo firstindorsement" style="width:600px;display: none;">
				<div id = "firstindorsement<%= cout %>">
		          <style>
		          @media print {
		          		button{
		          			display:none;
		          		}
					}
		          </style>
	        <%
	            PreparedStatement p4 = conn.prepareStatement("SELECT * FROM transferees_indorsement INNER JOIN registrar on registrar_id = registrar.userid INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE transferee_id = ?");
	            p4.setString(1, rs.getString("transferee_id"));
	            ResultSet r4 = p4.executeQuery();
	            while(r4.next()) {
	            	%>
	            	<center>
	            	<br>
	            	<h3>First Indorsement</h3>
	            	<br>
	            	</center>
	            	<h4>To the Secretary General,</h4>
	            	<p>Recommending approval of the application for shift.</p>
	            	<br>
	            
	            	<p>Remarks: </p>
	            		<center>
	            	<p><%=r4.getString("registrar_indorsement") %></p>
	            	</center>
	            	<br><br><br>
	            	<div class="pull-right">
	            	  <i><%=r4.getString("first_name") %> <%=r4.getString("middle_name") %> <%=r4.getString("last_name") %></i>
	            	  <p>Registrar Office</p> 
	            	</div>
	            	<%
	            }
	        %>
	        </div>
	        <center>
	            	   		<button class="btn" onclick = "printFirstIndorsement<%= cout %>()">Print</button>
	            	   		</center>
	            	   		<br>
	      </div>
	      <div id="<%=rs.getString("id")+"OSG" %>" class="memo secondindorsement" style="width:600px;display: none;">
	      <div id = "secondindorsement<%= cout %>">
		          <style>
		          @media print {
		          		button{
		          			display:none;
		          		}
					}
		          </style>
	        <%
	            PreparedStatement p5 = conn.prepareStatement("SELECT * FROM transferees_indorsement INNER JOIN secgen on secgen_id = secgen.userid INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE transferee_id = ?");
	            p5.setString(1, rs.getString("transferee_id"));
	            ResultSet r5 = p5.executeQuery();
	            while(r5.next()) {
	            	%>
	            	<center>
	            	<br>
	            	<h3>Second Indorsement</h3>
	            	</center>
	            	<h4>To the Dean of the <i><%=r5.getString("newcourse") %></i></h4><br>
	            	<h4>This student may enroll in your college.</h4>
	            	<p>Remarks: </p>
	            		<center>
	            	<p><%=r5.getString("secgen_remarks") %></p>
	            	</center>
	            	<br><br><br>
	            	<div class="pull-right">
	            	  <i><%=r5.getString("first_name") %> <%=r5.getString("middle_name") %> <%=r5.getString("last_name") %></i>
	            	  <p>Office of the Secretary General</p> 
	            	</div>
	            	<%
	            }
	        %>
	        </div>
	                <center>
	            	   		<button class="btn" onclick = "printSecondIndorsement<%= cout %>()">Print</button>
	            	   		</center>
	            	   		<br>
	      </div>
		       
	      </div>
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
	      
		      <div id = "iso">
			          <style>
			          @media print {
			          		.iso{
			          			display:block!important;
			          			position:fixed;
			          			bottom:0;
			          			right:0;
			          		}
						}
			          </style>
			          <span class="iso" style="display:none;">UST:S033-00-F020</span>
		       </div>
		       
 <div class="footer"></div>

		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>


<script>
$(document).ready(function() {
    $('table.table-sortable').DataTable();
    $('.fancybox').fancybox();
});

function openNav() {
    document.getElementById("mySidenav").style.width = "300px";
    document.getElementById("main").style.marginLeft = "300px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}

<%
 try{
String display_finalmemo = "SELECT * FROM transferees_indorsement INNER JOIN student_transfer on transferees_indorsement.transferee_id = student_transfer.userid INNER JOIN dean on student_transfer.newcourse = dean.college WHERE transfer_transferring_approved = 'Approved' AND dean.userid = ?";
int cout = 0;
PreparedStatement ps = conn.prepareStatement(display_finalmemo);
ps.setString(1, getuser);
ResultSet rs = ps.executeQuery();
   while(rs.next()) {
	   cout++;
%>

function printStudentMemo<%= cout %>()  {
	var style;

	var prtContent = document.getElementById("studentmemo<%= cout %>");
	var iso = document.getElementById("iso");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write(prtContent.innerHTML + iso.innerHTML);
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
	 
}

function printFirstIndorsement<%= cout %>()  {
	var style;

	var prtContent = document.getElementById("firstindorsement<%= cout %>");
	var iso = document.getElementById("iso");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write(prtContent.innerHTML + iso.innerHTML);
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
	 
}

function printSecondIndorsement<%= cout %>()  {
	var style;

	var prtContent = document.getElementById("secondindorsement<%= cout %>");
	var iso = document.getElementById("iso");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write(prtContent.innerHTML + iso.innerHTML);
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
	 
}
function printAllPDF<%= cout %>()  {
	var style;

	var studentmemo = document.getElementById("<%=rs.getString("transferee_id") %>Memo");
	var iso = document.getElementById("iso");
	var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
	WinPrint.document.write(studentmemo.innerHTML + iso.innerHTML);
	WinPrint.focus();
	WinPrint.print();
	WinPrint.close();
	 
}

<%}
   
 }catch(Exception e) {
	e.printStackTrace();
} %>

</script>
     
</body>
</html>