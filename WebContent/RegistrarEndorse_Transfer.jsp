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
<title>Registrar | Endorsements</title>
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
			<h1>Registrar<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Registrarpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-pencil"></span> Endorsement</a>
    <ul class="submenu">
        <li><a href="RegistrarTransaction_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="RegistrarTransaction_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>

 <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span> Completed Memos</a>
  <ul class="submenu">
        <li><a href="RegistrarMemo_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
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
   ENDORSEMENT: TRANSFEREES
   </a>
   </center>
</div>
  <div id="content">
    <div class="container">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-sortable">
		<thead>
        <tr>
          <th>Student Name</th>
          <th>Incoming</th>
          <th>Memo</th>
          <th>Endorse Student</th>
        </tr>
        </thead>
        <tbody>
        <%
         try{
        String display_indorsement = "SELECT * FROM transferees_indorsement INNER JOIN student_transfer on transferees_indorsement.transferee_id = student_transfer.userid WHERE registrar_indorsed = 'In-progress'";
        String displayindorsement_osg = "SELECT shifter_id, lastname, firstname, middlei, typeofstudent, newcourse, newprogram FROM shifters_indorsement INNER JOIN student_shifter on shifter_id = student_shifter.studentid UNION SELECT transferee_id, lastname, firstname, middlei, typeofstudent, newcourse, newprogram FROM transferees_indorsement INNER JOIN student_transfer on transferee_id = student_transfer.id WHERE dean_indorsed = 'Approved'";
        String displaystudent_osg = "SELECT shifter_id, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newcourse, newprogram FROM shifters_status INNER JOIN student_shifter on shifters_status.shifter_id = student_shifter.studentid UNION SELECT transferee_id, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newcourse, newprogram FROM transferees_status INNER JOIN student_transfer on transferees_status.transferee_id = student_transfer.id WHERE osa_verified = 'Approved' OR dean_verified ='Approved'";
        String displaystudent = "SELECT studentid, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newprogram, newcourse FROM student_shifter UNION SELECT id, lastname, firstname, middlei, typeofstudent, oldschool, oldprogram, newprogram, newcourse FROM student_transfer";
        PreparedStatement ps = conn.prepareStatement(display_indorsement); 
        ResultSet rs = ps.executeQuery();
        if(!rs.next()) {
      	  out.print("<tr><p style=color:red>No Student Memo pending!</p></tr>");
        }
        else {
           do {
        %>
        <tr>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("newprogram") %> - <%=rs.getString("newcourse") %></td>
        <td><a href="#<%=rs.getString("transferee_id")%>" class="fancybox">View Memo</a></td>
        <td><button type="button" class = "btn btn-warning registrar_indorsement"
           data-target=".regIndorse"
           data-toggle="modal"
           data-transferee_id = "<%=rs.getString("transferee_id") %>"
           data-getuser = "<%=getuser %>"
           >Endorse</button></td>
        </tr>
        <div id="<%=rs.getString("transferee_id") %>" style="width:600px;display: none;">
					<%
						PreparedStatement p3 = conn.prepareStatement("SELECT * FROM transferees_memo where transferee_id = ?");
						p3.setString(1, rs.getString("transferee_id"));
	            	   	ResultSet r3 = p3.executeQuery();
	            	   	while(r3.next()){
	            	   		%>
	            	   		<center>
	            	   		<h2>UNIVERSITY OF SANTO TOMAS</h2>
	            	   		<h4>OFFICE OF THE SECRETARY GENERAL</h4>
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
        <%}while(rs.next());
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

   <div class="footer"></div> 
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>


<div class="regIndorse modal fade" role="dialog">
  <div class="modal-dialog" style="width:700px; height:800px;">
     <div class="modal-content">
     <form action="RegistrarIndorseTransferProcess" method="post">
         <div class="modal-header">
             <button class="close" type="button" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"><b>Letter of Endorsement</b></h4>
         </div>
         <div class="modal-body"><br>
          <input class="transfer_id" type="hidden" name="transferid">
          <input class="getuser" type="hidden" name="getuser">
          <p>To the Secretary General,</p>
          <p>recommending approval of the application</p>
           <center>
          <textarea name="endorsement" rows="30" cols="60" placeholder="Endorsement Letter" style="margin: 0px; width: 660px; height: 334px;"></textarea><br><br>
            <p><input type="checkbox" name="approval" value="Approved"> Approve Endorsement</p>
            </center>
         </div>
         <div class="modal-footer">
         <button type="button" class="btn btn-default btn-md" data-dismiss="modal"><span class="glyphicon glyphicon-remove" style="color:red;"></span> Cancel</button>
             &nbsp&nbsp
          <button type="submit" class="btn btn-md btn-warning"><span class="glyphicon glyphicon-ok" style="color:green;"></span> Endorse Student</button>

         </div>
         </form>
     </div>
  </div>
</div>



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
</script>
      <script>
     $(document).on( "click", '.registrar_indorsement',function(e) 
    		 {
    	    var transfer_id = $(this).data('transfer_id');
    	    var getuser = $(this).data('getuser');

    	    $(".transfer_id").val(transfer_id);
    	    $(".getuser").val(getuser);
    	//    tinyMCE.get('business_skill_content').setContent(content);   
    	});
     </script>
</body>
</html>