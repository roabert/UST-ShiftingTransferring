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
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="CSS/style.css">
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
<a href="Adminspage.jsp"><%=getuser %></a>

</center>
<br>
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="Adminspage.jsp"><span class="glyphicon glyphicon-arrow-right"></span> &nbsp&nbsp <span class="glyphicon glyphicon-user"></span> Profile</a>
  <a href="AdminsAccount.jsp"><span class="glyphicon glyphicon-duplicate"></span> Accounts</a>
  <a href="AdminsStudent.jsp"><span class="glyphicon glyphicon-pencil"></span> Students</a>
  <a href="logout.jsp"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a>
</div>

<div id="main">

<div class="header" ><center>
      <span style="font-size:30px;margin-top:-20px;cursor:pointer" onclick="openNav()">&#9776;</span>  
<img src="Images/usthead2.PNG" style="width:80%; height:auto;"/> 
</center>
</div>
     <%
    String returnsql = "SELECT * FROM admins WHERE userid = ?";
    try{
    PreparedStatement pst = conn.prepareStatement(returnsql);
    pst.setString(1, getuser);
    ResultSet usercontent = pst.executeQuery();
     
    
    %>
    <br>
      <div class="container">
          <fieldset>
            <legend><p><i>Profile Information</i></p></legend>
            <center>
            <div class="table-responsive">
            <% while(usercontent.next()) { %>
            <table class="table">
               <tr>
                 <td>Name</td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("last_name") %>, <%=usercontent.getString("first_name") %> <%=usercontent.getString("middle_name") %>" readonly class="form-control"></td>
                 <td rowspan = "3"><center><img src="Images/dp.png" style="width:50%; height:50%;" class="responsive"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("userid")%>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("type") %>" class="form-control" readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" size="60" value="<%=usercontent.getString("gender") %>" class="form-control" readonly></td>
                 <td><center><button type="button" onclick = "editProfile()" id="editprofile" class="btn btn-warning btn-sm">
                 <span class="glyphicon glyphicon-pencil"></span> &nbsp Edit Profile
                 </button>
                 <button type="button" onclick = "cancelEdit()" id="cancelbutton" class="btn btn-danger btn-sm" style="display:none;">
                 <span class="glyphicon glyphicon-remove"></span> &nbsp Cancel 	
                 </button>
                 <button type="button" onclick = "successEdit()" id="confirmbutton" class="btn btn-success btn-sm" style="display:none;">
                 <span class="glyphicon glyphicon-ok"></span> &nbsp Confirm
                 </button>
                 </center></td>
               </tr>
            </table>
            <script>
            function editProfile() {
            	document.getElementById("editprofile").style.display = "none";
            	document.getElementById("cancelbutton").style.display = "block";
            	document.getElementById("confirmbutton").style.display = "block";
            }
            function cancelEdit() {
            	document.getElementById("editprofile").style.display = "block";
            	document.getElementById("cancelbutton").style.display = "none";
            	document.getElementById("confirmbutton").style.display = "none";
            }
            </script>
            <%
               }
            }   catch(Exception e) {
            	e.printStackTrace();
            }         
            %>
            </div>
             </center>
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