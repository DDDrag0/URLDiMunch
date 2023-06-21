<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect("./prodottoCliente");
        return;
    }

    Prodotto product = (Prodotto) request.getAttribute("product");

    Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storage DS/BF</title>
    <link href="header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="prodotticliente.css">
    <%@ include file="header.jsp" %>
</head>
<body>


<div class="separator">
      <div class="content">
        <span class="text">Di tendenza</span>
      </div>
    </div>
    <div class="container">
        <div class="row">
            <% if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    Prodotto bean = (Prodotto) it.next();
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
                        <a href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantità()%>">Details</a>
                        <a href="prodottoCliente?action=addC&id=<%=bean.getIdProdotto()%>">Add to Cart</a>
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p>No products available</p>
            <% } %>
        </div>
    </div>
<div class="separator">
      <div class="content">
        <span class="text">Nuovi arrivi</span>
      </div>
    </div>
        <div class="container">
        <div class="row">
            <% if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    Prodotto bean = (Prodotto) it.next();
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
                        <a href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantità()%>">Details</a>
                        <a href="prodottoCliente?action=addC&id=<%=bean.getIdProdotto()%>">Add to Cart</a>
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p>No products available</p>
            <% } %>
        </div>
    </div>
    
    <script src="jsProdottiCliente.js"></script>
    		<%@ include file="footer.jsp" %>
</body>
</html>

