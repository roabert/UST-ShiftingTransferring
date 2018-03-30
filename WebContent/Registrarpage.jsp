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
		<link rel="stylesheet" href="CSS/profile-style.css"type="text/css">
		<link rel="stylesheet" href="CSS/styles.css"type="text/css">
		<link rel="stylesheet" href="CSS/sidebar.css"type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<meta charset="ISO-8859-1">
<title>Registrar | Profile</title>
</head>

<body>
<%
String getuser = (String)session.getAttribute("setuser"); 
if(getuser == null) {
	 response.sendRedirect("login.jsp");
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
    <li><a href="Registrarpage.jsp" class="active"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="#"><span class="glyphicon glyphicon-pencil"></span> Endorsement</a>
    <ul class="submenu">
        <li><a href="RegistrarEndorse_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="RegistrarEndorse_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="#"><span class="glyphicon glyphicon-check"></span> Endorsed Students</a>
    <ul class="submenu">
        <li><a href="RegistrarApprovedEndorse_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="RegistrarApprovedEndorse_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
   
   PERSONAL INFORMATION
   </a>
   </center>
</div>
     <%
     String returnsql = "SELECT * FROM registrar WHERE userid = ?";
     try{
     PreparedStatement pst = conn.prepareStatement(returnsql);
     pst.setString(1, getuser);
     ResultSet usercontent = pst.executeQuery();
    
    %>
    <br>
  <div id="content">
    <div class="container">
                 <% while(usercontent.next()) { %>
                 
<div class="profile">

	<div class="wrap">
	
		<div class="profile-main">
		<fieldset>
		<legend>
		<p>USER ID: <%=usercontent.getString("userid") %></p>
		</legend>
			<div class="profile-pic wthree">
					
				<img src="Images/dp.png" alt="">
				<h2><%=usercontent.getString("last_name")%>, <%=usercontent.getString("first_name")%></h2>
			</div>
			<div class="w3-message">
				<h5><%=usercontent.getString("type") %>, <%=usercontent.getString("college") %></h5>
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
    </fieldset>
  </div>

</div>
</div>
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
   <div class="footer"></div>     
</body>
</html>