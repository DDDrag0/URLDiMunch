<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles2 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles2 == null) || (!adminRoles2.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>GestionPage</title>
</head>

<body>
	<h2>Insert</h2>
	<form action="<%=request.getContextPath()%>/prodottoAdmin" method="post">
		  <input type="text" name="idProdotto" placeholder="idProdotto">
		  <br>
		  <input type="text" name="nome" placeholder="nome">
		  <br>
		  <input type="text" name="artista" placeholder="artista">
		  <br>
		  <input type="text" name="tipo" placeholder="tipo">
		  <br>
		  <input type="text" name="epoca" placeholder="epoca">
		  <br>
		  <input type="text" name="dimensioni" placeholder="dimensioni">
		  <br>
		  <input type="text" name="descrizione" placeholder="descrizione">
		  <br>
		  <input type="number" name="quantita" placeholder="quantitÃ ">
		  <br>
		  <input type="number" name="prezzo" placeholder="prezzo">
		  <br>
		  <input type="number" name="iva" placeholder="iva">
		  <br>
		  
        <button value="Submit">inserisci prodotto</button>
	</form>
	
</body>
</html>