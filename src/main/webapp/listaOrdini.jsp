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
  <title>Ordini</title>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
  </style>
</head>
<body>
	<%@ include file="header.jsp" %>
  <h1>Fattura</h1>
  
  <%
	if (orders != null && orders.size() != 0) {
		Iterator<?> it = orders.iterator();
	%>
		  <table>
		    <tr>
		      <th>ID Ordine</th>
		      <th>Nome Prodotto</th>
		      <th>ID Prodotto</th>
		      <th>ID Utente</th>
		      <th>Indirizzo di Consegna</th>
		      <th>Prezzo</th>
		      <th>Data Ordine</th>
		      <th>IVA</th>
		      <th>Fattura</th>
		    </tr>
  	<%
		while (it.hasNext()) {
			ListaOrdini bean = (ListaOrdini) it.next();
	%>
		    <tr>
		      <td id="idOrdine"><%=bean.getIdOrdine()%></td>
		      <td id="nomeProdotto"><%=bean.getNomeProdotto()%></td>
		      <td id="idProdotto"><%=bean.getIdProdotto()%></td>
		      <td id="idUtente"><%=bean.getIdUtente()%></td>
		      <td id="indirizzoConsegna"><%=bean.getIndirizzoConsegna()%></td>
		      <td id="prezzo"><%=bean.getPrezzo()%></td>
		      <td id="dataOrdine"><%=bean.getDataOrdine()%></td>
		      <td id="iva"><%=bean.getIva()%></td>
		      <td></td>
		    </tr>
	<%
			}
  	%>
	  </table>
	<%
		} else {
	%>
		<a>No Orders available</a>
	<%
		}
	%>

</body>
</html>
