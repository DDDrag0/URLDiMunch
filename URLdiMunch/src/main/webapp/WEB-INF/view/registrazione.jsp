<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prova registrazione</title>
</head>
<body>
 <div align="center">
	<a href="index.jsp">Home</a>
  <h1>Form di registrazione</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
   <table style="with: 80%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="nome" /></td>
    </tr>
    <tr>
     <td>Nome e Cognome</td>
     <td><input type="text" name="cognome" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
    <tr>
     <td>Telefono</td>
     <td><input type="text" name="telefono" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>
