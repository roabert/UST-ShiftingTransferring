
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
        <%@ page import = "DatabaseHandler.SingletonDB" %>
        <%@ page import = "ust.registrar.model.admin.*" %>
   <% Connection conn = SingletonDB.getConnection(); %>
<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
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
<script type="text/javascript" src="jszip/dist/jszip.js"></script>

<head>
<meta charset="ISO-8859-1">
<title>Administrator | Students</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("administrator"); 
if(getuser == null) {
	 response.sendRedirect("logout.jsp");
}
ClearDocumentsDAO clearDocs = new ClearDocumentsDAO();	
%>



<div off-canvas="slidebar-1 left reveal">
		<div>
		<navhead>
		<br>
			<center><img src="Images/dp.png" style="width:40%; height:15%;">
			
			<h1>Administrator<br></h1>
			<p><span><%=getuser %></span><br>
			</center>
			</navhead>
			 <nav class="navigation">
    <ul class="mainmenu">
    <li><a href="Adminspage.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
    <li><a href="AdminsAccount.jsp"><span class="glyphicon glyphicon-duplicate"></span> Accounts</a></li>
    <li><a href="#" class="active"><span class="glyphicon glyphicon-pencil"></span> Students</a>
    <ul class="submenu">
        <li><a href="AdminsStudent_Shifter.jsp" ><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
        <li><a href="AdminsStudent_Transfer.jsp" class="active"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
      </ul>
    </li>
    <li><a href="AdminCourses.jsp"><span class="glyphicon glyphicon-duplicate"></span> Courses</a></li>
     <li><a href="AdminLogs.jsp" ><span class="glyphicon glyphicon-inbox"></span> Logs</a></li>
    <li><a href="logout.jsp?userset=<%=getuser%>"> <span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
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
   
   STUDENT DOCUMENTS
   </a>
   </center>
</div>
    <br>
    
      <div class="container-fluid">
       <div class="table-responsive" style="overflow:auto; height:450px;">
      <center>
      <table class="table table-striped table-sortable">
         <thead>
         <tr>
          <th><input type="checkbox" onclick = "checkAll(this)"></th>
          <th>ID</th>
          <th>Student Name</th>
          <th>Type</th>
          <th>Outgoing</th>
          <th>Incoming</th>
          <th>View Documents</th>
		  <th>Clear Documents</th>
		  </tr>    
        </thead>
        
        <tbody>
        <%
         try{
        String displaystudent = "SELECT * FROM transferees_status INNER JOIN student_transfer on transferee_id = student_transfer.userid";
        PreparedStatement ps = conn.prepareStatement(displaystudent); 
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        	   String status = clearDocs.checkStatusTransfer(conn, rs.getString("userid"));
        %>
        <tr>
			<td><input type="checkbox" name="deletestudent[]" id="deletestudent[]" value="<%=rs.getString("userid") %>"></td>
			<td><%=rs.getString("userid") %></td>
			<td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
			<td><%=rs.getString("typeofstudent") %></td>
			<td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
			<td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><button class="btn" href="javascript:;" id="<%=rs.getString("userid")%>" data-target=".viewdocument" data-toggle="modal">View Documents</button></td>
		
		<td>
	        <form method="POST" action ="ClearDocumentsTransfer">
	        <input name="id" type=hidden value="<%=rs.getString("userid") %>">
	        <input name="status" type=hidden value="<%= status %>">
	        <button class="btn btn-warning pull-right" type="submit" 
	        <%
	        if(status.equals("NA")){
	        %>	
	        	disabled
	        <%
	        }
	        %>
	        >
		    Clear Documents
	        </button>
	        </form>
        </td>
        
        </tr>
        <%}
           
         }catch(Exception e) {
        	e.printStackTrace();
        } %>
		</tbody>
        
      </table>
      </center>
      
      </div>
       <form action ="admin_removestudent"><button type="submit" class="btn btn-warning btn-lg pull-right">Clear all</button></form>
      
	        
   			<a id="archive" download="Download.zip" type=".zip">
   			<button type="submit" class="btn btn-warning btn-lg pull-right" style="margin-right:10px;">
   			Archive All
   			</button>
   			</a>
   			
      </div>
      
      <br><br>
</div>
</div>

     <div class="footer"></div>
		<script src="scripts/slidebars.js"></script>
		<script src="scripts/scripts.js"></script>


<script language="JavaScript">
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
function checkAll(source) {
	checkboxes = document.getElementByID("deletestudent[]");
	for(var i in checkboxes) {
		checkboxes[i].checked = source.checked;
	}
}

var zip = new JSZip();

//Add an top-level, arbitrary text file with contents
zip.file("Hello.txt", "Hello World\n");

<%
 try{
String displaystudentagain = "SELECT * FROM transferees_status INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE dean_verified = 'Approved'";
PreparedStatement ps2 = conn.prepareStatement(displaystudentagain); 
ResultSet rs2 = ps2.executeQuery();
int count=0;
String text="";
if(!rs2.next()){
}
else {
  do {
%>  

<%
String displayrequirement = "SELECT * FROM transferees_requirements WHERE transferee_id = ?";
PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
ps3.setString(1, rs2.getString("transferee_id"));
ResultSet rs3 = ps3.executeQuery();
while(rs3.next()){
%>

<%
}
%>

<%} while(rs2.next());
}  
}catch(Exception e) {
	e.printStackTrace();
} %> 

var img = zip.folder("images");
img.file("smile.gif");

//Generate the zip file asynchronously
zip.generateAsync({type:"blob"})
.then(function(content) {
 // Force down of the Zip file
	archive.href = URL.createObjectURL(content);
});
</script>
       <script type="text/javascript">
		 $(document).ready(function() {
		        <%
		         try{
		             String displaystudent = "SELECT * FROM transferees_status INNER JOIN student_transfer on transferee_id = student_transfer.userid";
		             PreparedStatement ps2 = conn.prepareStatement(displaystudent); 
		             ResultSet rs2 = ps2.executeQuery();
		        if(!rs2.next()){
		        }
		        else {
		          do {
		        %>   
				$("#<%=rs2.getString("userid")%>").click(function() {
					$.fancybox.open([
				        <%
				        String displayrequirement = "SELECT * FROM transferees_requirements WHERE transferee_id = ?";
				        PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
				        ps3.setString(1, rs2.getString("userid"));
				        ResultSet rs3 = ps3.executeQuery();
				        while(rs3.next()){
				        %>
						{
							href : "DisplayRequirementTransfer?pkey=<%=rs3.getInt("id")%>.jpg",
							title: "<a href='DisplayRequirementTransfer?pkey=<%=rs3.getInt("id")%>.jpg' target='_blank' download='<%= rs2.getString("userid") %>.jpg'>Download</a>"
						},
						<%
				        }
						%>
					], {
						helpers : {
							thumbs : {
								width: 75,
								height: 50
							}
						}
					});
	         	});
	        <%} while(rs2.next());
		         }  
		         }catch(Exception e) {
		        	e.printStackTrace();
		        } %> 
         })
         </script>  
     
</body>
</html>