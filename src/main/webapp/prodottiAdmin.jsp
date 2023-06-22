<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles == null) || (!adminRoles.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
		<link href="./css/header.css" rel="stylesheet" type="text/css">
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>GestionPage</title>
</head>

<body>
	<h2>Insert</h2>
	<form action="<%=request.getContextPath()%>/prodottoAdmin" method="post">
		  <input type="text" name="idProdotto" placeholder="idProdotto">
		  <input type="text" name="nome" placeholder="nome">
		  <input type="text" name="artista" placeholder="artista">
		  <input type="text" name="tipo" placeholder="tipo">
		  <input type="text" name="epoca" placeholder="epoca">
		  <input type="text" name="dimensioni" placeholder="dimensioni">
		  <input type="text" name="descrizione" placeholder="descrizione">
		  <input type="text" name="quantità" placeholder="quantità">
		  <input type="text" name="prezzo" placeholder="prezzo">
		  <input type="text" name="iva" placeholder="iva">
		  
        <button value="Submit">inserisci prodotto</button>
	</form>
	
</body>
</html>