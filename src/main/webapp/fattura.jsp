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
ListaOrdini fattur = (ListaOrdini) request.getAttribute("fatturau");
if(fattur == null) {
	response.sendRedirect("./listaOrdini.jsp");	
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Fattura</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<h1>Fattura: <%= fattur.getIdOrdine() %></h1>
	
	<h2>tabella prodotti</h2>
	
	<table>
		    <tr>
		      <th>Nomi Prodotti</th>
		      <th>ID Prodotti</th>
		      <th>Quantità</th>
		      <th>Immagine</th>
		    </tr>
		    
		    <%
		    String[] nomeArray = fattur.getNomeProdotto().split("&");
		    String[] idArray = fattur.getIdProdotto().split("&");
		    String[] quantArray = fattur.getQuantita().split("&");
		    String[] imgArray = fattur.getImagepath().split("&");
		    
		    int lunghezza=nomeArray.length;
		    
		    for (int i = 0; i < lunghezza; i++){
		    %>
		    
		    <tr>
		      <td class="nomeProdotto"><%= nomeArray[i] %></td>
		      <td class="idProdotto"><%= idArray[i] %></td>
		      <td class="quant"><%= quantArray[i] %></td>
		      <td class="iva"><img width="200px" onerror="this.src='./image/errImg.jpg'" alt="<%= nomeArray[i] %>" src="${pageContext.request.contextPath}<%= imgArray[i] %>"></td>
		    </tr>
		    
		    <%
		    }
		    %>
		      
		</table>
	  
	  
		<%= fattur.getIndirizzoConsegna() %><br>
		<%= fattur.getIva() %>%<br>
		<%= fattur.getPrezzo() %>$<br>
		<%= fattur.getDataOrdine() %><br>
		
	  <button onclick="stampaPDF()">Stampa</button>
<script type="text/javascript">
function stampaPDF() {
	  // Controlla se il browser supporta la funzione di stampa PDF
	  if (typeof window.print === 'function') {
	    // Avvia la funzione di stampa
	    window.print();
	  } else {
	    // Il browser non supporta la stampa PDF
	    console.log('Il browser non supporta la stampa PDF');
	  }
	}
</script>
</body>
</html>
