<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="model.Prodotto" %>

<%
	Prodotto prod = (Prodotto) session.getAttribute("prodottoDettagli");
    if(prod == null) {
        response.sendRedirect("index.jsp");    
        return;
    }
%>




<!DOCTYPE html>
    <html lang="it">
    <head>
		<link href="header.css" rel="stylesheet" type="text/css">
    		 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    		 <title> details</title>
    </head>
    
    <body>
		<%@ include file="header.jsp" %>
    		<h2> Product details</h2>
    		<table border="1">
    			<caption>Prodotto</caption>
    				<tr>
    						<th>Code</th>
    						<th>Name</th>
    						<th>Description</th>
    						<th>Price</th>
    						<th>Image</th>
    						<th>Quantity</th>
    				<tr>
    						<td><%=prod.getIdProdotto()%></td>
    						<td><%=prod.getNome()%></td>
    						<td><%=prod.getDescrizione()%></td>
    						<td><%=prod.getPrezzo()%></td>
    						<td><img width="200" src="${pageContext.request.contextPath}<%=prod.getImagepath()%>" alt="<%=prod.getNome()%>"></td>
    						<td><%=prod.getQuantità()%></td>
    						
    				</tr>
    					
    		</table>
    </body>
    </html>