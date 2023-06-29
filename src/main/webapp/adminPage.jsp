<!DOCTYPE html>
<!-- Per il momento è solo grafica, dopo aggiungo i controlli -->
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Page</title>
    <link href="./css/admin.css" rel="stylesheet" type="text/css">
    <link href="./css/header.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
  <div class="container">
    <div class="row">
      <div class="button" onclick="toggleModal('modal1', this)">Inserisci prodotto</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal2', this)">Visualizza utenti</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal3', this)">Visualizza ordini</div>
    </div>
    <div class="row">
      <div class="button" onclick="toggleModal('modal4', this)">Visualizza recensioni</div>
    </div>
  </div>

  <div id="modal1" class="modal">
    <%@ include file="prodottiAdmin.jsp" %>
  </div>

  <div id="modal2" class="modal">
    Contenuto Modal 2
  </div>

  <div id="modal3" class="modal">
    Contenuto Modal 3
  </div>

  <div id="modal4" class="modal">
    Contenuto Modal 4
  </div>

  <script src="./js/admin.js"></script>
</body>
</html>
