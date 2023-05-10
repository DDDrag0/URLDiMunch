<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
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
<title>Dettagli User</title>
</head>
<body>
 <div align="center">
  <h1>Dettagli Account</h1>
  <a>idUtente: <%= user.getIdUtente()%></a>
  <br>
  <a>nome: <%= user.getNome()%></a>
  <br>
  <a>Cognome: <%= user.getCognome()%></a>
  <br>
  <a>Email: <%= user.getEmail()%></a>
  <br>
  <a>Carta: <%= user.getCarta()%></a>
  <br>
  <a>Telefono: <%= user.getTelefono()%></a>
  <br>
  <a>Indirizzo Fatturazione: <%= user.getIndirizzoFatturazione()%></a>
  <br>
  <a>Indirizzo Spedizione: <%= user.getIndirizzoSpedizione()%></a>
  <br>
 </div>
</body>
</html>
