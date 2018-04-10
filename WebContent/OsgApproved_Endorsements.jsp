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
<title>OSG | Approved Transactions</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
}
notification notifs = new notification();
int totalShifters = notifs.getSecGenShiftTransactions(conn);
int totalTransfers = notifs.getSecGenTransferTransactions(conn);
int totalIndorseShifters = notifs.getSecGenShiftEndorsement(conn);
int totalIndorseTransfers = notifs.getSecGenTransferEndorsement(conn);		
%>


 <div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>Secretary General<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Osgpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#" ><span class="glyphicon glyphicon-random"></span> Transactions<% if(totalShifters+totalTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
    <ul class="submenu">
        <li><a href="OsgTransaction_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalShifters>0){ %> <span class="notification"><% if(totalShifters<=99){ %> <%= totalShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OsgTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalTransfers>0){ %> <span class="notification"><% if(totalTransfers<=99){ %> <%= totalTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>	
        
      </ul>
    </li>

 <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Endorsement<% if(totalIndorseShifters+totalIndorseTransfers>0){ %> <span class="notification alert-notif">!</span> <% } %> </a>
  <ul class="submenu">
        <li><a href="OsgEndorse_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters <% if(totalIndorseShifters>0){ %> <span class="notification"><% if(totalIndorseShifters<=99){ %> <%= totalIndorseShifters %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        <li><a href="OsgEndorse_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees <% if(totalIndorseTransfers>0){ %> <span class="notification"><% if(totalIndorseTransfers<=99){ %> <%= totalIndorseTransfers %> <% }else{ %> 99+ <%} %></span> <% } %> </a></li>
        
      </ul>
 </li>
 <li><a href="#" class="active"><span class="glyphicon glyphicon-ok-sign"></span> Approved Students</a>
    <ul class="submenu">
        <li><a href="OsgApproved_Transactions.jsp" ><span class="glyphicon glyphicon-random"></span> Transactions</a></li>
        <li><a href="OsgApproved_Endorsements.jsp" class="active"><span class="glyphicon glyphicon-check"></span> Endorsements</a></li>
        
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
   <a style= "color: white">
   <span style="font-size:30px;cursor:pointer;color: white; float:left" class="js-toggle-left-slidebar">&#9776;</span>
   APPROVED TRANSACTIONS: SHIFTERS
   </a>
   </center>
</div>
<br>
 <div id="content">
    <div class="container-fluid">
    <br>
    
      <ul class = "nav nav-tabs">
          <li class="active"><a href="OsgApproved_Endorsements.jsp">Shifters</a></li>
          <li><a href="OsgApproved_Endorsements2.jsp">Transferees</a></li>
          </ul>
     <div class="tab-content">
     <br>
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-striped table-sortable">
		<thead>
        <tr>
          <th>Student Name</th>
          <th>Incoming</th>
          <th>Student Memo</th>
          <th>Status</th>
        </tr>
		</thead>
        
        <tbody>
        <%
         try{
        String displayEndorsement_osg = "SELECT * FROM shifters_indorsement INNER JOIN student_shifter on shifters_indorsement.shifter_id = student_shifter.studentid WHERE secgen_indorsed = 'Approved'";
        PreparedStatement ps = conn.prepareStatement(displayEndorsement_osg); 
        ResultSet rs = ps.executeQuery();
       while(rs.next()) {

        %>
        <tr>
        <td><input type ="hidden" name="getstudent" value = "<%=rs.getString("shifter_id")%>"><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><input type="hidden" name="getuser" value="<%=getuser%>"><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><button href="#<%=rs.getString("shifter_id") %>" class="fancybox btn">View Memo</button></td>
        <td><b><%=rs.getString("secgen_indorsed") %></b></td>
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
	            	   		<p>Student ID: <%=r3.getString("studentid") %></p><br>
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
	            	   		<br><br><br>
	            	   				<center>
	            	   		<button class="btn" onclick = "printThis()">Print</button>
	            	   		</center>
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
        
      
     
     <div class="footer"></div>
</body>
</html>