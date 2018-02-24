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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/MainBody.css">
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="CSS/style.css">
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



<div id="mySidenav" class="sidenav">
<center>
<img src="Images/dp.png" style="width:40%; height:15%;">
<a href="Adminspage.jsp"><%=getuser %></a>

</center>
<br>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Ofadpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="OfadTransactions.jsp"><span class="glyphicon glyphicon-random"></span> Transactions</a>
  <a href="OfadExamResults.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Results</a>
  <a href="OfadEncodeScores.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-pencil"></span> Encode Scores</a>
  <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a>
</div>

<div id="main">

 
 <div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>
   
    <br>
      <div class="container">
    
      <legend><p><i>Encode Scores</i></p></legend>

 </div>
 <div class="container-fluid">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table">
        <tr>
          <th>ID</th>
          <th>Student Name</th>
          <th>Type</th>
          <th>Outgoing</th>
          <th>Incoming</th>
          <th>Score</th>
          <th>Done</th>
        </tr>
        
        
        <%
         try{
        String displayscores = "SELECT transferee_id, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newcourse, newprogram FROM transferees_status INNER JOIN student_transfer on transferees_status.transferee_id = student_transfer.id UNION SELECT shifter_id, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newcourse, newprogram FROM shifters_status INNER JOIN student_shifter on shifters_status.shifter_id = student_shifter.studentid WHERE ofad_verified = 'Approved'";
        String displaystudent = "SELECT studentid, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newprogram, newcourse FROM student_shifter UNION SELECT id, lastname, firstname, middlei, typeofstudent, oldschool, oldprogram, newprogram, newcourse FROM student_transfer";
        PreparedStatement ps = conn.prepareStatement(displayscores); 
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        %>
        <tr>
        <td><%=rs.getString("transferee_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("typeofstudent") %></td>
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newprogram") %> - <%=rs.getString("newcourse") %></td>
        <td><input type = "number" size="30" class="form-control" name="examscore_students"></td>
        <td><button type="submit" class="btn btn-warning">Submit</button></td>
        </tr>
        <%}
           
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
        
      </table>
      </center>
      </div>
  </fieldset>
  </div>
</div>



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