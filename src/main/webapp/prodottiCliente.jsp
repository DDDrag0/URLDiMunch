<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect("./prodottoCliente?source=/prodottiCliente.jsp");
        return;
    }

    Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Storage DS/BF</title>
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="./css/prodotticliente.css">
    <%@ include file="header.jsp" %>
</head>
<body>


<div class="separator">
      <div class="content">
        <span class="text">Nuovi arrivi</span>
      </div>
    </div>
        <div class="container">
        <div class="row">
            <% 	int i=0;
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

 <%@ include file="footer.jsp" %>
<script src="./js/jQueryProdottiCliente.js"></script>
<script src="./js/prodotticlienti.js"></script>
<script src="./js/jsProdottiCliente.js"></script>
<script type="text/javascript">
$(".btn-cart").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    var qnt = $(this).parent().find(".cart-qnt").val()
    window.location.href="prodottoCliente?source=/prodottiCliente.jsp&action=addC&id="+id+"&quantity="+qnt
});

$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});
</script>
</body>
</html>

