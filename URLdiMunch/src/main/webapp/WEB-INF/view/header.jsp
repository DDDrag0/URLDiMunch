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
    <a href="">Profilo</a>
    <a href="prodottiCliente.jsp">prodotti</a>
    <form action="<%=request.getContextPath()%>/LogOut" method="post">
			<input class="logout-button" type="submit" value="LogOut (elimina anche il carrello)" />
		</form>
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
    <input type="text" placeholder="Cerca...">
    <button class="search-button">search</button>
  </div>
  <div class="user-buttons">
    <button onclick="redirectToLogin()">Login</button>
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
function redirectToCart() {
	window.location.href = "carrello.jsp"
}
function toggleSidebar() {
	var sidebar = document.getElementById("sidebar");
	sidebar.classList.toggle("open");
}
</script>
</body>


</html>