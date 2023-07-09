<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("productssort");
    if (products == null) {
        response.sendRedirect("./prodottoCliente?source=/prodottiClienteN.jsp");
        return;
    }

    Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Addition order</title>
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="./css/prodotticliente.css">
    <%@ include file="header.jsp" %>
</head>
<body>

<div class="separator">
      <div class="content">
        <a class="text" href="prodottiCliente.jsp">All the products</a>
        <a class="text" href="prodottiClienteS.jsp">Statue</a>
        <a class="text" href="prodottiClienteP.jsp">Paintings</a>
        <a class="text" href="prodottiClienteC.jsp">Carpets</a>
        <span class="text">Addition order</span>
      </div>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <% if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()) {
                    Prodotto bean = (Prodotto) it.next();
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" onerror="this.src='./image/errImg.jpg'" alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
                        <button class="btn btn-details">Details</button>
                        <button class="btn btn-cart">Add to Cart</button>
                        <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
                        <input class="prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p>No products available</p>
            <% } %>
        </div>
    </div>

<%@ include file="footer.jsp" %>
<script src="./js/lib/jQueryProdottiCliente.js"></script>
<script src="./js/lib/jsProdottiCliente.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $(".card img").hover(function() {
            $(this).css("transform", "scale(1.1)");
        }, function() {
            $(this).css("transform", "scale(1)");
        });
    });

    $(".btn-cart").click(function() {
        var id = $(this).parent().find(".prod_id").val()
        var qnt = $(this).parent().find(".cart-qnt").val()
        window.location.href = "prodottoCliente?source=/prodottiCliente.jsp&action=addC&id=" + id + "&quantity=" + qnt
    });

    $(".btn-details").click(function() {
        var id = $(this).parent().find(".prod_id").val()
        window.location.href = "SearchServlet?cerca=" + id
    });
</script>
</body>
</html>
