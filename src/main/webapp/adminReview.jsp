<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.Recensione"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles3 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles3 == null) || (!adminRoles3.booleanValue()))
{	
    response.sendRedirect("/logIn.jsp");
    return;
}
%>
<%	
	Collection<?> reviews = (Collection<?>) request.getAttribute("adminReviews");
	if(reviews == null) {
		//response.sendRedirect("./reviewsAdmin");	
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
	<h2>Reviews</h2>
	<%
	if (reviews != null && reviews.size() != 0) {
		Iterator<?> it = reviews.iterator();
		while (it.hasNext()) {
			Recensione bean = (Recensione) it.next();
	%>
				<p><%=bean.getRecensione()%></p>
				<br>
	<%
			}
		} else {
	%>
		<a>No Reviews available</a>
	<%
		}
	%>
</body>
</html>