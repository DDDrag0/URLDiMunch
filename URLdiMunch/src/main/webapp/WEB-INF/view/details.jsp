<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project"%>
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
		<link href="header.css" rel="stylesheet" type="text/css">
    		 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    		 <title> details</title>
    </head>
    
    <body>
		<%@ include file="header.jsp" %>
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
    						<td>${e:forHtml(code)}</td>
    						<td>${e:forHtml(name)}</td>
    						<td>${e:forHtml(description)}</td>
    						<td>${e:forHtml(price)}</td>
    						<td><img width="200" src="${pageContext.request.contextPath}${e:forHtml(image)}" alt="la gioconda"></td>
    						<td>${e:forHtml(quantity)}</td>
    				</tr>
    					
    		</table>
    </body>
    </html>