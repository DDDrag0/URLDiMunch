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
    RecensioneDAO recensioneDAO = new RecensioneDAO();
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
	
	<% 
	User userpage = (User) session.getAttribute("utente");
    if(userpage == null) {}else {
    %>
	
  	<h2>Write a Review!</h2>
	    
	    <%if (recensioneDAO.doRetrieveByProdUser(userpage.getIdUtente(), prod.getIdProdotto())!=null){
	    	Recensione recensioneut = recensioneDAO.doRetrieveByProdUser(userpage.getIdUtente(), prod.getIdProdotto());//aggiustare con un js jQuery per sicurezza
	    %>
	    
	  	<form action="recensioni" method="POST">
		    <input type="hidden" name="idUtente" value="<%=userpage.getIdUtente()%>">
		    <input type="hidden" name="idProdotto" value="<%=prod.getIdProdotto()%>">
	    	<input type="hidden" name="action" value="modRecensione">
	    	
		    <textarea name="recensione" rows="4" cols="40" required id="recensioneTextarea"></textarea><br>
			<script>
				var recensioneTextarea = document.getElementById('recensioneTextarea');
				recensioneTextarea.value = "<%= recensioneut.getRecensione() %>";
			</script>
			<button class="button">Modifica recensione</button>
		</form>
		
		<form action="recensioni" method="POST">
	    	<input type="hidden" name="action" value="doDelete">
	    	<input type="hidden" name="idRecensione" value="<%= recensioneut.getIdRecensione() %>">
			<button class="button">Elimina Recensione</button>			
		</form>
		
	    <%}else{
	    %>
	  	<form action="recensioni" method="POST">
		    <input type="hidden" name="idUtente" class="idUtente" value="<%=userpage.getIdUtente()%>">
		    <input type="hidden" name="idProdotto" class="" value="<%=prod.getIdProdotto()%>">
		    
	    	<input type="hidden" name="action" value="doSave">
			<textarea name="recensione" rows="4" cols="40" required></textarea><br>
			<button class="button">Invia recensione</button>

		</form>
		<%}
    }
    %>
	
  	<h2>Reviews</h2>
	
	<%
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