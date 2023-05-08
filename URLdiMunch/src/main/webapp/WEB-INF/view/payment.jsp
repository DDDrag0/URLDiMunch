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
    <h2>pagamento</h2>
    <br>
    <a href="prodottoCliente">List</a>
 <table border="1">
        <tr>
            <th>Name</th>
            <th>Price</th>
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
            <td><%=product.getPrezzo()%></td>
            <td><%=product.getQuantità()%></td>
            <td><%=total%></td>
            <td>
                <a href="prodotto?action=deleteC&id=<%=product.getCodice()%>">Remove</a>
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
    <div class="pagamento">
        <h2>pay details</h2>
        <form action="processaPagamento.jsp" method="post">
            <label for="nome">Name:</label>
            <input type="text" id="nome" name="nome" required><br>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>

            <label for="carta">Card number:</label>
            <input type="text" id="carta" name="carta" required><br>

            <!-- Aggiungi altri campi per i dati di pagamento come indirizzo, città, etc. -->

            <button  onclick="redirectToBuyPage()" type="submit">Buy</button>
        </form>
     </div>
     <script>
     			function redirectToBuyPage() {
     				window.location.href = "listaOrdini.jsp"
     			}
     </script>
   </body>
  </html>