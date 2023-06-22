<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="model.Prodotto" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="dao.RecensioneDAO" %>
<%@ page import="model.Recensione" %>
<%@ page import="java.util.Collection" %>
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
    </tr>
    <tr>
        <td><%= Encode.forHtml(code) %></td>
        <td><%= Encode.forHtml(name) %></td>
        <td><%= Encode.forHtml(description) %></td>
        <td><%= Encode.forHtml(Double.toString(price)) %></td>
        <td><img width="200" src="${pageContext.request.contextPath}<%=Encode.forHtml(image)%>" alt="la gioconda"></td>
        <td><%= Encode.forHtml(Integer.toString(quantity)) %></td>
    </tr>
</table>

<h2>Scrivi una recensione</h2>
<form action="recensioni" method="POST">
    <input type="hidden" name="action" value="doSave">
    <input type="hidden" name="idProdotto" value="<%= Encode.forHtml(code) %>">
    <label for="idUtente">Nome utente:</label>
    <input type="text" name="idUtente" required><br>
    <label for="recensione">Recensione:</label>
    <textarea name="recensione" rows="4" cols="50" required></textarea><br>
    <input type="submit" value="Invia recensione">
</form>

<h2>Recensioni utenti</h2>
<%
    RecensioneDAO recensioneDAO = new RecensioneDAO();
    Collection<Recensione> recensioni = recensioneDAO.doRetrieveByProduct(code);
    if (recensioni != null && !recensioni.isEmpty()) {
        for (Recensione recensione : recensioni) {
%>
  <div class="review">
    <h3><%= Encode.forHtml(recensione.getIdUtente()) %></h3>
    <p class="comment"><%= Encode.forHtml(recensione.getRecensione()) %></p>
  </div>
<%
        }
    } else {
%>
  <p>Nessuna recensione disponibile.</p>
<%
    }
%>

</body>
</html>