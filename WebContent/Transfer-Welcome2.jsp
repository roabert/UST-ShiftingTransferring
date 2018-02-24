<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="CSS/sidebar.css">
		<link rel="stylesheet" href="CSS/sidebar-style.css">
		<link rel="stylesheet" href="CSS/style.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Student-Transferee</title>
</head>
<body>





<div canvas="contain">
<div id="main">
<div id="wrapper">

<div class="header" ><center>
      <span style="font-size:50px;margin-top:-20px;cursor:pointer" class="js-toggle-left-slidebar">&#9776;</span>  
<img src="../images/header-image.png" style="width:80%; height:auto;"/> 
</center>
</div>

            <p><i>PROFILE INFORMATION</i></p>
</div>
<div class="container">

            <center>
            <div class="table-responsive">
            <table class="table">
               <tr>
                 <td>Name </td>
                 <td><input type="text" value="SAMPLE" class="form-control" size="15" size="50" readonly></td>
                 <td rowspan = "6"><center><img src="../images/dp.png" style="width:50%; height:50%;"></center></td>
               </tr>
               <tr>
                 <td>ID </td>
                 <td><input type="text" value="SAMPLE" class="form-control" size="50" readonly></td>
               </tr>
               <tr>
                 <td>Program </td>
                 <td><input type="text" value="SAMPLE" class="form-control" size="50" readonly></td>
               </tr>
               <tr>
                 <td>Type </td>
                 <td><input type="text" value="SAMPLE"class="form-control" size="50" readonly></td>
               </tr>
               <tr>
                 <td>Gender </td>
                 <td><input type="text" value="SAMPLE" class="form-control" size="50" readonly></td>
               </tr>
               <tr>
                 <td>Outgoing: </td>
                 <td><input type="text" value="SAMPLE" class="form-control" size="50" readonly></td>
                 </tr>
               <tr>
                 <td></td>
                 <td></td>
                 <td><center><button type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span>Edit Profile</button>
                 <button type="button" class="btn btn-warning btn-sm"><span class="glyphicon glyphicon-pencil"></span>Change Password</button>
               </center></td>
               </tr>
            </table>
           
            </div>
             </center>
          </div>
</div>
			<div id="footer">
        </div>
		</div>

		<div off-canvas="slidebar-1 left reveal">
			<center><img src="../images/dp.png" style="width:40%; height:15%;">
			<h1>Transferee</h1>
			</center>
 <nav class="navigation">
  <ul class="mainmenu">
    <li><a href="Transfer-Welcome.jsp">PROFILE</a></li>
    <li><a href="Transfer-Transferring.jsp">TRANSFERRING</a></li>
    <li><a href="Transfer-Tracker.jsp">TRACKER</a>
<!--       <ul class="submenu">
        <li><a href="">Tops</a></li>
        <li><a href="">Bottoms</a></li>
        <li><a href="">Footwear</a></li>
      </ul>
 -->    </li>
    <li><a href="">LOGOUT</a></li>
  </ul>
</nav>


		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="../scripts/slidebars.js"></script>
		<script src="../scripts/scripts.js"></script>
		 
</body>
</html>