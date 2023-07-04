<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="model.User" %>
<%
	User userpage = (User) session.getAttribute("utente");
    if(userpage == null) {
        response.sendRedirect("logIn.jsp");    
        return;
    }
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Profile</title>
	<link href="./css/styleSheetUser.css" rel="stylesheet">
	<link href="./css/dettagliUser.css" rel="stylesheet">
	<link href="#" rel="stylesheet">
	<script type="text/javascript" src="./js/jQueryUser.js"></script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<script src="dettagliuser.js"></script>
	<form action="<%= request.getContextPath() %>/profile?action=mod" method="post">
	<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
            	<img class="rounded-circle mt-5" width="150px" alt="profile_img" src="./image/revpic.jpg">
            	<span class="font-weight-bold"><%= user.getIdUtente()%></span>
            	<span class="text-black-50"><%= user.getEmail()%></span>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6">
                    	<label class="labels">Name</label>
                    	<input required title="inserisci un nome valido" pattern="^[a-zA-Z\d\.]{5,}$" type="text" class="form-control" placeholder="<%= user.getNome()%>" value="<%= user.getNome()%>" name="nome">
                    </div>
                    <div class="col-md-6">
                    	<label class="labels">Surname</label>
                    	<input required title="inserisci un cognome valido" pattern="^[a-zA-Z\d\.\s,-]{5,}$" type="text" class="form-control" placeholder="<%= user.getCognome()%>" value="<%= user.getCognome()%>" name="cognome">
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12">
                    	<label class="labels">Mobile Number</label>
                    	<input required title="inserisci un numero di telefono valido" pattern="(\d{3}\s?){2}(\d{4}\s?){1}" type="text" class="form-control" placeholder="<%= user.getTelefono()%>" value="<%= user.getTelefono()%>" name="telefono">
                    </div>
                    <div class="col-md-12">
	                    <label class="labels">Invoice Address</label>
	                    <input required title="inserisci un indirizzo valido" pattern="^[a-zA-Z\d\.\s,-]{5,}$" type="text" class="form-control" placeholder="<%= user.getIndirizzoFatturazione()%>" value="<%= user.getIndirizzoFatturazione()%>" name="indFatt">
	                </div>
                    <div class="col-md-12">
                    	<label class="labels">Delivery Address</label>
                    	<input required title="inserisci un indirizzo valido" pattern="^[a-zA-Z\d\.\s,-]{5,}$" type="text" class="form-control" placeholder="<%= user.getIndirizzoSpedizione()%>" value="<%= user.getIndirizzoSpedizione()%>" name="indSped">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience">
                	<span>Private Settings</span>
                </div>
                <br>
                <div class="col-md-12">
                	<label class="labels">Email ID</label>
                	<input required title="inserisci una mail valida" type="email" class="form-control" placeholder="<%= user.getEmail()%>" value="<%= user.getEmail()%>" name="email">
                </div>
                <div class="col-md-12">
                	<label class="labels">Password</label>
                	<input required pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="inserisci minimo 8 caratteri con maiuscole, minuscole e numeri." type="password" class="form-control" placeholder="insert new password" value="<%= user.getPassword()%>" name="passw">
                </div><div class="col-md-12">
			    <label class="labels">Payment Method</label>
			    <div class="input-group">
			        <input readonly type="text" placeholder="<%= user.getCarta()%>" class="form-control" value="<%= user.getCarta()%>" name="carta">
			        <div class="input-group-append">
			            <a class="btn btn-primary profile-button float-right" href="payment.jsp">Modify Card</a>
			        </div>
			    </div>
			</div>
            </div>
            	
                <div class="mt-5 text-center">
                <%
				// Check user credentials
				Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
				if (adminRoles.booleanValue())
				{	
					%>
                	<a class="btn btn-primary profile-button" href="adminPage.jsp">Vai alla pagina di Gestione</a>
                	<br>
					<% 
				}
				%>
				<button class="btn btn-primary profile-button" type="submit" value="Submit">Save Profile</button>
				<br>
				<a class="btn btn-primary profile-button" href="listaOrdini.jsp">Ordini Lista</a>
                </div>
        </div>
    </div>
</div>
</form>
</body>
</html>