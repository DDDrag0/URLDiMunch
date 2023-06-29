<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ListaOrdini"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles1 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles1 == null) || (!adminRoles1.booleanValue()))
{	
    response.sendRedirect("/logIn.jsp");
    return;
}
%>
<%	
	Collection<?> orders = (Collection<?>) request.getAttribute("adminOrders");
	if(orders == null) {
		//response.sendRedirect("./ordersAdmin");	
		//return;
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
	<%
	if (orders != null && orders.size() != 0) {
		Iterator<?> it = orders.iterator();
		while (it.hasNext()) {
			ListaOrdini bean = (ListaOrdini) it.next();
	%>
				<p><%=bean.getIdOrdine()%></p>
				<br>
	<%
			}
		} else {
	%>
		<a>No Orders available</a>
	<%
		}
	%>
</body>
</html>