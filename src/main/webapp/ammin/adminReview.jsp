<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles3 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles3 == null) || (!adminRoles3.booleanValue()))
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
	<h2>Reviews</h2>

</body>
</html>