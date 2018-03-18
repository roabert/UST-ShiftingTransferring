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
			<h1>Dean<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Deanpage.jsp" ><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href=""><span class="glyphicon glyphicon-random"></span> Transactions</a>
    <ul class="submenu">
        <li><a href="DeanTransaction_Shifter.jsp"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanTransaction_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
    <li><a href=""><span class="glyphicon glyphicon-list-alt"></span> Exam Results</a>
      <ul class="submenu">
        <li><a href="DeanExam_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanExam_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
      </ul>
    </li>
  <li><a href="" class="active"><span class="glyphicon glyphicon-folder-open"></span> Memo</a>
  <ul class="submenu">
        <li><a href="DeanMemo_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span>Shifters</a></li>
        <li><a href="DeanMemo_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span>Transferees</a></li>
        
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
           <p><i>First Indorsement</i></p>
</div>
<br>
 
 <div class="container">
    
   

 </div>
  <div class="container">
  <fieldset>
      <div class="table-responsive" style="overflow-x:auto; height:500px;">
      <center>
      <table class="table table-striped">
        <tr>        
          <th>Student Name</th> 
          <th>Incoming</th>
          <th>Memo</th>
          <th>Finish</th>
        </tr>
        
        <% 
          try {
        	  PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_indorsement INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE dean_indorsed = 'In-progress'");
        	  ResultSet rs = ps.executeQuery();
        	  if(!rs.next()){
        		  out.println("<tr><p style=color:red>No Memo form received!</p></tr>");
        	  }
        	  else{
        	   do{
        %>

        <tr>
          <td><input type = "hidden" name = "studentid" value="<%=rs.getString("shifter_id")%>">
          <%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
          <td><input type="hidden" name = "getuser" value = "<%=getuser%>"><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
          <td><a id = "<%=rs.getString("shifter_id")%>" href="javascript:;">View Memo</a></td>
          <td><button type="button" class = "btn btn-warning dean_indorsement"
           data-target=".deanIndorse"
           data-toggle="modal"
           data-shifter_id = "<%=rs.getString("shifter_id") %>"
           data-getuser = "<%=getuser %>"
           >Endorse</button></td>
        </tr>
  
        <%}while(rs.next()); } } catch(SQLException e) {out.print(e);} %>
      </table>
      </center>
      </div>
  </fieldset>
  </div>
  
</div>
<footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="Images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
					

</div>

<div class="deanIndorse modal fade" role="dialog">
  <div class="modal-dialog" style="width:700px; height:800px;">
     <div class="modal-content">
     <form action="DeanIndorseProcess" method="post">
         <div class="modal-header">
             <button class="close" type="button" data-dismiss="modal">&times;</button>
             <h4 class="modal-title"><b>Dean Endorsement</b></h4>
         </div>
         <div class="modal-body"><br>
          <input class="shifter_id" type="hidden" name="studentid">
          <input class="getuser" type="hidden" name="getuser">
          <p>To the Secretary General,</p>
          <p>recommending approval of the application</p>
           <center>
          <textarea name="endorsement" rows="30" cols="60" placeholder="Remarks.." style="margin: 0px; width: 660px; height: 334px;"></textarea><br><br>
            <p><input type="checkbox" name="approval" value="Approved"> Approve Endorsement</p>
            </center>
         </div>
         <div class="modal-footer">
          <button type="submit" class="btn btn-lg btn-warning"><span class="glyphicon glyphicon-ok" style="color:green;"></span> Endorse Student</button>
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
     <script>
     $(document).on( "click", '.dean_indorsement',function(e) 
    		 {
    	    var shifter_id = $(this).data('shifter_id');
    	    var getuser = $(this).data('getuser');

    	    $(".shifter_id").val(shifter_id);
    	    $(".getuser").val(getuser);
    	//    tinyMCE.get('business_skill_content').setContent(content);   
    	});
     </script>
     
</body>
</html>