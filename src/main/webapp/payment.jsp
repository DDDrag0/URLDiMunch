<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>payment</title>
<link href="#" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="./css/payment.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./js/jquery.3_2_1.min.js"></script>
</head>
<body>
<form action="<%= request.getContextPath() %>/utente=sasaprova" method="post">
<div class="container">
    <div class="card">
        <div class="top">
            <h3>Secure payment</h3>
            <p>Your card will not be saved</p>
            <hr>
        </div>
        <div class="card-details"> 
        	<input type="text" placeholder="xxxx xxxx xxxx xxxx" required pattern="(\d{4}\s?){4}"> <span>Card Number</span> <i class="fa fa-credit-card"></i>
        </div>
        <div class="exp-cvv">
            <div class="card-details"> <input type="text" placeholder="mm/yyyy" required pattern="\d{2}/\d{4}"> <span>Expiry date</span> <i class="fa fa-calendar"></i> </div>
            <div class="card-details"> <input type="text" placeholder="000" required pattern="[0-9]{3}"> <span>CVV</span> <i class="fa fa-info-circle"></i> </div>
        </div>
        <div class="card-details mt-25"> <input type="text" placeholder="Nome E cognome" required pattern="[A-Za-z\s]+"> <span>Card Holder Name</span> </div>
        <br>
        <div class="button"> <button value="Submit" type="submit">Add Card</button> </div>
    </div>
</div>
</form>
</body></html>