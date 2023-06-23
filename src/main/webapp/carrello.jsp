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
    
    for (Prodotto product : cart.getProducts()) {
        double total = product.getPrezzo() * product.getQuantita();
        subtotal += total;
        taxRate=product.getIva();
    }
    taxRate=taxRate/100;
    double tax = subtotal * taxRate;
    double shipping = (subtotal > 0) ? shippingRate : 0;
    double grandTotal = subtotal + tax + shipping;
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
    <script type="text/javascript" src="./js/jQueryCarrello.js"></script>
</head>
<body>
<form action="<%= request.getContextPath() %>/fattura?action=insertOrder" method="post">
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
            <img src="${pageContext.request.contextPath}<%= product.getImagepath() %>" alt="<%= product.getNome() %>">
        </div>
        <div class="product-details">
            <div class="product-title"><%= product.getNome() %></div>
            <p class="product-description"><%= product.getDescrizione() %></p>
        </div>
        <div class="product-price"><%= product.getPrezzo() %></div>
        <div class="product-quantity">
            <input type="number" value="1" min="1" id="numeroprodotti" name="quantitaProdotto">
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

    <button class="checkout" type="Submit" value="Submit">CheckOut</button>
</div>
<script src="./js/carrello.js"></script>
</form>
</body>
</html>
