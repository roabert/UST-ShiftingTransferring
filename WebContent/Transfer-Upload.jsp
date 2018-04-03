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
<title>Insert title here</title>
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

            <p><i>STEP 1: UPLOAD PRE-REQUIREMENTS</i></p>
            
</div>
<div class="container">
 <form action="#">
			<legend>Official OTR</legend>
			<table>
  <tr>
    <th><input type="file" name="file" id="file" /></th>
    <th><input type="submit" name="upload" id="upload" value="Upload ( .JPG)" /></th>
    
  </tr>
 
</table>
			<legend>Certificate of Good Moral</legend>
			<table>
  <tr>
    <th><input type="file" name="file" id="file" /></th>
    <th><input type="submit" name="upload" id="upload" value="Upload ( .JPG)" /></th>
    
  </tr>
 
</table>
			<legend>Letter to the Guidance</legend>
			<table>
  <tr>
    <th><input type="file" name="file" id="file" /></th>
    <th><input type="submit" name="upload" id="upload" value="Upload ( .JPG)" /></th>
    
  </tr>
 
</table>
			<legend>Letter to the Dean</legend>
			<table>
  <tr>
    <th><input type="file" name="file" id="file" /></th>
    <th><input type="submit" name="upload" id="upload" value="Upload ( .JPG)" /></th>
    
  </tr>
 
</table>
			<legend>Photocopy of ID</legend>
			<table>
  <tr>
    <th><input type="file" name="file" id="file" /></th>
    <th><input type="submit" name="upload" id="upload" value="Upload ( .JPG)" /></th>
    
  </tr>
 
</table>
		
	</form>
</div>
          </div>
         <div id="footer">
        </div>
</div>
			 
	

		<div off-canvas="slidebar-1 left reveal">
			<center><img src="../images/dp.png" style="width:40%; height:15%;">
			<h1>Shifter</h1>
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
		<script type="text/javascript">
function swapImage(){
	var image = document.getElementById("imageToSwap");
	var dropd = document.getElementById("dlist");
	image.src = dropd.value;	
};
</script>
		 
		<script src="../scripts/slidebars.js"></script>
		<script src="../scripts/scripts.js"></script>
		 
</body>
</html>