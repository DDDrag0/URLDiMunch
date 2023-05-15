<!DOCTYPE html>
<html>
	<head>
		<link href="header.css" rel="stylesheet" type="text/css">
		<link href="index.css" rel="stylesheet" type="text/css">
		<meta charset="UTF-8">
		<title>Lobby</title>
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div id="video-container">
  	<video class="bg-video z1 ntouch-ok" autoplay muted loop style="position:absolute; right:0;bottom:0;min-width:100%;min-height:100%; width:auto;height:auto; overflow:hidden;background:#333;">
   		 <source data-src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123" type="video/mp4" src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123">
  	</video>
			<div id="welcome-text">
			
				Welcome to URLdiMunch<br>
				<span style="font-size: 14px;">the first art site developed by unisastudents</span>
			</div>

			<div id="discover-text">
				Discover our selection of unique artworks<br>
				from the best contemporary and historical artists and designers worldwide
			</div>
		</div>

		<h2>Scegli</h2>
		<br>
		<a href="prodottiAdmin.jsp">prodottiAdmin</a>
		<br>
		<a href="prodottiCliente.jsp">prodottiCliente</a>
		<br>
		<a href="DettagliUser.jsp">dettagliUtente</a>
		<br>
		<form action="<%=request.getContextPath()%>/LogOut" method="post">
			<input type="submit" value="LogOut (elimina anche il carrello)" />
		</form>
		<%@ include file="footer.jsp" %>
		<script src="index.js"></script>
	</body>
</html>
