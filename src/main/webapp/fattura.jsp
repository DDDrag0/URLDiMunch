<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ListaOrdini"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="model.User" %>
<%
	User userpage = (User) session.getAttribute("utente");
    if(userpage == null) {
        response.sendRedirect("logIn.jsp");    
        return;
    }
%>
<% 
Collection<?> orders = (Collection<?>) request.getAttribute("orders");
if(orders == null) {
	response.sendRedirect("./userOrders");	
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Fattura</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<h1>Fattura</h1>
</body>
</html>
