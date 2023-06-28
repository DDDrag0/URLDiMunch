










<!DOCTYPE html>
    <html lang="it">
    <head>
		<link href="./css/header.css" rel="stylesheet" type="text/css">
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title> details</title>
    </head>
    
    <body>
		




<!DOCTYPE html>
<html lang="it">
<head>
<title>header</title>
<link href="./css/header.css" rel="stylesheet" type="text/css">
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
    
 </div> 
</div>
 <div class="hamburger" onclick="toggleSidebar()">
    <span class="line"></span>
    <span class="line"></span>
    <span class="line"></span>
  </div>
  <div class="logo">
    <a href="index.jsp">URLdiMunch</a> 
  </div>
  
  
  <div class="search-bar">
	<form action="SearchServlet" method="post">
    <input type="text" placeholder="Cerca..." id="ajaxsearch">
    <div id="searchResult" style="display: none;"></div>
    </form>
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
<script src="./js/ajaxheadersrc.min.js"></script>
<script src="./js/search.js"></script>
</body>


</html>
    		<h2> Product details</h2>
    		<div>
    		<img width="200" src="/URLdiMunch/image/venere.jpg" alt="Venere">
    		<caption>Prodotto</caption>
    		<p class="right-align">Code: Venere
    						Name: Venere
    						Description:Venere dipinta da Botticelli
    						Price:200.0
    						Quantity:999
    						</p>
    		
    		.right-align {
  			text-align: right;
			}
    		
    		</div>
    			
    		
          <button class="btn btn-cart">Add to Cart</button>
          <input class="cart-qnt" type="number" value="1" min="1" max="999">
          <input class = "prod_id" type="hidden" value="1_Venere">
    		
<h2>Scrivi una recensione</h2>
<form action="recensioni" method="POST">
    <input type="hidden" name="action" value="doSave">
    <input type="hidden" name="idProdotto" value="1_Venere">
    <label for="idUtente">Nome utente:</label>
    <input type="text" name="idUtente" required><br>
    <label for="recensione">Recensione:</label>
    <textarea name="recensione" rows="4" cols="50" required></textarea><br>
    <button style="background-color:grey; border-color:black; color:black">Invia recensione</button>
    <button style="background-color:grey; border-color:black; color:black">Modifica recensione</button>
    <button style="background-color:grey; border-color:black; color:black">Elimina recensione</button>
</form>

<h2>Recensioni utenti</h2>

  <div class="review">
    <h3>Francuccio</h3>
    <p class="comment">Ottimo dipinto di un ottima fattura, veramente spettacolare</p>
  </div>

  <div class="review">
    <h3>Luca</h3>
    <p class="comment">Bellissima</p>
  </div>


<script type="text/javascript">
$(".btn-cart").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    var qnt = $(this).parent().find(".cart-qnt").val()
    window.location.href="prodottoCliente?action=addC&id="+id+"&quantity="+qnt
});

$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});
</script>
    		
</body>
</html>