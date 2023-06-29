<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles0 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles0 == null) || (!adminRoles0.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}
%>
<%
Collection<?> orders1 = (Collection<?>) request.getAttribute("adminOrders");
Collection<?> reviews1 = (Collection<?>) request.getAttribute("adminReviews");
Collection<?> users1 = (Collection<?>) request.getAttribute("adminUsers");
if(orders1 == null||reviews1 == null||users1 == null) {
	response.sendRedirect("./adminGestion");	
	return;
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Admin Page</title>
    <link href="./css/admin.css" rel="stylesheet" type="text/css">
    <link href="./css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <div class="row">
      <div class="button" onclick="toggleModal('modal1', this)">Inserisci prodotto</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal2', this)">Visualizza utenti</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal3', this)">Visualizza ordini</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal4', this)">Visualizza recensioni</div>
    </div>
  </div>

  <div id="modal1" class="modal">
    <%@ include file="adminProduct.jsp" %>
  </div>

  <div id="modal2" class="modal">
    <%@ include file="adminUsers.jsp" %>
  </div>

  <div id="modal3" class="modal">
    <%@ include file="adminOrders.jsp" %>
  </div>

  <div id="modal4" class="modal">
    <%@ include file="adminReview.jsp" %>
  </div>

  <script src="./js/admin.js"></script>
</body>
</html>
