<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Prodotto,model.Carrello"%>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    Collection<?> productssort = (Collection<?>) request.getAttribute("productssort");
    if (products == null||productssort== null) {
        response.sendRedirect("./prodottoCliente?source=/index.jsp");
        return;
    }

    Carrello cart = (Carrello) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="./css/header.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="./css/prodotticliente.css">
    <%@ include file="header.jsp" %>
</head>
<body>
  <%@ include file="./static/carosello.html" %>


<div class="separator">
      <div class="content">
        <span class="text">New</span>
      </div>
    </div>
        <div class="container">
        <div class="row">
            <% 	int i=0;
            	if (productssort != null && productssort.size() != 0) {
                Iterator<?> it = productssort.iterator();
                while (it.hasNext()&& i<=8) {
                    Prodotto bean = (Prodotto) it.next();
                    i++;
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
				          <input class = "prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
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
$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});
</script>
</body>
</html>

