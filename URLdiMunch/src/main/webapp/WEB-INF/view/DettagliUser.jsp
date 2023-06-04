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
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>MyProfile</title>
	<style>
		@font-face { font-family: Arial !important; font-display: swap !important; }
	</style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="#" rel="stylesheet">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
		::-webkit-scrollbar {
		width: 8px;
		}
		/* Track */
		::-webkit-scrollbar-track {
		background: #f1f1f1; 
		}
		
		/* Handle */
		::-webkit-scrollbar-thumb {
		background: #888; 
		}
		
		/* Handle on hover */
		::-webkit-scrollbar-thumb:hover {
		background: #555; 
		} body {
		background: rgb(242, 242, 242)
		}
		
		.form-control:focus {
		    box-shadow: none;
		    border-color: #f2f2f2
		}
		
		.profile-button {
		    background: rgb(0, 0, 0);	/*colore del bottone*/
		    box-shadow: none;
		    border: none
		}
		
		.profile-button:hover {
		    background: #f2f2f2
		}
		
		.profile-button:focus {
		    background: #f2f2f2;
		    box-shadow: none
		}
		
		.profile-button:active {
		    background: #f2f2f2;
		    box-shadow: none
		}
		
		.back:hover {
		    color: #f2f2f2;
		    cursor: pointer
		}
		
		.labels {
		    font-size: 11px
		}
		
		.add-experience:hover {
		    background: #f2f2f2;
		    color: #fff;
		    cursor: pointer;
		    border: solid 1px #f2f2f2
		}
	</style>
</head>
<body classname="snippet-body">
	<%@ include file="header.jsp" %>
	<form action="<%= request.getContextPath() %>/profile" method="post">
	<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span class="font-weight-bold"><%= user.getIdUtente()%></span><span class="text-black-50"><%= user.getEmail()%></span><span> </span></div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Profile Settings</h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Name</label><input type="text" class="form-control" placeholder="<%= user.getNome()%>" value="<%= user.getNome()%>" name="nome"></div>
                    <div class="col-md-6"><label class="labels">Surname</label><input type="text" class="form-control" placeholder="<%= user.getCognome()%>" value="<%= user.getCognome()%>" name="cognome"></div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Mobile Number</label><input type="text" class="form-control" placeholder="<%= user.getTelefono()%>" value="<%= user.getTelefono()%>" name="telefono"></div>
                    <div class="col-md-12"><label class="labels">Invoice Address</label><input type="text" class="form-control" placeholder="<%= user.getIndirizzoFatturazione()%>" value="<%= user.getIndirizzoFatturazione()%>" name="indFatt"></div>
                    <div class="col-md-12"><label class="labels">Delivery Address</label><input type="text" class="form-control" placeholder="<%= user.getIndirizzoSpedizione()%>" value="<%= user.getIndirizzoSpedizione()%>" name="indSped"></div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center experience"><span>Private Settings</span></div><br>
                <div class="col-md-12"><label class="labels">Email ID</label><input type="text" class="form-control" placeholder="<%= user.getEmail()%>" value="<%= user.getEmail()%>" name="email"></div>
                <div class="col-md-12"><label class="labels">Password</label><input type="password" class="form-control" placeholder="insert new password" value="<%= user.getPassword()%>" name="passw"></div>
            </div>
                <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit" value="Submit">Save Profile</button></div>
        </div>
    </div>
</div>
</form>
</body>
</html>