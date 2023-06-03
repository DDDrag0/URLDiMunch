<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<head>
  <link href="header.css" rel="stylesheet" type="text/css">
</head>
<body>
  <header>
    <div class="logo">
      <a href="#">URLdiMunch</a> 
    </div>
  </header>
<div style="height:100%; z-index:5;">
  <div class="container">
    <div class="backbox">
      <div class="loginMsg">
        <div class="textcontent">
          <p class="title">Don't have an account?</p>
          <p>Sign up to save all your graph.</p>
          <button id="switch1">Sign Up</button>
        </div>
      </div>
      <div class="signupMsg visibility">
        <div class="textcontent">
          <p class="title">Have an account?</p>
          <p>Log in to see all your collection.</p>
          <button id="switch2">LOG IN</button>
        </div>
      </div>
    </div>
    <!-- backbox -->

    <div class="frontbox">
      <div class="login">
  		<form action="<%=request.getContextPath()%>/login" method="post">
        <h2>LOG IN</h2>
        <div class="inputbox">
          <input type="text" name="idutente" placeholder="  USERNAME">
          <input type="password" name="password" placeholder="  PASSWORD">
        </div>
        <p>FORGET PASSWORD?</p>
        <button value="Submit">Log In</button>
        </form>
      </div>

      <div class="signup hide">
  		<form action="<%= request.getContextPath() %>/register" method="post">
        <h2>SIGN UP</h2>
        <div class="inputbox">
          <input type="text" name="idutente" placeholder="  USERNAME">
          <input type="text" name="email" placeholder="  EMAIL">
          <input type="password" name="password" placeholder="  PASSWORD">
        </div>
        <button value="Submit">Sign Up</button>
        </form>
      </div>
	
    </div>
    <!-- frontbox -->
  </div>
  </div>
  <a href="index.jsp" class="button-home">Home</a>
  <script src="scriptlogin.js"></script>
  
</body>

</html>