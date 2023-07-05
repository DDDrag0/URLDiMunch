<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect("./prodottoCliente?source=/index.jsp");
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
				<img src="${pageContext.request.contextPath}/image/foto2.png" alt="Banner sinistro">
			</div>
			<div class="video">
				<video style="width: 100%;"   autoplay muted loop >
   		 <source data-src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123" type="video/mp4" src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123">
  	</video>
			</div>
			<div class="banner">
				<img src="${pageContext.request.contextPath}/image/foto2.png" alt="Banner destro">
			</div>
		</div>
		<div class="separator">
      <div class="content">
        <span class="text">Di tendenza</span>
      </div>
    </div>
    <div class="container">
        <div class="row">
            <% int i=0;
            	if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()&& i<=4) {
                    Prodotto bean = (Prodotto) it.next();
                    i++;
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" onerror="this.src='./image/errImg.jpg'"alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
				          <button class="btn btn-details">Details</button>
				          <button class="btn btn-cart">Add to Cart</button>
				          <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
				          <input class = "prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
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
            <%  i=0;
            	if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()&& i<=4) {
                    Prodotto bean = (Prodotto) it.next();
                    i++;
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" onerror="this.src='./image/errImg.jpg'" alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
				          <button class="btn btn-details">Details</button>
				          <button class="btn btn-cart">Add to Cart</button>
				          <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
				          <input class = "prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
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
<script src="./js/jQueryProdottiCliente.js"></script>
<script src="./js/prodotticlienti.js"></script>
<script src="./js/jsProdottiCliente.js"></script>
<script type="text/javascript">
$(".btn-cart").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    var qnt = $(this).parent().find(".cart-qnt").val()
    window.location.href="prodottoCliente?source=/index.jsp&action=addC&id="+id+"&quantity="+qnt
});

$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});
</script>
	</body>
</html>
