<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles4 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles4 == null) || (!adminRoles4.booleanValue()))
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
	<h2>Users</h2>

</body>
</html>