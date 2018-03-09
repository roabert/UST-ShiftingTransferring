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
		<link rel="stylesheet" href="CSS/sidebar-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/style.css"type="text/css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
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
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			<h1>OFAD<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
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
<div id="main">
<div id="wrapper">


<div class="header">
 <a class="logo" >
 <span style="font-size:50px;margin-top:-20px;cursor:pointer;color: black" class="js-toggle-left-slidebar">&#9776;</span>
 UNIVERSITY OF SANTO TOMAS</a>
  <div class="header-right">  
    <a class="active">Shifting and Transferring System</a>
  </div>
</div>
<div class="topnav">
  <a href="#">MyUSTe</a>
  <a href="#">Programs</a>
  <a href="#" >Guidelines</a>
</div>


<br>
            <p><i>Exam Scheduler</i></p> 
            <div class="container">
            <form action="javascript:;">
            <button class="btn btn-lg btn-warning pull-right" type="button" data-target=".createsched" data-toggle="modal">
            Create Exam Schedule
            </button>
            </form>
            </div>
</div>
     
    <br>
      <div class="container">
       
              
           <ul class = "nav nav-tabs">
          <li><a href="OfadExamScheduler.jsp">Shifters</a></li>
          <li class="active"><a href="OfadExamScheduler2.jsp">Transferees</a></li>
          </ul>
          <div class="tab-content">
          <fieldset>
          <div class="table-responsive" style="overflow-x:auto; height:500px;">
              <table class="table table-stripped">
              <tr>
                  <th>Date</th>
                 <th>Time</th>
                 <th>Venue</th>
                 <th>Remarks</th>
                 <th>View Students</th>
                 <th></th>
              </tr>
              <%
               try{
            	   PreparedStatement p = conn.prepareStatement("SELECT DISTINCT(date), start_time, end_time, remarks FROM exam_schedules_transferees");
            	   ResultSet r = p.executeQuery();
            	     if(!r.next()){
            	        	out.println("<center><p style=color:red>No exam schedule set for students</p></center>");
            	        }
            	        else {
            	           do {
              %>
              <tr>
                   <td><%=r.getString("date") %></td>
                <td><%=r.getString("start_time") %> - <%=r.getString("end_time") %></td>
      <td></td>
                <td><%=r.getString("remarks") %></td>
                <td><a href="">View Students</a></td>
                <td><button type="submit" class="btn btn-warning">Edit</button></td>
              </tr>
              <%}while(r.next());
                    }
               } catch(SQLException e) {out.print(e);}
              %>
              </table>
              </div>
          </fieldset>
          </div>
     </div>
</div>
 <footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
					

</div>

<div class="modal fade createsched" role="dialog">
   <div class="modal-dialog modal-lg" style="width:1250px;">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <p class=""><i><span class="glyphicon glyphicon-list-alt"> Create Schedule</span></i></p>
         </div>
         <form action="CreateScheduleProcess2" method="post">
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
         
            
            <legend><p>List of students for examination(Transferees)</p></legend>
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>



<script>
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