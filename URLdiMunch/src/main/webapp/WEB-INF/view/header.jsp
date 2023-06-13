<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="model.User" %>

<%
	User user = (User) session.getAttribute("utente");
	String login;
	String commandLogin;
	boolean test;
    if(user == null) {
    	login="Login";
    	commandLogin="redirectToLogin()";
    	test=false;
    }
    else{
    	login=user.getIdUtente();
    	commandLogin="redirectToProfile()";
    	test=true;
    	}
%>
<html>
<head>
<link href="header.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
<div class="sidebar" id="sidebar">
<div class="bottone">
<button class="close-sidebar" onclick="toggleSidebar()">X</button>
 </div>
 <div class="link-sidebar">
    <a href="index.jsp">Home</a>
    <a href="prodottiCliente.jsp">prodotti</a>
    <% if(user!=null) {%>
    <form action="<%=request.getContextPath()%>/LogOut" method="post">
			<input class="link-sidebar" type="submit" value="LogOut" />
		</form>
	<% }%>
 </div> 
</div>
 <div class="hamburger" onclick="toggleSidebar()">
    <span class="line"></span>
    <span class="line"></span>
    <span class="line"></span>
  </div>
  <div class="logo">
    <a href="#">URLdiMunch</a> 
  </div>
  <div class="search-bar">
	<form action="SearchServlet" method="post">
    <input type="text" placeholder="ParitoAnnuro..." id="ajaxsearch">
    <div id="searchResult" style="display: none;"></div>
    </form>
  </div>
  <div class="user-buttons">
    <button onclick="<%=commandLogin%>"><%=login%></button>
  </div>
  <div class="cart">
  <button onclick="redirectToCart()" class="no-border" style="border: none;">
  			<img class="no-border" src="image/carrello.png" alt="Carrello" style="border: none;">
  </button>
  <span id="contatorecarrello" class="cart-item-count"></span>
  </div>
</header>

<script>
function redirectToRegistrati() {
	window.location.href = "registrazione.jsp"
}
function redirectToLogin() {
	window.location.href = "logIn.jsp"
}
function redirectToProfile(){
	window.location.href = "DettagliUser.jsp"
}
function redirectToCart() {
	window.location.href = "carrello.jsp"
}
function toggleSidebar() {
	var sidebar = document.getElementById("sidebar");
	sidebar.classList.toggle("open");
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="search.js"></script>
</body>


</html>