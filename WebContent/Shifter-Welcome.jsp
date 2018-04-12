<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import = "DatabaseHandler.SingletonDB" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 
<head>
<meta charset="ISO-8859-1">
<title>Shifter | Profile</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("shifteruser"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}	
%>

<div off-canvas="slidebar-1 left reveal">
		<div>
		<br>
		 <%
    
    String returnsql1 = "SELECT * FROM student_shifter WHERE studentid = ?";
    try{
    PreparedStatement psts = conn.prepareStatement(returnsql1);
    psts.setString(1, getuser);
    ResultSet rs = psts.executeQuery();
     
    while(rs.next()) {
    %>
			<center>
			<navhead>
			<img src="DisplayProfilePic?pkey=<%=rs.getInt("studentid")%>"  width = "150" height = "150" class="responsive">
           
			<%} }catch(SQLException e) {out.print(e);} %>
			<h1>Student<br></h1>
			<p><span><%=getuser %></span><br></p>
			</navhead>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Shifter-Welcome.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="Shifter-Shifting.jsp"><span class="glyphicon glyphicon-random"></span> Shifting</a></li>
    <li><a href="Shifter-Tracker.jsp"><span class="glyphicon glyphicon-search"></span> Tracker</a></li>
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
   PERSONAL INFORMATION  
   </a> 
   </center>
  
</div>
 <%
    
    String returnsql = "SELECT * FROM student_shifter WHERE studentid = ?";
    try{
    PreparedStatement pst = conn.prepareStatement(returnsql);
    pst.setString(1, getuser);
    ResultSet usercontent = pst.executeQuery();
     
    
    %>
      <div id="content">
    <div class="container">
    <% while(usercontent.next()) { %>
<div class="profile">

	<div class="wrap">
	
		<div class="profile-main">
		<fieldset>
		<legend>
		<p>USER ID: <%=usercontent.getString("studentid") %></p>
		</legend>
		</fieldset>
			<div class="profile-pic wthree">
					
				<img src="DisplayProfilePic?pkey=<%=usercontent.getInt("studentid")%>" width = "250" height = "250" class="responsive">
           
				<h2><%=usercontent.getString("lastname")%>, <%=usercontent.getString("firstname")%></h2>
			</div>
			
			<div class="w3-message">
			<a>Type</a> <br>
				<h5><%=usercontent.getString("typeofstudent") %></h5><br><a>Program</a> 
				<%if(usercontent.getString("shifting_approved") == null) { %>
				<h5><%=usercontent.getString("oldprogram") %></h5>
				<%} else { %>
				<h5><%=usercontent.getString("newprogram") %></h5>
				<%} %>
			<div class="w3ls-touch">
			</div>
			</div>
			            <%
               }
            }   catch(Exception e) {
            	e.printStackTrace();
            }         
            %>
		</div>
  </div>

</div>
</div>
</div>
  
</div>

</div>     
            
            <%-- <div class="table-responsive">
            <% while(usercontent.next()) { %>
            <table class="table">
               <tr>
                 <td>Name </td>
                 <td><input type="text" class="form-control" size="60" value = "<%=usercontent.getString("lastname")%>, <%=usercontent.getString("firstname")%> <%=usercontent.getString("middlei") %>"  readonly></td>
                 <!--
                 <td rowspan = "5"><center><img src="Images/dp.png" style="width:50%; height:50%;" class="responsive"></center></td>
                 -->
                 <td rowspan = "5"><center><img src="DisplayProfilePic?pkey=<%=usercontent.getInt("studentid")%>" width = "250" height = "250" class="responsive"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getInt("studentid")%>"  readonly></td>
               </tr>
               <tr>
                 <td>Program </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("oldprogram") %>"  readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("typeofstudent") %>"  readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("gender") %>"  readonly></td>
               </tr>
               <tr>
                 <td>Outgoing: </td>
                 <td><input type="text" class="form-control" size="60" value="<%=usercontent.getString("newprogram") %>"  readonly></td>
                 <td><center><button type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span>Edit Profile</button></center></td>
               </tr>
            </table>
            <%
               }
            }   catch(Exception e) {
            	e.printStackTrace();
            }         
            %>
            </div> --%>
            

 
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
     <div class="footer"></div>
</body>
</html>