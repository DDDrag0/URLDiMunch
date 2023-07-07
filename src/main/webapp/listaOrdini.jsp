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
		      <th>Quantità</th>
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
		      <td class="idOrdinetd"><%=bean.getIdOrdine()%></td>
		      <td class="nomeProdotto"><%=bean.getNomeProdotto()%></td>
		      <td class="idProdotto"><%=bean.getIdProdotto()%></td>
		      <td class="quant"><%=bean.getQuantita()%></td>
		      <td class="idUtente"><%=bean.getIdUtente()%></td>
		      <td class="indirizzoConsegna"><%=bean.getIndirizzoConsegna()%></td>
		      <td class="prezzo"><%=bean.getPrezzo()%></td>
		      <td class="dataOrdine"><%=bean.getDataOrdine()%></td>
		      <td class="iva"><%=bean.getIva()%></td>
		      <td>
		      	<button class="details">Details</button>
          		<input class = "idOrdine" type="hidden" value="<%=bean.getIdOrdine()%>">
          	  </td>
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
<script type="text/javascript">
$(".details").click(function(){
	var id = $(this).parent().find(".idOrdine").val()
    window.location.href="fattura?action=ricercaOrdine&idOrdine="+id
});
</script>
</body>
</html>
