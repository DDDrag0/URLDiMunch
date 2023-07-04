<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="model.Prodotto" %>
<%@ page import="dao.RecensioneDAO" %>
<%@ page import="model.Recensione" %>
<%@ page import="java.util.Collection" %>

<%
	Prodotto prod = (Prodotto) session.getAttribute("prodottoDettagli");
    if(prod == null) {
        response.sendRedirect("index.jsp");    
        return;
    }
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>Details</title>
	<link href="./css/dettagliProdotto.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file="header.jsp" %>

  	<h2>Product Details</h2>
  	<div class="container">
    	<div class="left-image">
      		<img src="${pageContext.request.contextPath}<%=prod.getImagepath()%>" alt="<%=prod.getNome()%>" style="width: 200px;">
    	</div>
    	<div class="product-info">
      		Name: <%=prod.getNome()%> <br>
      		Description: <%=prod.getDescrizione()%> <br>
      		Price: <%=prod.getPrezzo()%> $ <br>
      		Quantity: <%=prod.getQuantita()%> pieces available<br>
    	</div>
  	</div>

  	<button class="btn btn-cart">Add to Cart</button>
    <input class="cart-qnt" type="number" value="1" min="1" max="<%=prod.getQuantita()%>">
	<input class = "prod_id" type="hidden" value="<%=prod.getIdProdotto()%>">

  	<h2>Write a Review!</h2>
  	<form action="recensioni" method="POST">
	    <input type="hidden" name="action" value="doSave">
	    <input type="hidden" name="idProdotto" value="<%=prod.getIdProdotto()%>">
		<textarea name="recensione" rows="4" cols="40" required></textarea><br>
		
		<button class="button">Invia recensione</button>
		<button class="button">Modifica recensione</button>
		<button class="button">Elimina recensione</button>
	</form>
	
  	<h2>Reviews</h2>
	
	<%
	    RecensioneDAO recensioneDAO = new RecensioneDAO();
	    Collection<Recensione> recensioni = recensioneDAO.doRetrieveByProduct(prod.getIdProdotto());
	    if (recensioni != null && !recensioni.isEmpty()) {
	        for (Recensione recensione : recensioni) {
	%>
  	<div class="review">
    	<div class="container">
       		<div class="left-image">
       			<img width="20" src="./image/revpic.jpg">
      		</div>
	      	<div class="product-info img"> 
	        	<h3 class="approval-heading"><%= Encode.forHtml(recensione.getIdUtente()) %></h3>
	    		<p class="comment"><%= Encode.forHtml(recensione.getRecensione()) %></p>
	  		</div>
	  	</div>
  	</div>
	<%
	        }
	    } else {
	%>
	  <p>No reviews on this product.</p>
	<%
	    }
	%>

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