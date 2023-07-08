<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Recensione,model.User"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles == null) || (!adminRoles.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}

User user = (User) session.getAttribute("utente");
String login;
login=user.getIdUtente();

Collection<?> reviews = (Collection<?>) request.getAttribute("adminReviews");
if(reviews == null) {
	response.sendRedirect("./adminGestion?source=adminReview.jsp");	
	return;
}
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>URLDiMunchAdmin</title>
	<link rel="stylesheet" href="./css/lib/fontAwsome.css">
	<link rel="stylesheet" href="./css/lib/noUiSlider.css">
	<link rel="stylesheet" href="./css/admin.css" type="text/css">
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
	            <li><a href="adminPage.jsp"><span class="fa fa-table"></span>PRODUCT</a>
	            <li><a href="adminOrders.jsp"><span class="fa fa-money"></span>ORDERS</a></li>
	            <li><a href="adminUsers.jsp"><span class="fa fa-user-o"></span>USER</a></li>
	            <li><a href="adminReview.jsp"><span class="fa fa-envelope-o"></span>REVIEWS</a></li>
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
                    <li><a href="index.jsp">View website</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogOut">Log out<span class="fa fa-sign-out fr"></span></a></li>
                </ul>
            </div>
        </nav>
        <!-- END NAV -->
        <!-- CONTAINER  -->
        <div class="mainContent"> 
			<!-- LIST FORM -->
			<form action="" method="GET" name="listForm" class="form scrollX">
			    <div class="formHeader row">
			        <h2 class="text-1 fl">Review List</h2>
			        <div class="fr">
			        </div>
			    </div>
			    <div class="table">
			        <div class="row bg-1">
			            <div class="cell cell-150 text-center text-fff">ID</div>
			            <div class="cell cell-150 text-center text-fff">PRODUCT</div>
			            <div class="cell cell-150 text-center text-fff">USER</div>
			            <div class="cell cell-100p text-center text-fff">REVIEW</div>
			            <div class="cell cell-100 text-center text-fff">EDIT</div>
			        </div>
			    <!--   BEGIN LOOP -->
			        <ul>
						<%
						if (reviews != null && reviews.size() != 0) {
							Iterator<?> it = reviews.iterator();
							while (it.hasNext()) {
								Recensione bean = (Recensione) it.next();
						%>
			            <li class="row">
			                <div class="cell cell-150 text-center"><%= bean.getIdRecensione() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getIdProdotto() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getIdUtente() %></div>
			                <div class="cell cell-100p text-center"><%= bean.getRecensione() %></div>
			                <div class="cell cell-100 text-center">
			                    <a href="AdminActions?action=deleteReview&code=<%= bean.getIdRecensione() %>" class="btnRemove fa fa-remove bg-1 text-fff" onclick="return confirm(&quot;Do you really want to remove it?&quot;)"></a>
			                </div>
			            </li>
			            <%	}
							} else {
						%>
							<a>No Users available</a>
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