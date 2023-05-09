<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div align="center">
 <a href="index.jsp">Home</a>
  <h1>Employee Login Form</h1>
  <form action="<%=request.getContextPath()%>/login" method="post">
   <table style="with: 100%">
    <tr>
     <td>idUser</td>
     <td><input type="text" name="idUser" /></td>
    </tr>
    <tr>
     <td>Nome</td>
     <td><input type="text" name="nome" /></td>
    </tr>
    <tr>
     <td>Cognome</td>
     <td><input type="text" name="cognome" /></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input type="text" name="email" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="passw" /></td>
    </tr>
    <tr>
     <td>Carta</td>
     <td><input type="text" name="carta" /></td>
    </tr>
    <tr>
     <td>Telefono</td>
     <td><input type="text" name="telefono" /></td>
    </tr>
    <tr>
     <td>Indirizzo Fattura</td>
     <td><input type="text" name="indFatt" /></td>
    </tr>
    <tr>
     <td>Indirizzo Spedizione</td>
     <td><input type="text" name="indSped" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>
