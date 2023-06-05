 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.Prodotto" %>
<%@ page import="model.Carrello" %>
<%@page import="model.User" %>

<%
	User user = (User) session.getAttribute("utente");
    if(user == null) {
        response.sendRedirect("logIn.jsp");    
        return;
    }
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
	<form action="<%= request.getContextPath() %>/payment" method="post">
	
	
	
	<!--aggiungi lo script qui-->
	
	
	
	<button type="submit" value="Submit">Buy</button>
</form>


</body>
</html>