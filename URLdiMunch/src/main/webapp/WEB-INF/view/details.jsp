<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" import="model.Prodotto" %>
<%
	String code = request.getParameter("code");
	String image = request.getParameter("image");
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	double price = Double.parseDouble(request.getParameter("price"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
%>


    <html>
    <head>
    		 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    		 <title> details</title>
    </head>
    
    <body>
    		<h2> Product details</h2>
    		<table border="1">
    				<tr>
    						<th>Code</th>
    						<th>Name</th>
    						<th>Description</th>
    						<th>Price</th>
    						<th>Image</th>
    						<th>Quantity</th>
    				<tr>
    						<td><%=code%></td>
    						<td><%=name%></td>
    						<td><%=description%></td>
    						<td><%=price%></td>
    						<td><img width="200" src="${pageContext.request.contextPath}<%=image%>" alt="la gioconda"></td>
    						<td><%=quantity%></td>
    				</tr>
    					
    		</table>
    </body>
    </html>