<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./prodotto");	
		return;
	}
	
	Prodotto product = (Prodotto) request.getAttribute("product");
	
	Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<br> 
	<a href="carrello.jsp">cart</a>
	<a href="prodotto">List</a>
	<a href="index.jsp">Home</a>
	<table border="1">
		<tr>
			<th>Code <a href="prodotto?sort=code">Sort</a></th>
			<th>Name <a href="prodotto?sort=name">Sort</a></th>
			<th>Description <a href="prodotto?sort=description">Sort</a></th>
			<th>Action</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Prodotto bean = (Prodotto) it.next();
		%>
		<tr>
			<td><%=bean.getCodice()%></td>
			<td><%=bean.getNome()%></td>
			<td><%=bean.getDescrizione()%></td>
			<td><a href="prodotto?action=delete&id=<%=bean.getCodice()%>">Delete</a><br>
				<a href="details.jsp?code=<%=bean.getCodice()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantità()%>">Details</a><br>
				<a href="prodotto?action=addC&id=<%=bean.getCodice()%>">Add to cart</a>
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
	
	<h2>Details</h2>
	<%
		if (product != null) {
	%>
	<table border="1">
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
		<tr>
			<td><%=product.getCodice()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getQuantità()%></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html> 
