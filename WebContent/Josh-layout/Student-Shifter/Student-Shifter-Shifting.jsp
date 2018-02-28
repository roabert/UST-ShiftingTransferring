<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="../css/sidebar.css">
		<link rel="stylesheet" href="../css/style.css">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<title>Shifting | UST Student-Shifter</title>
</head>
<body>





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
  <a href="#">Guidelines</a>
</div>

            <p><i>SHIFTING: SELECT OUTGOING PROGRAM</i></p>
            
</div>
<div class="container">
<div class="row">
  <div class="column">
    
    <center>
    <h2>Current Faculty</h2>
     
       
       
<!--     <select id="dlist" onChange="swapImage()">
<option value="../images/ust-ics.jpg">Institute of Information and Computing Sciences</option>
<option value="../images/ust-engg.jpg">Faculty of Engineering</option>
<option value="../images/ust-cfad.jpg">College of Fine Arts and Design</option>
</select> -->
    <h2>Current Program</h2>
   


<br>
<br>
 <img id="imageToSwap" style="width:auto;height:180px;"/>
    </center>
   
  </div>
  
  
  
  
  <div class="column">
    <center>
    <h2>Incoming Faculty</h2>
    
      <select id="country" ></select>
    <h2>Incoming Program</h2>
    <select id="state"></select>


<br>
<br>

    </center>
    
  </div>
</div>
          </div>
</div>
			              <footer class="footer-distributed">

			<div class="footer-left">
				<p class="footer-company-name"><img src="../images/seal.png" style="width:10%; height:auto;"/> CodeUS Operandi &copy; 2018</p>
			</div>

					</footer>
		</div>

		<div off-canvas="slidebar-1 left reveal">
			<center><img src="../images/dp.png" style="width:40%; height:15%;">
			<h1>Shifter</h1>
			</center>
 <nav class="navigation">
  <ul class="mainmenu">
    <li><a href="../Student-Shifter/Student-Shifter-Index.jsp">PROFILE</a></li>
    <li><a href="../Student-Shifter/Student-Shifter-Shifting.jsp" class="active">SHIFTING</a></li>
    <li><a href="../Student-Shifter/Student-Shifter-Tracker.jsp">TRACKER</a>
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
		<script language="javascript">
            populateCountries("country", "state");
        </script>
		<script type="text/javascript">
function swapImage(){
	var image = document.getElementById("imageToSwap");
	var dropd = document.getElementById("country");
	image.src = dropd.value;	
};

</script>
 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="../scripts/slidebars.js"></script>
		<script src="../scripts/scripts.js"></script>
		 
</body>
</html>