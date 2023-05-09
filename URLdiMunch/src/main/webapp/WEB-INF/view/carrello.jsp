<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
    
<%
    HttpSession mysession=request.getSession();
	Carrello cart = (Carrello) session.getAttribute("cart");
    if(cart == null) {
        cart = new Carrello();
        mysession.setAttribute("cart", cart);
        response.sendRedirect("./prodottoCliente");    
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="ProductStyle.css" rel="stylesheet" type="text/css">
    <title>Shopping Cart</title>
</head>
<body>
    <h2>Shopping Cart</h2>
    <br>
    <a href="prodottoCliente">List</a>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Image</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Action</th>
        </tr>
        <%
            double grandTotal = 0;
            for ( Prodotto product : cart.getProducts()) {
                double total = product.getPrezzo() * product.getQuantità();
                grandTotal += total;
        %>
        <tr>
            <td><%=product.getNome()%></td>
            <td><%=product.getDescrizione()%></td>
            <td><%=product.getPrezzo()%></td>
            <td><img width="100%" src="${pageContext.request.contextPath}<%=product.getImagepath()%>" alt=<%=product.getNome()%>></td>
            <td><%=product.getQuantità()%></td>
            <td><%=total%></td>
            <td>
                <a href="prodotto?action=deleteC&id=<%=product.getIdProdotto()%>">Remove</a>
            </td>
        </tr>
        <%
            }
        %>
        <tr>
            <td colspan="3" align="right">Grand Total:</td>
            <td colspan="2"><%=grandTotal%></td>
        </tr>
    </table>
    <button onclick="redirectToPayment()">go to payment</button>
    <script>
    function redirectToPayment(){
    	window.location.href = "payment.jsp"
    }
    </script>
</body>
</html>
