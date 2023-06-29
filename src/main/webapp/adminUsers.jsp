<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.User"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles4 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles4 == null) || (!adminRoles4.booleanValue()))
{	
    response.sendRedirect("/logIn.jsp");
    return;
}
Collection<?> users = (Collection<?>) request.getAttribute("adminUsers");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>GestionPage</title>
</head>

<body>
	<h2>Users</h2>
	<%
	if (users != null && users.size() != 0) {
		Iterator<?> it = users.iterator();
		while (it.hasNext()) {
			User bean = (User) it.next();
	%>
				<p><%=bean.getNome()%></p>
				<br>
	<%
			}
		} else {
	%>
		<a>No Users available</a>
	<%
		}
	%>
</body>
</html>