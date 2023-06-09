<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>

<%
    HttpSession jspSession = request.getSession();
    Carrello cart = (Carrello) jspSession.getAttribute("cart");
    if (cart == null) {
        cart = new Carrello();
        jspSession.setAttribute("cart", cart);
        response.sendRedirect("./prodottoCliente");
        return;
    }
    Prodotto producto;
    double subtotal = 0;
    double taxRate = 0;
    double shippingRate = 15.00;
    double taxpazz=0;
    
    for (Prodotto product : cart.getProducts()) {
        taxRate=product.getIva()/100;
    	double prodprice= (product.getPrezzo() + (product.getPrezzo() * taxRate))*product.getQuantitaCart();
        subtotal += prodprice;
        taxpazz += product.getPrezzo() * taxRate;
    }
    
    double tax = taxpazz;
    double shipping = (subtotal > 0) ? shippingRate : 0;
    double grandTotal = subtotal + shipping;
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./css/carrello.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cart</title>
    <link href="#" rel="stylesheet">
    <script type="text/javascript" src="./js/lib/jQueryCarrello.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<h1>Shopping Cart</h1>

<div class="shopping-cart">

    <div class="column-labels">
        <label class="product-image">Image</label>
        <label class="product-details">Product</label>
        <label class="product-price">Price</label>
        <label class="product-quantity">Quantity</label>
        <label class="product-removal">Remove</label>
        <label class="product-line-price">Total</label>
    </div>

    <% for (Prodotto product : cart.getProducts()) { %>

    <div class="product">
        <div class="product-image">
            <img src="${pageContext.request.contextPath}<%= product.getImagepath() %>" onerror="this.src='./image/errImg.jpg'" alt="<%= product.getNome() %>">
        </div>
        <div class="product-details">
            <div class="product-title"><%= product.getNome() %></div>
            <p class="product-description"><%= product.getDescrizione() %></p>
        </div>
        <div class="product-price"><%= product.getPrezzo() %></div>
        <div class="product-quantity">
            <input type="number" value="<%= product.getQuantitaCart() %>" min="1" id="numeroprodotti" name="quantitaProdotto">
        </div>
        <div class="product-removal">
            <button class="remove-product" data-id="<%= product.getIdProdotto() %>">Remove</button>
        </div>
        <div class="product-line-price" id="product-line-price-<%= product.getIdProdotto() %>"></div>
    </div>

    <% } %>

    <div class="totals">
        <div class="totals-item">
            <label>Subtotal</label>
            <div class="totals-value" id="cart-subtotal"><%= subtotal %></div>
        </div>
        <div class="totals-item">
            <label>Tax</label>
            <div class="totals-value" id="cart-tax"><%= tax %></div>
        </div>
        <div class="totals-item">
            <label>Shipping</label>
            <div class="totals-value" id="cart-shipping"><%= shipping %></div>
        </div>
        <div class="totals-item totals-item-total">
            <label>Grand Total</label>
            <div class="totals-value" id="cart-total"><%= grandTotal %></div>
            <input type="hidden" name="prezzo" value="<%= grandTotal %>">
        </div>
    </div>
	<% 
	User userpage = (User) session.getAttribute("utente");
    if(userpage == null) {
    	%>
    	<button id="checkout-button" class="checkout" onclick="LogIn()" >You must be logged</button>
    	<% 
    } 
    else if (cart.isEmpty()){}else if (user.checkCarta()){
    %>
    <button id="checkout-button" class="checkout" onclick="addcard()" >Add Payment Method</button>
    <%
    }else if (user.checkIndirizzi()){
        %>
        <button id="checkout-button" class="checkout" onclick="addcard()" >An address is Invalid</button>
        <%
        }else{
            %>
            <button id="checkout-button" class="checkout" onclick="payment()" >CheckOut</button>
            <%
        }
        %>
    
</div>
<script src="./js/carrello.js"></script>
<script type="text/javascript">

function payment() {
	  var grandTotal = <%= grandTotal %>;
	  
	  var form = document.createElement("form");
	  form.method = "POST";
	  form.action = "fattura";

	  var actionInput = document.createElement("input");
	  actionInput.type = "hidden";
	  actionInput.name = "action";
	  actionInput.value = "insertOrder";
	  form.appendChild(actionInput);

	  var prezzoInput = document.createElement("input");
	  prezzoInput.type = "hidden";
	  prezzoInput.name = "prezzo";
	  prezzoInput.value = grandTotal;
	  form.appendChild(prezzoInput);

	  document.body.appendChild(form);
	  form.submit();
}

function LogIn() {
	window.location.href = "./logIn.jsp"
}

function addcard() {
	window.location.href = "./DettagliUser.jsp"
}
</script>
</body>
</html>
