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
		<div class="container">
			<div class="banner">
				<img src="foto2.png" alt="Banner sinistro">
			</div>
			<div class="video">
				<video style="width: 100%;"   autoplay muted loop >
   		 <source data-src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123" type="video/mp4" src="https://cdn.shopify.com/s/files/1/0188/7338/5024/files/home-dec-2021-new.mp4?v=1638810123">
  	</video>
			</div>
			<div class="banner">
				<img src="foto2.png" alt="Banner destro">
			</div>
		</div>
		<%@ include file="footer.jsp" %>
		<script src="index.js"></script>
	</body>
</html>
