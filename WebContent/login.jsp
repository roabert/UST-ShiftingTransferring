<!DOCTYPE html>
<%@ page import ="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import = "DatabaseHandler.SingletonDB" %>
<% Connection conn = SingletonDB.getConnection(); %>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="CSS/Login_CSS.css">
<link rel="stylesheet" href="CSS/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="scripts/easyResponsiveTabs.js" type="text/javascript"></script>
		    <script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container	
			        });
			    });
				
</script>	
<!--script-->
<!---Google Analytics Designmaz.net-->
<script>(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-35751449-15', 'auto');ga('send', 'pageview');
  </script>

<script>
var country_arr = new Array
(
<% 
String getColleges = "SELECT * FROM faculty ORDER BY faculty_name";
String getCourses = "SELECT * FROM courses ORDER BY faculty";
try{
PreparedStatement pst = conn.prepareStatement(getColleges);
ResultSet colleges = pst.executeQuery();
while(colleges.next()) { 
	
	
%>
//Notice the quotation marks
"<%= colleges.getString("faculty_name") %>",

<%	
}
}catch(Exception e) {
	e.printStackTrace();
}
%>
);
<%
try{
	PreparedStatement pst = conn.prepareStatement(getColleges);
	PreparedStatement pst2 = conn.prepareStatement(getCourses);
	ResultSet colleges = pst.executeQuery();
	int index = 1;
	%>
	var s_a = new Array();
	s_a[0] = "";
	<%
	while(colleges.next()){
		ResultSet courses = pst2.executeQuery();
		String[] courseArray = new String[15];
		int arrayIndex = 0;
		%>
		<%
		while(courses.next()){
			if(courses.getString("faculty").equals(colleges.getString("faculty_name")))
			{
				courseArray[arrayIndex] = courses.getString("courses_name");
				arrayIndex++;
			}
			
		}
	    int count = 0;
	    for(String S : courseArray){
	        if (S != null)
	            ++count;
		}
	    String[] courseArrayFinal = new String[count];
	    int indexCount = 0;
	    for(String S : courseArray){
	        if (S != null)
	        	courseArrayFinal[indexCount] = S;
	            ++indexCount;
		}
		String coursesString = String.join("|", courseArrayFinal);
		%>
		s_a[<%= index %>] = "<%= coursesString %>";
		<%
		index++;
	}
}catch(Exception e) {
	e.printStackTrace();
}

%>
//Courses


function populateStates(countryElementId, stateElementId) {

 var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

 var stateElement = document.getElementById(stateElementId);

 stateElement.length = 0; // Fixed by Julian Woods
 stateElement.options[0] = new Option('------Select Program------', '');
 stateElement.selectedIndex = 0;

 var state_arr = s_a[selectedCountryIndex].split("|");

 for (var i = 0; i < state_arr.length; i++) {
     stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
 }
}

function populateCountries(countryElementId, stateElementId) {
 // given the id of the <select class="form-control"> tag as function argument, it inserts <option> tags
 var countryElement = document.getElementById(countryElementId);
 countryElement.length = 0;
 countryElement.options[0] = new Option('------Select Faculty------', '-1');
 countryElement.selectedIndex = 0;
 for (var i = 0; i < country_arr.length; i++) {
     countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
 }

 // Assigned all countries. Now assign event listener for the states.

 if (stateElementId) {
     countryElement.onchange = function () {
         populateStates(countryElementId, stateElementId);
     };
 }
}
</script>

<title>UST - Shifting and Transferring System</title>
</head>	

<body>
    <div id="wrapper">
    
    <div class="head">
		<div class="logo">
			<div class="logo-top">
			<h1>
			<img src="Images/thelogo.png" width="200" height="auto">
			</h1>
				<h1>UNIVERSITY OF SANTO TOMAS</h1>
				<h2>Shifting and Transferring System</h2>
			</div>
			<div class="logo-bottom">
				<section class="sky-form">									
					<h1></h1>
					<br>
				</section>
			</div>
		</div>		
		<div class="login">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Login</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><label>/</label><span>Guide</span></li>

					</ul>				  	 
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="login-top">
								<form method="post" action="loginprocess">
								
									<input type="text" name="userbox"class="name active" required placeholder="User ID"/>
									<input type="password" name="pwdbox" class="password" required placeholder="Password"/>

									<center>
									<br>
										<a href="javascript:;" data-toggle="modal" data-target="#forgotpassword">Forgot your password?</a>									
									<br>
										<input type="submit" value="LOGIN" class="button"/>
										</center>
									
								</form>
								<center>
							<a href="javascript:;" data-toggle="modal" data-target=".register" style="color:black;"><h4> or Register here</h4></a>
											</center>
							</div>
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
						 <div class="announcement">
  <h3>For Shifters:</h3>
<p>Use your student number as your USER ID.</p>
<p>(ex. 2014069622)</p>
<p>Use your birthday as your password.</p>
<p>(ex. yyyy-mm-dd)</p>
</div>
<br>
<div class="announcement">
  <h3>For Transferees:</h3>
<p>Use your registered name as your USER ID.</p>
<p>(ex. LastnameFirstnameMI)</p>
<p>Use your birthday as your password.</p>
<p>(ex. yyyy-mm-dd)</p>
</div>
						<div class="login-top">
	
							</div>
							
						</div>							
					</div>	
				</div>
			</div>	
		</div>	
		<div class="clear"></div>
	</div>	
	
	
      <!--  <div class="header" ><center>
 <img src="Images/usthead2.PNG" style="width:80%; height:auto;"/>
</center>

  </div>
  
  
<div class="container-fluid">
<div class="col-sm-8">
<h1>Shifting Guidelines</h1>
 <div style="background-color:#edeeef; word-wrap: break-word; height:350px; width:100%">

</div>
<h1>Transferring Guidelines</h1>
 <div style="background-color:#edeeef; word-wrap: break-word; height:350px; width:100%">
 </div>
 <br><br>
</div>

<div class="one">
<div class="col-sm-4">
<br>


<br>
<form method="post" action="loginprocess">
<p style="color:gold; font-size: 3vw; font-size: 3vh;">Login your account:</p>
<br>
<h1>Welcome</h1><br>
<input type="text" class="form-control" name="userbox"  style="width:100%; height:auto;" placeholder="User ID"/> <br>
<input type="password" name="pwdbox"  style="width:100%; height:auto;" placeholder="Password"/><br>
<a href="javascript:;" data-toggle="modal" data-target=".forgotpassword">Forgot your password?</a>
<br><br>
<center><button type="submit" class="pull-center btn btn-lg btn-warning">Login</button></center>

</form>
<center><a href="javascript:;" data-toggle="modal" data-target=".register" style="color:black;"><h4> or Register here</h4></a></center>
<br><br>
<br>

</div>
</div>
</div> -->
<!-- Forgot password dialog -->
 <div class="modal fade" role="dialog" id="forgotpassword">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
          <div class="modal-header" style="background-color:#EFB652">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-lock"></span> Password Recovery</h4>
       
          </div>
          <form action = "ForgotPassword" method ="POST">
          <div class="modal-body">
             <center>
             
              <table class="table">
                <tr> 
                   <td>Email: </td>
                   <td><input type="email" class="form-control" name="email_recovery"  required></td>
                </tr>
              </table>
           
             </center>
          </div>
          <div class="modal-footer">
              <button class="btn btn-md btn" type="button" data-dismiss="modal">Cancel</button>
             <button type="submit" class="btn btn-warning btn-md" value="Submit">Submit</button>            
          </div>
             </form>
      </div>
    </div>
 </div>
 
  <div class="modal fade" role="dialog" id="passwordrecovery">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
          <div class="modal-header" style="background-color:#EFB652">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-lock"></span> Enter your pass code</h4>
          </div>
          <form action = "CodeConfirm" method ="POST">
          <div class="modal-body">
          
          <h4>Enter the code you received from email:</h4>      
          <br>
             <center>
             
              <table class="table">
                <tr> 
          <% String getemail = (String)request.getAttribute("setemail"); %>
                   <td>Passcode: <input type="hidden" name="get_confirmedemail" value="<%=getemail%>"></td>
                   <td><input type="text" class="form-control" name="passcode"  required></td>
                </tr>
              </table>
           
             </center>
          </div>
          <div class="modal-footer">
          <button class="btn btn-md btn" type="button" data-dismiss="modal">Cancel</button>
          <button type="submit" class="btn btn-warning btn-md" value="Submit">Submit</button>          
          </div>
             </form>
      </div>
    </div>
 </div>
 
 <!-- change PAssword modal -->
 
  <div class="modal fade" role="dialog" id="changepassword">
    <div class="modal-dialog modal-md">
      <div class="modal-content">
          <div class="modal-header" style="background-color:#EFB652">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><span class="glyphicon glyphicon-lock"></span> Change your password</h4>
          </div>
          <form onsubmit ="return false" id = "changepasswordform">
          <div class="modal-body">
           <%String getemail1 = (String)request.getAttribute("set_email"); %>
           <input type="hidden" name="getemail1" value="<%=getemail1%>">
          <h4>Change your password: </h4>
          <br>
             <center>
             
              <table class="table">
                <tr> 
                   <td>Password: </td>
                   <td><input type="password" class="form-control" id="password1" name="change_password" required></td>
                </tr>
                   <tr> 
                   <td>Change Password: </td>
                   <td><input type="password" class="form-control" id="passwordconfirm" name="change_retypepassword"  required></td>
                </tr>
              </table>
           
             </center>
          </div>
          <div class="modal-footer">
          <button class="btn btn-md btn" type="button" data-dismiss="modal">Cancel</button>
          <button type="button" onclick = "changePassword()" class="btn btn-warning btn-md" value="Submit">Change Password</button>          
          </div>
             </form>
      </div>
    </div>
 </div>
 
<script>
function id(x) {
	return document.getElementById(x);
}
function determineStudent() {
	var lname = id("register_lname").value;
	var fname = id("register_fname").value;
	var mi = id("register_mi").value;
	var gender = id("register_gender").value;
	var bdate = id("register_bday").value;
	
	if(lname.length > 0 && fname.length > 0 && mi.length > 0 && gender.length > 0 && bdate.length > 0){
   
 
    	 id("titleregister").innerHTML = "<span class='glyphicon glyphicon-user'></span> Register(Transferee)";
    	id("step1").style.display ="none";
    	id("step2shifter").style.display ="none";
    	id("step2transferee").style.display ="block";
    
   }
	else{
		alert("Please fill in the fields.");
	}
}
function transferFinalStep(){
	var getoldschool = id("oldschool").value;
	  if(getoldschool == "University of Santo Tomas" || getoldschool == "UST" || getoldschool == "UNIVERISTY OF SANTO TOMAS") {
		  alert("You can't transfer from the same school!");
	  }
	  else if(getoldschool.length <= 5) {
		 alert("Acronyms of school not allowed!");  
	  }
	  else {
	id("step2transferee").style.display ="none";
	id("step3transferee").style.display ="block";
	}
}
function goBack() {
	 id("titleregister").innerHTML = "<span class='glyphicon glyphicon-user'></span> Register";
	id("step1").style.display ="block";
	id("step2transferee").style.display ="none";
	id("step2shifter").style.display ="none";
}
function goBack2Shift() {
	 id("titleregister").innerHTML = "<span class='glyphicon glyphicon-user'></span> Register(Shifter)";
	id("step2shifter").style.display ="block";
	id("step3shifter").style.display ="none";
}
function goBack2Transfer() {
	 id("titleregister").innerHTML = "<span class='glyphicon glyphicon-user'></span> Register(Transferee)";
	id("step2transferee").style.display ="block";
	id("step3transferee").style.display ="none";
}
var myVar;

function myFunction() {
    myVar = setTimeout(showPage, 2000);
}

function showPage() {
  id("loader").style.display = "none";
  id("myDiv").style.display = "block";
}
function shifterSubmit() {
	
	id("registerform").method = "post";
	id("registerform").action = "registerprocess";
	id("registerform").submit();
	
}
function transferSubmit() {

	id("registerform").method = "post";
	id("registerform").action = "registerprocess";
	id("registerform").submit();
  
}
</script>

<div class="modal fade register" role="dialog">
   <div class="modal-dialog modal-lg" style="height:500px;">
  <div class="modal-content">
    <div class="modal-header" style="background-color:#EFB652">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
       <h3 class="modal-title" id="titleregister"><span class="glyphicon glyphicon-user"></span> Register(Transferee)</h3>
       
     </div>
     <div class="modal-body row">
   <form id="registerform" onsubmit="return false" enctype="multipart/form-data">
     
       <div id="step1">
       <div class="col-sm-12">
         <div class="col-sm-12">
         <p style="font-size: 2vw; font-size: 2vh;"><i>Last Name:</i></p>
         <input type="text" class="form-control" name="register_lname" id="register_lname" /> <br>
         </div>
         <div class="col-sm-6">
         <p style="font-size: 2vw; font-size: 2vh;"><i>First Name: </i></p>
          <input type="text" class="form-control" name="register_fname" id="register_fname" /> 
          </div>
          <div class="col-sm-6">
         <p style="font-size: 2vw; font-size: 2vh;"><i>Birth Date: </i></p>
          <input type="date" class="form-control" name="register_bday" id="register_bday" /> <br>
          </div>
          
          <div class="col-sm-6">
          <p style="font-size:2vw; font-size: 2vh;"><i>MI</i></p>
           <input type="text" class="form-control" name="register_mi" id="register_mi"   />
          </div>
          <div class="col-sm-6">
          <p style="font-size:2vw; font-size: 2vh;"><i>Gender</i></p>
          <select class="form-control" name="register_gender" id="register_gender"   >
           <option selected="true" value="" disabled="disabled">&lt;Select Gender&gt;</option>
           <option value="Male">Male</option>
           <option value="Female">Female</option>
          </select>
          <input type = "hidden" name = "register_typeofstudent" value = "Transferee">
          <br><br>
          </div>
       
          <br>
          <br><p><br></p>
      <center><button class="btn btn-warning btn-lg" style="width:100px;" onclick="determineStudent()"><span class="glyphicon glyphicon-chevron-right" style="color:white"></span> Next</button></center>
       </div>
     
       </div>
       <div id="step2shifter">
    
        <div class = "col-sm-12">
         <p style="font-size: 2vw; font-size: 2vh;"><i>Student ID:</i></p>
         <input type="text" class="form-control" name="register_studentid" id="register_studentid"  /> <br>
         <p style="font-size: 2vw; font-size: 2vh;"><i>Current College</i></p>
<!--          <select class="form-control" name="shift_oldcollege"  id ="currentcollege">
          <option selected="true" value="" disabled="disabled">&lt;Course&gt;</option>
          <option value="AB">AB</option>
          <option value="Engineering">Engineering</option>
          <option value="IICS">IICS</option>
          <option value="Architecture">Architecture</option>
         </select> -->
         <select class="form-control"  id="shift_oldcollege" name="shift_oldcollege"></select>
          <br>
         <p style="font-size: 2vw; font-size: 2vh;"><i>Current Program</i></p>
<!--          <select class="form-control" name="shift_oldprogram"  id="currentprogram">
          <option selected="true" value="" disabled="disabled">&lt;Course&gt;</option>
          <option value="IT">Information Technology</option>
          <option value="IS">Information Systems</option>
          <option value="CS">Computer Science</option>
          
         </select> --> 
         <select class="form-control"  name="shift_oldprogram" id="shift_oldprogram"></select>
         <br>
         <!-- 
         <p style="font-size: 2vw; font-size: 2vh;"><i>Outgoing College</i></p>
         <select class="form-control" name="shift_newcollege" >
          <option selected="true" value="" disabled="disabled">&lt;Course&gt;</option>
          <option value="AB">AB</option>
          <option value="Engineering">Engineering</option>
          <option value="IICS">IICS</option>
          <option value="Architecture">Architecture</option>
         </select> <br>
          <p style="font-size: 2vw; font-size: 2vh;"><i>Outgoing Program</i></p>
         <select class="form-control" name="shift_newprogram" >
          <option selected="true" value="" disabled="disabled">&lt;Course&gt;</option>
          <option value="IT">Information Technology</option>
          <option value="IS">Information Systems</option>
          <option value="CS">Computer Science</option>
          
         </select> --> <br><br>
       <center><button class="btn btn-default btn-lg" style="width:100px;" onclick="goBack()">Back</button> <button onclick="shifterFinalStep()" class="btn btn-warning btn-lg">Next</button></center>
      
       </div>
          <div id="loadingstep2"></div>
       </div>
         <div id = "step3shifter">
         <div class="col-sm-12"><br>
         
         
         <center>
         <p style="font-size: 2vw; font-size: 2vh;"><i>Upload ID Picture </i></p><br>
         <input type="file" type="file" name="shifter_idpicture" size="50"><br><br><br><br>
         <button class="btn btn-danger btn-lg" style="width:100px;" onclick="goBack2Shift()">Back</button>
          <button onclick="shifterSubmit()" class="btn btn-warning btn-lg">Submit & Login</button>
          </center>
         </div>
       </div>
         <div id="step2transferee">
    
        <div class = "col-sm-12">
          <div class="col-sm-12">
         <p style="font-size: 2vw; font-size: 2vh;"><i>Current School</i></p>
         <input type="text" class="form-control" name="transfer_school" id="oldschool" /><br>
         </div>
          
  <div class="col-sm-12">
  <p style="font-size: 2vw; font-size: 2vh;"><i>Current Course</i></p>
         <select class="form-control"  id="transfer_oldcollege" name="transfer_oldcollege"></select><br>
         </div>
         <br>
         <div class="col-sm-12">
          <p style="font-size: 2vw; font-size: 2vh;"><i>Current Program</i></p>
         <select class="form-control"  name="transfer_oldprogram" id="transfer_oldprogram"></select><br><br>
         </div>
         <br>
         <p><br></p>
       <center><button class="btn btn btn-warning btn-lg" style="width:100px;" onclick="goBack()"><span class="glyphicon glyphicon-chevron-left" style="color:white"></span> Back</button>
        <button onclick="transferFinalStep()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-chevron-right" style="color:white"></span> Next</button></center>
      
       </div>
          <div id="loadingstep2"></div>
       </div>
       <div id = "step3transferee">
         <div class="col-sm-12"><br>
         
         
         <center>
         <p style="font-size: 2vw; font-size: 2vh;"><i>Upload ID Picture </i></p><br>
         <input type="file" type="file" onChange="readURL(this)" name="transfer_idpicture" size="50">
         <img id="imageview" src="#"/>
         <br><br><br><br>
         <button class="btn btn-warning btn-lg" style="width:100px;" onclick="goBack2Transfer()"><span class="glyphicon glyphicon-chevron-left" style="color:white"></span> Back</button>
          <button onclick="transferSubmit()" class="btn btn-warning btn-lg"><span class="glyphicon glyphicon-check" style="color:white"></span> Submit & Login</button>
          </center>
         </div>
       </div>
     </form>
       
     </div>
       
       
    
  </div>
  </div>
  
   </div>
        <div id="footer">
        </div>
    </div>
    	<script language="javascript">
            populateCountries("shift_oldcollege", "shift_oldprogram");
        </script>
            		<script language="javascript">
            populateCountries("transfer_oldcollege", "transfer_oldprogram");
        </script>
        
        <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imageview')
                        .attr('src', e.target.result)
                        .width(150)
                        .height(200);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
        function changePassword() {
        	var pw1 = id("password1").value;
        	var pw2 = id("passwordconfirm").value;
        	if(pw1 == pw2) {
        		id("changepasswordform").action = "ChangeOldPassword";
        		id("changepasswordform").method = "post";
        		id("changepasswordform").submit();
        	}
        	else {
        		alert('Passwords are not the same!');
        	}
        }
        </script>
        
</body>
</html>