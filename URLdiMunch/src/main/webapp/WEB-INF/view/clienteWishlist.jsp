<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./wishlist");	
		return;
	}
	
	Prodotto product = (Prodotto) request.getAttribute("product");
	
	Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Storage DS/BF</title>
	<link href="prodotticliente.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
  <div class="logo">
    <a href="#">URLdiMunch</a>
  </div>
  <div class="search-bar">
    <input type="text" placeholder="Cerca...">
    <button class="search-button">search</button>
  </div>
  <div class="user-buttons">
    <button onclick="redirectToLogin()">Login</button>
    <button onclick="redirectToRegistrati()">sign up</button>
  </div>
  <div class="cart">
  <button onclick="redirectToCart()" class="no-border" style="border: none;">
  			<img class="no-border" src="image/carrello.png" alt="Carrello" style="border: none;">
  </button>
  <span id="contatorecarrello" class="cart-item-count"></span>
  </div>
</header>

	<h2>Products</h2>
	<br> 
	<a href="carrello.jsp">cart</a>
	<a href="prodottoCliente">List</a>
	<a href="index.jsp">Home</a>
	<table border="1">
		<tr>
			<th>Code 		<a href="prodottoCliente?sort=code">Sort</a></th>
			<th>Name 		<a href="prodottoCliente?sort=name">Sort</a></th>
			<th>Description <a href="prodottoCliente?sort=description">Sort</a></th>
			<th>Image</th>     
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Prodotto bean = (Prodotto) it.next();
		%>
		<tr>
			<td><%=bean.getIdProdotto()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td><img width="200" src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" alt=<%=bean.getNome()%>></td>
			<td><a href="details.jsp?code=<%=bean.getIdProdotto()%>&image=<%=bean.getImagepath()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantità()%>">Details</a><br>
				<a href="prodottoCliente?action=addC&id=<%=bean.getIdProdotto()%>">Add to cart</a>
				</td>
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>
 <%@ include file="footer.jsp" %>



<!-- script login e registrati -->
<script>
function redirectToRegistrati() {
	window.location.href = "registrazione.jsp"
}
function redirectToLogin() {
	window.location.href = "logIn.jsp"
}
function redirectToCart() {
	window.location.href = "carrello.jsp"
}

</script>
</body>
</html> 
