<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="org.owasp.encoder.Encode" %>
<%@ page import="model.Prodotto" %>
<%@ page import="dao.RecensioneDAO" %>
<%@ page import="model.Recensione" %>
<%@ page import="java.util.Collection" %>
<%@page import="model.User" %>

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
  <%@ include file="header.jsp" %>
</head>
<body>

  <h2><%=prod.getNome() %></h2>
  <div class="container">
    <div class="left-image">
      <img id="zoom" data-zoom-image="${pageContext.request.contextPath}<%=prod.getImagepath()%>" src="${pageContext.request.contextPath}<%=prod.getImagepath()%>" onerror="this.src='./image/errImg.jpg'" alt="<%=prod.getNome()%>">
    </div>
    <div class="product-info">
      <p><%=prod.getDescrizione()%></p>
    </div>
    <div class="right-card">
      <div class="price-card">
        <h3>Price</h3>
        <p><%=prod.getPrezzo()%> $</p>
      </div>
      <button class="btn btn-cart">Add to Cart</button>
	  <input class = "prod_id" type="hidden" value="<%=prod.getIdProdotto()%>">
      <input class="cart-qnt" type="number" value="1" min="1" max="<%=prod.getQuantita()%>">
    </div>
  </div>
    <div class="containertable">
     <div class="product-info">
     <table>
     	<caption>details table</caption>
		  <tr>
		  	<th></th>
		  	<th></th>
		  </tr>
		  <tr>
		    <td>Artist</td>
		    <td><%=prod.getArtista()%></td>
		  </tr>
		  <tr>
		    <td>Type</td>
		    <td><%=prod.getTipo()%></td>
		  </tr>
		  <tr>
		    <td>Age</td>
		    <td><%=prod.getEpoca()%></td>
		  </tr>
		  <tr>
		    <td>Dimensioni</td>
		    <td><%=prod.getDimensioni()%></td>
		  </tr>
		  <tr>
		    <td>Quantity</td>
		    <td><%=prod.getQuantita()%></td>
		    <td>
		    <% 
				User usercheck = (User) session.getAttribute("utente");
			    if(usercheck != null) {
				// Check user credentials
				Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
				if (adminRoles.booleanValue())
				{%>
		    	<form action="<%=request.getContextPath()%>/AdminActions" method="GET">
					<span>Nuova quantità:</span><input required type="text" name="quant" style="width: 50px" pattern="[0-9]*">
					<input type="hidden" name="action" value="modifyQuant">
					<input type="hidden" name="code" value="<%=prod.getIdProdotto()%>">
					<button style="display: none;" class="btnAdd fa fa-plus bg-1 text-fff" onclick="return confirm(&quot;Do you want to change the quantity?&quot;)"></button>
		       	</form>
				<%}}%>
			</td>
		  </tr>
		  <tr>
		    <td>Inserition time</td>
		    <td><%=prod.getDataaggiunta()%></td>
		  </tr>
	</table>    
	</div>
</div>
    
    
  <div class="wrapper">
  <div class="form-container">
    <h2 style="margin-left:20px;">Write a Review!</h2>
    <% 
    User userpage = (User) session.getAttribute("utente");
    if(userpage == null) {
    %>
    	<h4 style="margin-left:20px; margin-top:15px;">To write a review you must be logged!</h4><br>
      	<a class="button" href="./logIn.jsp">LogIn</a>

    <%} else {
    	if (recensioneDAO.doRetrieveByProdUser(userpage.getIdUtente(), prod.getIdProdotto()) != null) {
        Recensione recensioneut = recensioneDAO.doRetrieveByProdUser(userpage.getIdUtente(), prod.getIdProdotto());
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

    <% } else { %>
    <form action="recensioni" method="POST">
      <input type="hidden" name="idUtente" class="idUtente" value="<%=userpage.getIdUtente()%>">
      <input type="hidden" name="idProdotto" class="" value="<%=prod.getIdProdotto()%>">
      <input type="hidden" name="action" value="doSave">

      <textarea name="recensione" rows="4" cols="40" required></textarea><br>
      <button class="button">Invia recensione</button>
    </form>
    <% } %>

    <% } %>
  </div>


  <div class="review-list">
  <h2>Reviews</h2>
    <% Collection<Recensione> recensioni = recensioneDAO.doRetrieveByProduct(prod.getIdProdotto());
    if (recensioni != null && !recensioni.isEmpty()) {
      for (Recensione recensione : recensioni) { %>
    <div class="review">
      <div class="container">
        <div class="left-image">
          <img width="20" src="./image/revpic.jpg" alt="immagine utent">
        </div>
        <div class="product-info img"> 
          <h3 class="approval-heading"><%= Encode.forHtml(recensione.getIdUtente()) %></h3>
          <p class="comment"><%= Encode.forHtml(recensione.getRecensione()) %></p>
        </div>
      </div>
    </div>
    <% }
    } else { %>
    <p class="no-reviews">No reviews on this product.</p>
    <% } %>
  </div>
  </div>
  
<script type="text/javascript" src="./js/lib/jqueryV1_4_4.min.js"></script>
<script type="text/javascript" src="./js/lib/jquery.ez-plus.js"></script>
  <script type="text/javascript">
    $(".btn-cart").click(function(){
      var id = $(this).parent().find(".prod_id").val()
      var qnt = $(this).parent().find(".cart-qnt").val()
      window.location.href="prodottoCliente?source=/detailsSearch.jsp&action=addC&id="+id+"&quantity="+qnt
    });
    
    $('#zoom').ezPlus({
        easing: true
    });
  </script>

</body>
</html>

