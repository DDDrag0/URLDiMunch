<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession, java.util.*, model.User, model.ListaOrdini" %>
<%
User user = (User) session.getAttribute("utente");
String login;
login=user.getIdUtente();

Collection<?> orders = (Collection<?>) request.getAttribute("adminOrders");
if(orders == null) {
	response.sendRedirect(request.getContextPath()+"/adminGestion?source=admin/adminOrders.jsp");
	return;
}
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>URLDiMunchAdmin</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="./css/lib/noUiSlider.css">
	<link rel="stylesheet" href="./css/admin.css" type="text/css">
	<script>
		function filterElementsByDate() {
			var fromDate = document.getElementById('fromDate').value;
			var toDate = document.getElementById('toDate').value;
			var items = document.getElementsByClassName('item');
			
			// Converti le date nel formato "aaaa-mm-gg"
			fromDate = fromDate.replaceAll("-", "/");
			toDate = toDate.replaceAll("-", "/");
			
			for (var i = 0; i < items.length; i++) {
				var itemDate = items[i].getAttribute('data-date');
				
				if (itemDate >= fromDate && itemDate <= toDate) {
					items[i].style.display = 'block'; // Mostra l'elemento
				} else {
					items[i].style.display = 'none'; // Nascondi l'elemento
				}
			}
		}
	</script>
</head>

<body translate="no">
	<div class="container">
	<!--     SIDE AREA -->
	    <div class="sideArea">
			<div class="avatar">
	            <img src="./image/revpic.jpg" alt="">
	            <div class="avatarName">Welcome,<br><%= login %></div>
	        </div>
	        <ul class="sideMenu">
	            <li><a href="admin/adminPage.jsp"><span class="fa fa-table"></span>PRODUCT</a>
	            <li><a href="admin/adminOrders.jsp"><span class="fa fa-money"></span>ORDERS</a></li>
	            <li><a href="admin/adminUsers.jsp"><span class="fa fa-user-o"></span>USER</a></li>
	            <li><a href="admin/adminReview.jsp"><span class="fa fa-envelope-o"></span>REVIEWS</a></li>
	        </ul>
	    </div>
	<!--     SIDE AREA -->
    <div class="mainArea">
        <!-- BEGIN NAV -->
        <nav class="navTop row">
            <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
            <div class="account fr">
                <div class="name has-submenu"><%= login %><span class="fa fa-angle-down"></span></div>
                <ul class="accountLinks submenu">
                    <li><a href="./index.jsp">View website</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogOut">Log out<span class="fa fa-sign-out fr"></span></a></li>
                </ul>
            </div>
        </nav>
        <!-- END NAV -->
        <!-- CONTAINER  -->
        <div class="mainContent"> 
			<!-- Search filter panel -->     
			<div class="row filterGroup">
			    <div class="areaFilter fr row">
					<!-- FILTER -->
			        <div class="btnFilter fr bg-fff"><span class="fa fa-filter"></span>Filter</div>
			        <div class="boxFilter">
			            <div class="btnFilter"><span class="fa fa-close"></span>Close</div>
			            <div class="groupInput">
							<p class="titleInput">Date</p>
							<p>From</p>
							<input type="date" id="fromDate" pattern="\d{4}-\d{2}-\d{2}">
							<p>To</p>
							<input type="date" id="toDate" pattern="\d{4}-\d{2}-\d{2}">
						</div>
						<button onclick="filterElementsByDate()">Apply Filter</button>
		            </div>
				<!-- END GROUP -->             
		        </div>
		    </div>
			<!-- LIST FORM -->
			<form action="" method="GET" name="listForm" class="form scrollX">
			    <div class="formHeader row">
			        <h2 class="text-1 fl">Order List</h2>
			        <div class="fr">
			        </div>
			    </div>
			    <div class="table">
			        <div class="row bg-1">
			            <div class="cell cell-150 text-center text-fff">ID</div>
			            <div class="cell cell-150 text-center text-fff">DATE</div>
			            <div class="cell cell-150 text-center text-fff">TOTAL</div>
			            <div class="cell cell-100 text-center text-fff">USER</div>
			            <div class="cell cell-100p text-center text-fff">PRODUCTS</div>
			            <div class="cell cell-100 text-center text-fff">EDIT</div>
			        </div>
			    <!--   BEGIN LOOP -->
			        <ul>
						<%
						if (orders != null && orders.size() != 0) {
							Iterator<?> it = orders.iterator();
							while (it.hasNext()) {
								ListaOrdini bean = (ListaOrdini) it.next();
						%>
			            <li class="row">
			                <div class="cell cell-150 text-center"><%= bean.getIdOrdine() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getDataOrdine() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getPrezzo() %>$</div>
			                <div class="cell cell-100 text-center"><%= bean.getIdUtente() %></div>
			                <div class="cell cell-100p text-center"><%= bean.getIdProdotto() %></div>
			                <div class="cell cell-100 text-center">
			                    <a href="<%=request.getContextPath()%>/AdminActions?action=deleteOrder&code=<%= bean.getIdOrdine() %>" class="btnRemove fa fa-remove bg-1 text-fff" onclick="return confirm(&quot;Do you really want to remove it?&quot;)"></a>
			                </div>
			            </li>
			            <%	}
							} else {
						%>
							<a>No orders available</a>
						<%
							}
						%>
			        </ul>
			    <!--   END LOOP -->
			    </div>
			</form>
		</div>
		<!-- END CONTAINER  -->
    </div>
</div>
<script src="./js/lib/nouislider.js"></script>
<script src="./js/lib/stopExecutionOnTimeout.js"></script>
<script id="rendered-js" src="./js/admin.js"></script>
</body>
</html>