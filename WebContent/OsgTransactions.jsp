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
<link rel="stylesheet" href="CSS/CssBody.css">
<link rel="stylesheet" href="CSS/MainBody.css">
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/Login_CSS.css">
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



<div id="mySidenav" class="sidenav">

<center>
<img src="Images/dp.png" style="width:40%; height:15%;">
<a href="Osgpage.jsp"><%=getuser %></a>
<br>
</center>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Osgpage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="OsgTransactions.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-random"></span> Transactions</a>
  <a href="OsgEndorsement.jsp"><span class="glyphicon glyphicon-pencil"></span> Endorsement</a>
  <a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a>
</div>

<div id="main">

 
   <div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div><br>
  <div class="container">
    
      <legend><p><i>Transactions</i></p></legend>

 </div>
 <div class="container-fluid">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <form action = "OSG_verifyprocess" method = "post">
      <table class="table">
        <tr>
          <th>ID</th>
          <th>Student Name</th>
          <th>Type</th>
          <th>Outgoing</th>
          <th>Incoming</th>
          <th>Verify Docs</th>
          <th>Remarks</th>
          <th>Done</th>
        </tr>
        
        
        <%
         try{
        String displaystudent_osg = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE secgen_verified is NULL AND dean_verified = 'Approved'";
        String displaystudent = "SELECT studentid, lastname, firstname, middlei, typeofstudent, oldcourse, oldprogram, newprogram, newcourse FROM student_shifter UNION SELECT id, lastname, firstname, middlei, typeofstudent, oldschool, oldprogram, newprogram, newcourse FROM student_transfer";
        PreparedStatement ps = conn.prepareStatement(displaystudent_osg); 
        ResultSet rs = ps.executeQuery();
        if(!rs.next()){
        	out.println("<tr><p style=color:red>No transactions returned</p></tr>");
        }
        else {
           do {
        %>
        <tr>
        <td><input type="hidden" value = "<%=rs.getString("shifter_id")%>" name = "studentid">
        <input type="hidden" value = "<%=getuser%>" name = "getuser"><%=rs.getString("shifter_id") %></td>
        <td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
        <td><%=rs.getString("typeofstudent") %></td>
        <td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
        <td><%=rs.getString("newprogram") %> - <%=rs.getString("newcourse") %></td>
        <td><a href="javascript:;" data-target=".viewdocument" data-toggle="modal">View Documents</a></td>
        <td><select class="form-control" name="remarks">
        <option value="Approved">Approve</option>
        <option value="Disapproved">Disapprove</option>
        
        </select></td>
        <td><button type="submit" class="btn btn-warning" onclick= "return confirm('Are you sure?');">Submit</button></td>
        </tr>
        <%}while(rs.next());
        }  
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
        
      </table>
      </form>
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