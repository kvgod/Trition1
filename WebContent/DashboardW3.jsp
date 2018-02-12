<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<title>Admin Console</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<body>

<style>
body {font-family: "Roboto", sans-serif}
.w3-bar-block .w3-bar-item{padding:8px;font-weight:bold}
</style>
<body>
<%

HttpSession sess = request.getSession();
System.out.println("session.getAttribute(session)"+session.getAttribute("session"));
Cookie ck[]=request.getCookies(); 

for(int i=0;i<ck.length;i++){  
 System.out.println("<br>"+ck[i].getName()+" "+ck[i].getValue());//printing name and value of cookie  
}  
if(session.getAttribute("session")!=null)
{
%>


<nav class="w3-sidebar w3-bar-block w3-collapse w3-animate-left w3-card" style="z-index:3;width:230px;" id="mySidebar">
  <a class="w3-bar-item w3-button w3-border-bottom w3-medium" href="#">     <img class="w3-circle" src="asset/admin.png" style="width:60%;" class="w3-circle"></a>
  <a class="w3-bar-item w3-button w3-hide-large w3-large" href="javascript:void(0)" onclick="w3_close()">Close <i class="fa fa-remove"></i></a>
  <a class="w3-bar-item w3-button w3-teal" href="#">Home</a>
  <a class="w3-bar-item w3-button" href="#">Link 1</a>
  <div>
    <a class="w3-bar-item w3-button" onclick="myAccordion('demo')" href="javascript:void(0)">Receipts <i class="fa fa-caret-down"></i></a>
    <div id="demo" class="w3-hide">
      <a class="w3-bar-item w3-button" href="#">Quick Monthly Thrift</a>
      <a class="w3-bar-item w3-button" href="#">Link</a>
      <a class="w3-bar-item w3-button" href="#">Link</a>
    </div>
  </div> 
  <a class="w3-bar-item w3-button" href="logout">Logout<span>&nbsp&nbsp</span><i class="glyphicon glyphicon-arrow-right"></i></a>
 <!--  <a class="w3-bar-item w3-button" href="#">Link 3</a>
  <a class="w3-bar-item w3-button" href="#">Link 4</a>
  <a class="w3-bar-item w3-button" href="#">Link 5</a> -->
  
</nav>

<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<div class="w3-main" style="margin-left:250px;">

<div id="myTop" class="w3-container w3-top w3-theme w3-large">
  <p><i class="fa fa-bars w3-button w3-teal w3-hide-large w3-xlarge" onclick="w3_open()"></i>
  <span id="myIntro" class="w3-hide">FACT:Admin</span>
  
  </p>
  
</div>

<header class="w3-container w3-theme" style="padding:64px 32px">
  <h1 class="w3-xxxlarge">FACT</h1>
</header>

<div class="w3-container" style="padding:32px">

<!-- <h2>What is W3.CSS?</h2>

<p>W3.CSS is a modern CSS framework with built-in responsiveness:</p>

<ul class="w3-leftbar w3-theme-border" style="list-style:none">
 <li>Smaller and faster than other CSS frameworks.</li>
 <li>Easier to learn, and easier to use than other CSS frameworks.</li>
 <li>Uses standard CSS only (No jQuery or JavaScript library).</li>
 <li>Speeds up mobile HTML apps.</li>
 <li>Provides CSS equality for all devices. PC, laptop, tablet, and mobile:</li>
</ul>
<br> -->
<!-- <img src="img_responsive.png" style="width:100%" alt="Responsive"> -->

<!-- <hr>
<h2>W3.CSS is Free</h2>
<p>W3.CSS is free to use. No license is necessary.</p>

<hr>
<h2>Easy to Use</h2>
<div class="w3-container w3-sand w3-leftbar">
<p><i>Make it as simple as possible, but not simpler.</i><br>
Albert Einstein</p>
</div>

<hr>
<h2>W3.CSS Web Site Templates</h2>

<p>We have created some responsive W3CSS templates for you to use.</p>
<p>You are free to modify, save, share, use or do whatever you want with them:</p>
 -->

<div class="w3-panel w3-light-grey w3-padding-16 w3-card">
<h3 class="w3-center">Members</h3>
<div class="w3-content" style="max-width:800px">
<a href="#" target="_blank"  title="Members Arena"><img src="asset/dm_graphic.jpg" style="width:98%;margin:20px 0" alt="Members Arena"></a><br>
<div class="w3-row">
  <div class="w3-col m6">
    <a href="RegisterNewMember.jsp" target="_blank" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">Register New Member</a>
  </div>
  <div class="w3-col m6">
    <a href="viewMembers" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">View Existing Members »</a>
  </div>
</div>
</div>
</div>

<div class="w3-container w3-padding-16 w3-card" style="background-color:#eee">
<h3 class="w3-center">Accounts</h3>
<div class="w3-content" style="max-width:800px">
<img src="<%=request.getContextPath()%>/asset/Accounts.jpg" style="width:98%;margin:20px 0" alt="Accounts"><br>
<div class="w3-row">
  <div class="w3-col m6">
    <a href="createReceipt" target="_blank" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">Add Receipt/Payment</a>
  </div>
  <div class="w3-col m6">
    <a href="viewBalanceSheet" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">View Balance Sheet »</a>
  </div>
</div>
</div>
</div>

</div>

<footer class="w3-container w3-theme" style="padding:32px">
  <p>All rights reserved</p>
</footer>
     
</div>

<script>
// Open and close the sidebar on medium and small screens
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

// Change style of top container on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
    if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
        document.getElementById("myTop").classList.add("w3-card-4", "w3-animate-opacity");
        document.getElementById("myIntro").classList.add("w3-show-inline-block");
    } else {
        document.getElementById("myIntro").classList.remove("w3-show-inline-block");
        document.getElementById("myTop").classList.remove("w3-card-4", "w3-animate-opacity");
    }
}

// Accordions
function myAccordion(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-theme";
    } else { 
        x.className = x.className.replace("w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-theme", "");
    }
}
</script>


<%
}
else{
	response.sendRedirect("AdminLogin.jsp");
}
%>     
</body>
</html> 
