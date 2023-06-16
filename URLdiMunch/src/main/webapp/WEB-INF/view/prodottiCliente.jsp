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
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<<<<<<< HEAD
=======

<head>
    
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Storage DS/BF</title>
	<link href="header.css" rel="stylesheet" type="text/css">
	<link href="prodotticliente.css" rel="stylesheet" type="text/css">
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
<%@ include file="header.jsp" %>
<body>
<div class="container">
  <div id="products" class="row list-group">
    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="foto1.png" alt="" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading">statua</h4>
          <p class="group inner list-group-item-text">$2,100</p>
        </div>
        <div class="btn-group">
          <a class="btn btn-details" href="details.jsp">Details</a>
          <a class="btn btn-cart" href="carrello.jsp">Add to Cart</a>
        </div>
      </div>
    </div>

    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="foto1.png" alt="" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading">elemento2</h4>
          <p class="group inner list-group-item-text">$1,500</p>
        </div>
        <div class="btn-group">
          <a class="btn btn-details" href="details.jsp">Details</a>
          <a class="btn btn-cart" href="carrello.jsp">Add to Cart</a>
        </div>
      </div>
    </div>

    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="foto1.png" alt="" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading">elemento3</h4>
          <p class="group inner list-group-item-text">$800</p>
        </div>
        <div class="btn-group">
          <a class="btn btn-details" href="details.jsp">Details</a>
          <a class="btn btn-cart" href="carrello.jsp">Add to Cart</a>
        </div>
      </div>
    </div>

    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="foto1.png" alt="" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading">elemento4</h4>
          <p class="group inner list-group-item-text">$3,200</p>
        </div>
        <div class="btn-group">
          <a class="btn btn-details" href="details.jsp">Details</a>
          <a class="btn btn-cart" href="carrello.jsp">Add to Cart</a>
        </div>
      </div>
    </div>

    <div class="item col-xs-4 col-md-3">
      <div class="thumbnail">
        <img class="group list-group-image" src="foto1.png" alt="" />
        <div class="caption">
          <h4 class="group inner list-group-item-heading">elemento5</h4>
          <p class="group inner list-group-item-text">$2,700</p>
        </div>
        <div class="btn-group">
          <a class="btn btn-details" href="details.jsp">Details</a>
          <a class="btn btn-cart" href="carrello.jsp">Add to Cart</a>
        </div>
      </div>
    </div>
  </div>
</div>
>>>>>>> branch 'masterBranch' of https://github.com/DDDrag0/URLDiMunch

<<<<<<< HEAD
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Storage DS/BF</title>
	<link href="header.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@ include file="header.jsp" %>
	<h2>Products</h2>
	<br> 
	<a href="index.jsp">Home</a>
	<table border="1">
		<tr>
			<th>Code 		<a href="prodottoCliente?sort=code">Sort</a></th>
			<th>Name 		<a href="prodottoCliente?sort=name">Sort</a></th>
			<th>Description <a href="prodottoCliente?sort=description">Sort</a></th>
			<th>Image</th>     <!--bho -->
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




=======
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="prodotticlienti.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
>>>>>>> branch 'masterBranch' of https://github.com/DDDrag0/URLDiMunch
</body>
<<<<<<< HEAD
</html> 
=======
</html>
>>>>>>> branch 'masterBranch' of https://github.com/DDDrag0/URLDiMunch
