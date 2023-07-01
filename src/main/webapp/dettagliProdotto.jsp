<!DOCTYPE html>
<html lang="it">
<head>
	<style>
	.container {
	  overflow: auto;
	}
	
	.left-image {
	  float: left;
	  margin-right: 10px;
	}
	
	.review img {
	  float: left;
	  margin-right: 10px;
	}
	.product-info {
	  overflow: hidden;
	  text-align: left;
	}
	
	.btn {
	  background-color: #CCCCCC;
	  border-color: black;
	  color: black;
	}
	
	.btn-cart {
	  display: block;
	  margin-top: 20px;
	}
	
	.cart-qnt {
	  display: block;
	  margin-top: 10px;
	}
	
	.review {
	  margin-top: 20px;
	  
	}
	
	.review h3 {
	  margin-bottom: 5px;
	}
	
	.comment {
	  margin-top: 5px;
	}
	.button {
	  display: inline-block;
	  padding: 10px 10px;
	  border-radius: 20px;
	  background-color: #CCCCCC;
	  border: none;
	  color: black;
	  text-align: center;
	  text-decoration: none;
	  font-size: 16px;
	  cursor: pointer;
	}
	.approval-heading {
	  display: inline;
	  margin-left: 5px;
	}
	</style>
<title>Details</title>
<body>
		<%@ include file="header.jsp" %>

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

  <button class="button">Add to Cart</button>
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
       <img width="20" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMAF_VmUyJeP-gtQu3c3vQ1Og4FeAB0uQs4Zu8KmK0BQ&amp;s">
      </div>
      <div class="product-info img"> 
        <h3 class="approval-heading">Approvato</h3>
    <p class="comment">Ottimo dipinto di un'ottima fattura, veramente spettacolare</p>
  </div>
  </div>
  </div>
</body>
</html>