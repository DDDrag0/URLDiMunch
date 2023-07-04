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
%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<link href="./css/header.css" rel="stylesheet" type="text/css">
		<link href="./css/index.css" rel="stylesheet" type="text/css">
		<meta charset="UTF-8">
		<title>Lobby</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="container">
			<div class="banner">
				<img src="foto2.png" alt="Banner sinistro">
			</div>
			<div class="video">
				<video style="width: 100%;"   autoplay muted loop >
   		 <source data-src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123" type="video/mp4" src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123">
  	</video>
			</div>
			<div class="banner">
				<img src="foto2.png" alt="Banner destro">
			</div>
		</div>
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
                        <a href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantita()%>">Details</a>
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
                        <a href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantita()%>">Details</a>
                        <a href="prodottoCliente?action=addC&id=<%=bean.getIdProdotto()%>">Add to Cart</a>
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p>No products available</p>
            <% } %>
        </div>
    </div>
    
		
		<%@ include file="footer.jsp" %>
<script src="./js/ajaxheadersrc.min.js"></script>
<script src="./js/search.js"></script>
	</body>
</html>
