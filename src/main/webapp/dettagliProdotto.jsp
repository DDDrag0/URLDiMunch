<!DOCTYPE html>
<html lang="it">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Details</title>
  <link href="./css/header.css" rel="stylesheet" type="text/css">
  <link href="./css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
  <header>
    <div class="sidebar" id="sidebar">
      <div class="bottone">
        <div class="button">
          <button class="close-sidebar" onclick="toggleSidebar()">X</button>
        </div>
      </div>
      <div class="link-sidebar">
        <a href="index.jsp">Home</a>
        <a href="prodottiCliente.jsp">Prodotti</a>
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
      <button onclick="redirectToLogin()" style= "border:none; width: 43px; height: 42px">Login</button>
      <div class="cart">
        <button onclick="redirectToCart()" class="no-border" style="border: none; background-color: white; width: 43px; height: 42px">
          <img class="no-border" src="image/carrello.png" alt="Carrello" style="border: none;">
        </button>
        <span id="contatorecarrello" class="cart-item-count"></span>
      </div>
    </div>
  </header>
  <h2>Product Details</h2>
  <div class="container">
    <div class="left-image">
      <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/1025px-Cat03.jpg" alt="Venere" style="width: 200px;">
    </div>
    <div class="product-info">
      Code: Venere <br>
      Name: Venere <br>
      Description: Venere dipinta da Botticelli <br>
      Price: 200.0 <br>
      Quantity: 999 <br>
    </div>
  </div>

  <button class="btn btn-cart">Add to Cart</button>
  <input class="cart-qnt" type="number" value="1" min="1" max="999">
  <input class="prod_id" type="hidden" value="1_Venere">

  <h2>Scrivi una recensione</h2>
  <form action="recensioni" method="POST">
    <input type="hidden" name="action" value="doSave">
    <input type="hidden" name="idProdotto" value="1_Venere" style="width: 46px; ">
<textarea name="recensione" rows="4" cols="40" required></textarea><br>
<button class="button">Invia recensione</button>
<button class="button">Modifica recensione</button>
<button class="button">Elimina recensione</button>
  </form>
  <h2>Recensioni utenti</h2>
  <div class="review">
    <div class="container">
       <div class="left-image">
       <img width="20" src=  https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMAF_VmUyJeP-gtQu3c3vQ1Og4FeAB0uQs4Zu8KmK0BQ&s>
      </div>
      <div class="product-info img"> 
        <h3 class="approval-heading">Approvato</h3>
    <p class="comment">Ottimo dipinto di un'ottima fattura, veramente spettacolare</p>
  </div>
  </div>
  </div>                                 
</body>
</html>