<!DOCTYPE html>
<html>
<head>
  <title>Fattura</title>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }
    th, td {
      border: 1px solid black;
      padding: 8px;
      text-align: left;
    }
  </style>
</head>
<body>
  <h1>Fattura</h1>
  <table>
    <tr>
      <th>ID Ordine</th>
      <th>Nome Prodotto</th>
      <th>ID Prodotto</th>
      <th>ID Utente</th>
      <th>Indirizzo di Consegna</th>
      <th>Prezzo</th>
      <th>Data Ordine</th>
      <th>IVA</th>
    </tr>
    <tr>
      <td id="idOrdine"></td>
      <td id="nomeProdotto"></td>
      <td id="idProdotto"></td>
      <td id="idUtente"></td>
      <td id="indirizzoConsegna"></td>
      <td id="prezzo"></td>
      <td id="dataOrdine"></td>
      <td id="iva"></td>
    </tr>
  </table>

  <script>
    // Recupera i dati dei parametri dal backend o da una fonte dati
    var idOrdine = "ABC123";
    var nomeProdotto = "Prodotto di esempio";
    var idProdotto = "P123";
    var idUtente = "U456";
    var indirizzoConsegna = "Via Roma, 123";
    var prezzo = 99.99;
    var dataOrdine = "2023-07-01";
    var iva = 22.0;

    // Assegna i valori ai campi della tabella
    document.getElementById("idOrdine").textContent = idOrdine;
    document.getElementById("nomeProdotto").textContent = nomeProdotto;
    document.getElementById("idProdotto").textContent = idProdotto;
    document.getElementById("idUtente").textContent = idUtente;
    document.getElementById("indirizzoConsegna").textContent = indirizzoConsegna;
    document.getElementById("prezzo").textContent = prezzo.toFixed(2);
    document.getElementById("dataOrdine").textContent = dataOrdine;
    document.getElementById("iva").textContent = iva.toFixed(2);
  </script>
</body>
</html>
