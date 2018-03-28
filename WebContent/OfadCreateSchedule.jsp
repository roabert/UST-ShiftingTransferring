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
		<link rel="stylesheet" href="CSS/style.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
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
           
            <div class="container">
             <p><i>Create Schedule</i></p> <br>
             <div class = "col-sm-4">
                <p>Date of Exam</p>
               <input type = "date" class="form-control" name = "examdate">
             </div>
             <div class = "col-sm-4">
                <p>Start Time</p>
               <input type = "time" class="form-control" name = "starttime">
             </div>
             <div class = "col-sm-4">
                <p>End Time</p>
               <input type = "time" class="form-control" name = "endttime"><br>
             </div><br><br><br>
            <form action="javascript:;">
            <button class="btn btn-warning" type="button" data-target=".insertstudent" data-toggle="modal">
            Add Student
            </button>
            </form>
            <fieldset>
             <legend><p></p></legend>
              <div class="table-responsive" style="overflow:auto; height:150px;">
             <table class="table">
               
             </table>
             </div>
             <br>
         
            </fieldset>
            </div>
            
            <br>
            <center>   <textarea rows="10" cols="100%" placeholder="Remarks"></textarea><br><br>
            <button type="submit" class="btn btn-warning btn-lg">Create</button></center>
</div>
     
    <br>
      
</div>
</div>

<div class="modal fade insertstudent" role="dialog">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <p class=""><i><span class="glyphicon glyphicon-list-alt"> List of students</span></i></p>
         </div>
         <form></form>
         <div class="modal-body" style="overflow:auto;">
       
         <div class="container">
          <div class="table-responsive" style="overflow-x:auto; height:300px;">
          <%try {
        	  PreparedStatement ps = conn.prepareStatement("SELECT shifter_id, lastname, firstname, middlei, newcourse, newprogram FROM shifters_exams INNER JOIN student_shifter on shifters_exams.shifter_id = student_shifter.studentid");
        	  ResultSet rs = ps.executeQuery();
        	  
           %>
             <table class="table">
                 <tr>
                 <th><input type="checkbox" value="<%%>"></th>
                 <th>ID</th>
                 <th>Student Name</th>
                 <th>Outgoing</th>
                 </tr>
                 <%while(rs.next()) { %>
                 <tr>
                  <td><input type="checkbox" value ="<%=rs.getString("shifter_id") %>"></td>
                  <td><%=rs.getString("shifter_id") %></td>
                  <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
                  <td><%=rs.getString("newcourse") %>, <%=rs.getString("newprogram") %></td>
                  </tr>
                   <%
                   }  
                 } catch(SQLException e){out.print(e);} %>
             </table>
           
             </div>
         </div>
         </div>
         <div class="modal-footer">
           <button type="type" class="btn btn-warning">Confirm</button>
         </div>
      </div>
   </div>
</div>

     <div class="footer"></div>

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