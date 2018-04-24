<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.util.*" %>
    <%@ page import="java.sql.*" %>
    
    <%@ page import="java.time.format.DateTimeFormatter" %>
    <%@ page import="java.time.LocalDateTime" %>
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
<script type="text/javascript" src="jszip-utils-master/dist/jszip-utils.js"></script>

<head>
<meta charset="ISO-8859-1">
<title>Administrator | Students</title>
</head>
<body>
<%
String getuser = (String)session.getAttribute("administrator"); 
if(getuser == null) {
	response.setHeader("Cache-Control","no-store"); //HTTP 1.1 
	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Pragma","no-cache"); //HTTP 1.0 
	response.setDateHeader ("Expires", 0); //prevents caching at the proxy server 
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
        <li><a href="AdminsStudent_Shifter.jsp" class="active"><span class="glyphicon glyphicon-cloud-upload"></span> Shifters</a></li>
       
        <li><a href="AdminsStudent_Transfer.jsp"><span class="glyphicon glyphicon-cloud-download"></span> Transferees</a></li>
        
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
        String displaystudent = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid";
        PreparedStatement ps = conn.prepareStatement(displaystudent); 
        ResultSet rs = ps.executeQuery();
           while(rs.next()) {
        	   String status = clearDocs.checkStatusShifter(conn, rs.getString("studentid"));
        %>
        <tr>
			<td><%=rs.getString("studentid") %></td>
			<td><%=rs.getString("lastname") %>, <%=rs.getString("firstname") %> <%=rs.getString("middlei") %></td>
			<td><%=rs.getString("typeofstudent") %></td>
			<td><%=rs.getString("oldcourse") %> - <%=rs.getString("oldprogram") %></td>
			<td><%=rs.getString("newcourse") %> - <%=rs.getString("newprogram") %></td>
        <td><button type="button" class="btn" id="<%=rs.getString("shifter_id")%>" href="javascript:;">View Documents</button></td>		
		<td>
	        <form method="POST" action ="ClearDocumentsShifter">
	        <input name="id" type=hidden value="<%=rs.getString("studentid") %>">
	        <input name="status" type=hidden value="<%=status %>">
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
      
      		<%
      	   	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss"); 
      	   	LocalDateTime now = LocalDateTime.now();  
      		%>
	        
   			<a id="archive" download="ShifterArchive<%= dtf.format(now) %>.zip" type=".zip">
   			<button type="submit" class="btn btn-warning btn-lg pull-right" style="margin-right:10px;">
   			Archive Documents
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
//create archive before loading process begin
var zip = new JSZip();

//image list to add:
var images = [
<%
 try{
     String displaystudentagain = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid";
     PreparedStatement ps2 = conn.prepareStatement(displaystudentagain); 
     ResultSet rs2 = ps2.executeQuery();
if(!rs2.next()){
}
else {
	
  do {
%>   
        <%
        String displayrequirement = "SELECT * FROM shifters_requirements WHERE shifter_id = ?";
        PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
        ps3.setString(1, rs2.getString("shifter_id"));
        ResultSet rs3 = ps3.executeQuery();
        while(rs3.next()){
        %>
        "DisplayRequirement?pkey=<%=rs3.getInt("id")%>.jpg",
		<%
        }
		%>
<%} while(rs2.next());
 }  
 }catch(Exception e) {
	e.printStackTrace();
} %> 
],
index = 0;  // for loader

// function to load a single image as arraybuffer using XMLHttpRequests
// it will assume cross-origin usage is allowed
function loadAsArrayBuffer(url, callback) {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", url);
  xhr.responseType = "arraybuffer";
  xhr.onerror = function() {/* handle errors*/};
  xhr.onload = function() {
    if (xhr.status === 200) {callback(xhr.response, url)}
    else {/* handle errors*/}
  };
  xhr.send();
}

// loading process. Here it will load one and one image.
// You can modify it to load several at once but some browsers put
// a cap on how many XHR connections can be open at the same time..
(function load() {
  if (index < images.length) {
    loadAsArrayBuffer(images[index++], function(buffer, url) {
      var filename = getFilename(url);
      zip.file(filename, buffer); // image has loaded, add it to archive
      load();                     // load next image
    })
  }
  else {                          // done! present archive somehow
    zip.generateAsync({type:"blob"}).then(function(content) {
      // save out
    	archive.href = URL.createObjectURL(content);
    });
  }
})();

// Just for this demo! keep separate array with filename or
// modify to allow for "filename-less" uris.
function getFilename(url) {
  return url.substr(url.lastIndexOf("/") + 1)
}
</script>
       <script type="text/javascript">
		 $(document).ready(function() {
		        <%
		         try{
		        String displaystudentagain = "SELECT * FROM shifters_status INNER JOIN student_shifter on shifter_id = student_shifter.studentid";
		        PreparedStatement ps2 = conn.prepareStatement(displaystudentagain); 
		        ResultSet rs2 = ps2.executeQuery();
		        if(!rs2.next()){
		        }
		        else {
		          do {
		        %>   
				$("#<%=rs2.getString("shifter_id")%>").click(function() {
					$.fancybox.open([
				        <%
				        String displayrequirement = "SELECT * FROM shifters_requirements WHERE shifter_id = ?";
				        PreparedStatement ps3 = conn.prepareStatement(displayrequirement); 
				        ps3.setString(1, rs2.getString("shifter_id"));
				        ResultSet rs3 = ps3.executeQuery();
				        while(rs3.next()){
				        %>
						{
							href : "DisplayRequirement?pkey=<%=rs3.getInt("id")%>.jpg",
							title: "<a href='DisplayRequirement?pkey=<%=rs3.getInt("id")%>.jpg' target='_blank' download='<%= rs2.getString("shifter_id") %>.jpg'>Download</a>"
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