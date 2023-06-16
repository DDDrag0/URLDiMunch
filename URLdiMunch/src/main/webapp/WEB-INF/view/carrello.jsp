<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
    
<%
    HttpSession mysession=request.getSession();
	Carrello cart = (Carrello) session.getAttribute("cart");
    if(cart == null) {
        cart = new Carrello();
        mysession.setAttribute("cart", cart);
        response.sendRedirect("./prodottoCliente");    
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  	<link href="header.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" type="text/css" href="carrello.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>cart</title>
<link href="#" rel="stylesheet">
<script type="text/javascript" src="jQueryCarrello.js"></script>
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

  <div class="product">
    <div class="product-image">
      <img src="foto1.png">
    </div>
    <div class="product-details">
      <div class="product-title">statua</div>
      <p class="product-description">statua</p>
    </div>
    <div class="product-price">12.99</div>
    <div class="product-quantity">
      <input type="number" value="2" min="1">
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">25.98</div>
  </div>

  <div class="product">
    <div class="product-image">
      <img src="foto2.png">
    </div>
    <div class="product-details">
      <div class="product-title">statua</div>
      <p class="product-description">statua</p>
    </div>
    <div class="product-price">45.99</div>
    <div class="product-quantity">
      <input type="number" value="1" min="1">
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">45.99</div>
  </div>

  <div class="totals">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal">71.97</div>
    </div>
    <div class="totals-item">
      <label>Tax (5%)</label>
      <div class="totals-value" id="cart-tax">3.60</div>
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping">15.00</div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total">90.57</div>
    </div>
  </div>
      
      <button class="checkout">Checkout</button>
</div>
<script src="carrello.js"></script>
</body></html>
