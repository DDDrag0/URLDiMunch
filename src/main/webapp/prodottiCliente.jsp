<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./prodottoCliente");	
		return;
	}
	
	Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<head>
    
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Storage DS/BF</title>
	<link href="./css/header.css" rel="stylesheet" type="text/css">
	<link href="./css/prodotticliente.css" rel="stylesheet" type="text/css">
	  <link rel="stylesheet" href="./css/styleProdottiCliente.css">
	</head>
<%@ include file="header.jsp" %>
<body>
<div class="container">
  <div id="products" class="row list-group">
  
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Prodotto bean = (Prodotto) it.next();
		%>
		
    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" alt="<%=bean.getNome()%>" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading"><%=bean.getNome()%></h4>
          <p class="group inner list-group-item-text">$<%=bean.getPrezzo()%></p>
        </div>
        <div class="btn-group">
          <button class="btn btn-details">Details</button>
          <button class="btn btn-cart">Add to Cart</button>
          <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
          <input class = "prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
        </div>
      </div>
    </div>
    
		<%
				}
			} else {
		%>
    
    <a>No products available</a>
		<%
			}
		%>
    
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
    window.location.href="prodottoCliente?action=addC&id="+id+"&quantity="+qnt
});

$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});
</script>
</body>
</html> 
