<script>
<script src="./js/ajaxheadersrc.min.js"</script>
  <script src="./js/search.js"></script>
  <script type="text/javascript"> $(".btn-cart").click(function() {
      var id = $(this).parent().find(".prod_id").val();
      var qnt = $(this).parent().find(".cart-qnt").val();
      window.location.href = "prodottoCliente?action=addC&id=" + id + "&quantity=" + qnt;
    });

    $(".btn-details").click(function() {
      var id = $(this).parent().find(".prod_id").val();
      window.location.href = "SearchServlet?cerca=" + id;
    });

    function redirectToRegistrati() {
      window.location.href = "registrazione.jsp";
    }

    function redirectToLogin() {
      window.location.href = "logIn.jsp";
    }

    function redirectToProfile() {
      window.location.href = "DettagliUser.jsp";
    }

    function redirectToCart() {
      window.location.href = "carrello.jsp";
    }

    function toggleSidebar() {
      var sidebar = document.getElementById("sidebar");
      sidebar.classList.toggle("open");
    }
 </script>