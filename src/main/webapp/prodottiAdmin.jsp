<%
// Check user credentials
Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles == null) || (!adminRoles.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Prodotto" %>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./prodottoAdmin");	
		return;
	}
	
	Prodotto product = (Prodotto) request.getAttribute("product");
	
%>

<!DOCTYPE html>
<html lang="it">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="./css/ProductStyle.css" rel="stylesheet" type="text/css">
	<title>Storage DS/BF</title>
</head>

<body>
	<h2>Products</h2>
	<br> 
	<a href="prodottoAdmin">List</a>
	<a href="index.jsp">Home</a>
	<table border="1">
	<caption>tabella1</caption>
		<tr>
			<th>Code Admin<a href="prodottoAdmin?sort=code">Sort</a></th>
			<th>Name <a href="prodottoAdmin?sort=name">Sort</a></th>
			<th>Description <a href="prodottoAdmin?sort=description">Sort</a></th>
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
			<td><img width="200" src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" alt="la gioconda"></td>
			<td><a href="prodottoAdmin?action=delete&id=<%=bean.getIdProdotto()%>">Delete</a><br>
				<a href="details.jsp?code=<%=bean.getIdProdotto()%>&name=<%=bean.getNome()%>&description=<%=bean.getDescrizione()%>&price=<%=bean.getPrezzo()%>&quantity=<%=bean.getQuantita()%>">Details</a><br>
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
	<caption>tabella2</caption>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Description</th>
			<th>Price</th>
			<th>Image</th>
			<th>Quantity</th>
		</tr>
		<tr>
			<td><%=product.getIdProdotto()%></td>
			<td><%=product.getNome()%></td>
			<td><%=product.getDescrizione()%></td>
			<td><%=product.getPrezzo()%></td>
			<td><%=product.getQuantita()%></td>
			<td><%=product.getImagepath()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<h2>Insert</h2>
	<form action="prodottoAdmin" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="name">Name:</label><br> 
		<input name="name" type="text" maxlength="20" required placeholder="enter name"><br> 
		
		<label for="description">Description:</label><br>
		<textarea name="description" maxlength="100" rows="3" required placeholder="enter description"></textarea><br>
		
		<label for="price">Price:</label><br> 
		<input name="price" type="number" min="0" value="0" required><br>

		<label for="quantity">Quantity:</label><br> 
		<input name="quantity" type="number" min="1" value="1" required><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">
	</form>
	
	<!-- inizio della pagina immagini -->
	
	<h3>Lecturers</h3>
	1<img src="./getPicture?id=1" onerror="this.src='./image/errImg.jpg'" style="width:100px">
	2<img src="./getPicture?id=2" onerror="this.src='./image/errImg.jpg'" style="width:100px">
	3<img src="./getPicture?id=3" onerror="this.src='./image/errImg.jpg'" style="width:100px">
	<br>
	<hr>
	<form action="UploadPhoto" enctype="multipart/form-data" method="post">
		Id:
		<select name="id">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select>
		<br>
		<input class="file" type="file" name="talkPhoto" value="" maxlength="255">	
		<br>		
		<input type="submit"><input type="reset">
	</form>
	
</body>
</html>