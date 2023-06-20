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
	
	Prodotto product = (Prodotto) request.getAttribute("product");
	
	Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<head>
    
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Storage DS/BF</title>
	<link href="header.css" rel="stylesheet" type="text/css">
	<link href="prodotticliente.css" rel="stylesheet" type="text/css">
	  <link rel="stylesheet" href="styleProdottiCliente.css">
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
          <a class="btn btn-details" href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantita()%>">Details</a>
          <a class="btn btn-cart" href="prodottoCliente?action=addC&id=<%=bean.getIdProdotto()%>">Add to Cart</a>
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

<script src="jQueryProdottiCliente.js"></script>
<script src="prodotticlienti.js"></script>
<script src="jsProdottiCliente.js"></script>
	
</body>
</html> 
