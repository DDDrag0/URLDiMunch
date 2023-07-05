<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%
    Collection<?> products = (Collection<?>) request.getAttribute("products");
    if (products == null) {
        response.sendRedirect("./prodottoCliente?source=/index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<link href="./css/header.css" rel="stylesheet" type="text/css">
		<link href="./css/index.css" rel="stylesheet" type="text/css">
		<meta charset="UTF-8">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.css">
  <script>
  window.console = window.console || function(t) {};
</script>
		<title>Index</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
<!-- carosello -->
  <div class="carousel slide carousel-fade hidden-xs" id="featured">
     
     <!--Indicators-->
     <ol class="carousel-indicators">
       <li data-target="#featured" data-slide-to="0" class="indicator"></li>
       <li data-target="#featured" data-slide-to="1" class="indicator"></li>
       <li data-target="#featured" data-slide-to="2" class="indicator active"></li>
     </ol>
     
     <div class="carousel-inner">
        <div class="item">
          <img class="carousel-image" src="https://res.cloudinary.com/epiphanystudios/image/upload/v1474325161/Billboard_-_AnalyticsBanner_s0vsiv.jpg" alt="banner 1">
          <div class="carousel-caption animated fadeInUp" id="caption1-text" style="zoom: 0.7304;">
            <span>This is the first caption</span>
          </div>
          <div class="carousel-caption animated fadeInUp" id="caption1-button" style="zoom: 0.7304;">
            <a class="btn btn-default text-center btn-teo-caption">Get a Quote</a>
          </div>
        </div>
        <div class="item">
          <img class="carousel-image" src="https://res.cloudinary.com/epiphanystudios/image/upload/v1474389520/Billboard_-_HipsterBanner_rzyv5r.jpg" alt="banner 2">
          <div class="carousel-caption animated fadeInUp" style="zoom: 0.7304;">
            <span>This is the second caption</span>
          </div>
          <div class="carousel-caption animated fadeInUp" id="caption1-button" style="zoom: 0.7304;">
            <a class="btn btn-default text-center btn-teo-caption">Chat With Us</a>
          </div>
        </div>
        <div class="item active">
          <img class="carousel-image" src="https://res.cloudinary.com/epiphanystudios/image/upload/v1474389522/Billboard_-_ProductsBanner_kfucs3.jpg" alt="banner 3">
          <div class="carousel-caption animated fadeInUp" style="zoom: 0.7304;">
            <span>This is the third caption</span>
          </div>
          <div class="carousel-caption animated fadeInUp" id="caption1-button" style="zoom: 0.7304;">
            <a class="btn btn-default text-center btn-teo-caption">Learn More</a>
          </div>
        </div>
     </div><!--carousel inner-->
     
     <!--Previous Button-->
     <a class="left carousel-control" href="#featured" role="button" data-slide="prev">
       <span class="glyphicon glyphicon-chevron-left"></span>
     </a>
     <!--Next Button-->
     <a class="right carousel-control" href="#featured" role="button" data-slide="next">
       <span class="glyphicon glyphicon-chevron-right"></span>
     </a>
    </div><!--carousel-->
















		
		
		
		
		
		
		
		
		
		<div class="separator">
      <div class="content">
        <span class="text">Di tendenza</span>
      </div>
    </div>
    <div class="container">
        <div class="row">
            <% int i=0;
            	if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()&& i<=4) {
                    Prodotto bean = (Prodotto) it.next();
                    i++;
            %>
            <div class="col">
                <div class="card">
                    <img src="${pageContext.request.contextPath}<%=bean.getImagepath()%>" onerror="this.src='./image/errImg.jpg'"alt="<%=bean.getNome()%>" />
                    <div class="card-details">
                        <h4><%=bean.getNome()%></h4>
                        <p>$<%=bean.getPrezzo()%></p>
                    </div>
                    <div class="card-buttons">
				          <button class="btn btn-details">Details</button>
				          <button class="btn btn-cart">Add to Cart</button>
				          <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
				          <input class = "prod_id" type="hidden" value="<%=bean.getIdProdotto()%>">
                    </div>
                </div>
            </div>
            <% } } else { %>
            <p>No products available</p>
            <% } %>
        </div>
    </div>
<div class="separator">
      <div class="content">
        <span class="text">Nuovi arrivi</span>
      </div>
    </div>
        <div class="container">
        <div class="row">
            <%  i=0;
            	if (products != null && products.size() != 0) {
                Iterator<?> it = products.iterator();
                while (it.hasNext()&& i<=4) {
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
				          <button class="btn btn-cart">Add to Cart</button>
				          <input class="cart-qnt" type="number" value="1" min="1" max="<%=bean.getQuantita()%>">
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
<script src="./js/ajaxheadersrc.min.js"></script>
<script src="./js/search.js"></script>
<script src="./js/jQueryProdottiCliente.js"></script>
<script src="./js/prodotticlienti.js"></script>
<script src="./js/jsProdottiCliente.js"></script>
   <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.19.0/TweenMax.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
      <script id="rendered-js">
//Initialize the carousel
$(function () {

  $('.carousel').carousel({
    interval: 5000 });


});

//Make the caption responsive to window width
$(document).ready(function () {
  $('.carousel .carousel-caption').css('zoom', $('.carousel').width() / 1250);
});

$(window).resize(function () {
  $('.carousel .carousel-caption').css('zoom', $('.carousel').width() / 1250);
});
    </script>
<script type="text/javascript">
$(".btn-cart").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    var qnt = $(this).parent().find(".cart-qnt").val()
    window.location.href="prodottoCliente?source=/index.jsp&action=addC&id="+id+"&quantity="+qnt
});

$(".btn-details").click(function(){
	var id = $(this).parent().find(".prod_id").val()
    window.location.href="SearchServlet?cerca="+id
});

// js banner top//

</script>
	</body>
</html>
