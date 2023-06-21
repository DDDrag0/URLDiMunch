<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="model.Prodotto" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%
    String code = request.getParameter("code");
    String image = request.getParameter("image");
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    double price = Double.parseDouble(request.getParameter("price"));
    int quantity = Integer.parseInt(request.getParameter("quantity"));
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Details</title>
</head>

<body>
<%@ include file="header.jsp" %>
<h2>Product details</h2>
<table border="1">
    <caption>Prodotto</caption>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Image</th>
        <th>Quantity</th>
    <tr>
        <td><%= Encode.forHtml(code) %></td>
        <td><%= Encode.forHtml(name) %></td>
        <td><%= Encode.forHtml(description) %></td>
        <td><%= Encode.forHtml(Double.toString(price)) %></td>
        <td><img width="200" src="${pageContext.request.contextPath}<%=Encode.forHtml(image)%>" alt="la gioconda"></td>
        <td><%= Encode.forHtml(Integer.toString(quantity)) %></td>
    </tr>
</table>
<div class="user-reviews">
  <h2>Recensioni degli utenti</h2>
  <div class="review">
    <h3>John Doe</h3>
    <p class="rating">Voto: 4.5/5</p>
    <p class="comment">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam lobortis urna vel dolor finibus mollis. Suspendisse sed lectus nec magna finibus porttitor ac sit amet lacus.</p>
  </div>
  <div class="review">
    <h3>Jane Smith</h3>
    <p class="rating">Voto: 3/5</p>
    <p class="comment">Fusce aliquam justo ac ante fermentum rutrum. Nullam non lacus finibus, consectetur nulla ut, ultrices metus. Curabitur sed convallis ligula.</p>
  </div>
  <div class="review">
    <h3>Mark Johnson</h3>
    <p class="rating">Voto: 5/5</p>
    <p class="comment">Vestibulum finibus ex non orci efficitur ultricies. Integer quis sollicitudin turpis. Duis condimentum nunc sed lacus faucibus, sed condimentum quam tincidunt.</p>
  </div>
</div>

</body>
</html>