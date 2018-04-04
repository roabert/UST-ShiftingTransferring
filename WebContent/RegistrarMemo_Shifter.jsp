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
<title>Registrar | Memo</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
}
notification notifs = new notification();
int totalIndorseShifters = notifs.getRegistrarShiftEndorsement(conn);
int totalIndorseTransfers = notifs.getRegistrarTransferEndorsement(conn);	
%>


 <div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Registrar<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
		</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Registrarpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-random"></span> Endorsement<% if(totalIndorseShifters+totalIndorseTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
    <ul class="submenu">
        <li><a href="RegistrarEndorse_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalIndorseShifters>0){ %> <span class="notification"><% if(totalIndorseShifters<=99){ %> <%= totalIndorseShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="RegistrarEndorse_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalIndorseTransfers>0){ %> <span class="notification"><% if(totalIndorseTransfers<=99){ %> <%= totalIndorseTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        
      </ul>
    </li>
     <li><a href="#"><span class="glyphicon glyphicon-check"></span> Endorsed Students</a>
    <ul class="submenu">
        <li><a href="RegistrarApprovedEndorse_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="RegistrarApprovedEndorse_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
 <li><a href="#" class="active"><span class="glyphicon glyphicon-list-alt"></span> Completed Memos</a>
  <ul class="submenu">
        <li><a href="RegistrarMemo_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="RegistrarMemo_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
   
  MEMO: SHIFTER
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
          <th>Student Name</th>
          <th>Incoming</th>
          <th>Student Memo</th>
          <th>Registrar Indorsement</th>
          <th>OSG Indorsement</th>
        </tr>
        </thead>
        <tbody>
        <%
         try{
        String display_finalmemo = "SELECT * FROM shifters_indorsement INNER JOIN student_shifter on shifters_indorsement.shifter_id = student_shifter.studentid WHERE shifter_shifting_approved = 'Approved'";
       PreparedStatement ps = conn.prepareStatement(display_finalmemo); 
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        %>
        <tr>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
       <td><button class = "fancybox btn" href="#<%=rs.getString("shifter_id")%>">View Memo</button></td>
       <td><button href="#<%=rs.getString("id")%>" class="fancybox btn">View Indorsements</button></td>
       <td><button href="#<%=rs.getString("id")+"OSG"%>" class="fancybox btn">View Indorsements</button></td>
        </tr>
         <div id="<%=rs.getString("shifter_id") %>" style="width:600px;display: none;">
					<%
						PreparedStatement p3 = conn.prepareStatement("SELECT * FROM shifters_memo where shifter_id = ?");
						p3.setString(1, rs.getString("shifter_id"));
	            	   	ResultSet r3 = p3.executeQuery();
	            	   	while(r3.next()){
	            	   		%>
	            	   		<center>
	            	   		<h2>UNIVERSITY OF SANTO TOMAS</h2>
	            	   		<h4>OFFICE OF THE SECRETARY GENERAL</h4>
	            	   		</center>
	            	   		<br>
	            	   		<p>Date: <u><%=r3.getString("date") %></u></p><br>
	            	   		<p>Student ID: <%=r3.getString("studentid") %></p>
	            	   		<p>I, <u><%=r3.getString("full_name") %></u> from college of <u><%=r3.getString("oldcourse") %></u></p>
	            	   		<p>wish to apply for admission to the College of <u><%=r3.getString("newcourse") %></u>, <u><%=r3.getString("semester_start") %></u>
	            	   		 Sem, 20<u><%=r3.getString("firstyear_start") %></u> - 20<u><%=r3.getString("secondyear_start") %></u></p>
	            	   		 <br>
	            	   		 <p>MY COMPLETE COLLEGE ATTENDANCE TO DATE:</p>
	            	   		 <p>College(s) previously attended: <u><%=r3.getString("oldcourse") %></u></p>
	            	   		 <br>
	            	   		 <p>1st Term - 2nd Term: Term <u><%=r3.getString("first_term") %></u> AY 20<u><%=r3.getString("firstterm_1year") %></u> - 20<u><%=r3.getString("firstterm_2year") %></u>: Special Term <u><%=r3.getString("specialterm_1") %></u></p>
	            	   		 <p>1st Term - 2nd Term: Term <u><%=r3.getString("second_term") %></u> AY 20<u><%=r3.getString("secondterm_1year") %></u> - 20<u><%=r3.getString("secondterm_2year") %></u>: Special Term <u><%=r3.getString("specialterm_2") %></u></p>
	            	   		 <p>1st Term - 2nd Term: Term <u><%=r3.getString("third_term") %></u> AY 20<u><%=r3.getString("thirdterm_1year") %></u> - 20<u><%=r3.getString("thirdterm_2year") %></u>: Special Term <u><%=r3.getString("specialterm_3") %></u></p>
	            	   		 <p>1st Term - 2nd Term: Term <u><%=r3.getString("fourth_term") %></u> AY 20<u><%=r3.getString("fourthterm_1year") %></u> - 20<u><%=r3.getString("fourthterm_2year") %></u>: Special Term <u><%=r3.getString("specialterm_4") %></u></p>
	            	   		 <br>
	            	   		 <input type="checkbox" checked disabled readonly> I agree that my enrollment will be automatically cancelled if it turns out that I have been debarred from the previous college.
	            	   		<br><br><br><br>	                   
	            	<% 
	            	   		}
					 
            	       
					%>
				</div>
				<div id="<%=rs.getString("id") %>" style="width:600px;display: none;">
	        <%
	            PreparedStatement p4 = conn.prepareStatement("SELECT * FROM shifters_indorsement INNER JOIN registrar on registrar_id = registrar.userid WHERE shifter_id = ?");
	            p4.setString(1, rs.getString("shifter_id"));
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
	            	<br>
	            	<%
	            }
	        %>
	      </div>
	      <div id="<%=rs.getString("id")+"OSG" %>" style="width:600px;display: none;">
	        <%
	            PreparedStatement p5 = conn.prepareStatement("SELECT * FROM shifters_indorsement INNER JOIN secgen on secgen_id = secgen.userid INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE shifter_id = ?");
	            p5.setString(1, rs.getString("shifter_id"));
	            ResultSet r5 = p5.executeQuery();
	            while(r5.next()) {
	            	%>
	            	<center>
	            	<br>
	            	<h3>Second Indorsement</h3>
	            	<br>
	            	</center>
	            	<h4>To the Dean of the <i><%=r5.getString("newcourse") %></i></h4><br>
	            	<h4>This student may enroll in your college.</h4>
	            	<br>
	            
	            	<p>Remarks: </p>
	            		<center>
	            	<p><%=r5.getString("secgen_remarks") %></p>
	            	</center>
	            	<br><br><br>
	            	<div class="pull-right">
	            	  <i><%=r5.getString("first_name") %> <%=r5.getString("middle_name") %> <%=r5.getString("last_name") %></i>
	            	  <p>Office of the Secretary General</p> 
	            	</div>
	            	<br>
	            	<%
	            }
	        %>
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
</script>
     
</body>
</html>