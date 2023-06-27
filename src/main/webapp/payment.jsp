<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>payment</title>
<style>
@font-face { font-family: Arial !important; font-display: swap !important; }
</style>
<link href="#" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="./js/jquery.3_2_1.min.js"></script>
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
} @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200&display=swap');

* {
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif
}

.container {
    min-height: 100vh;
    background-color: #f2f2f2;
    display: flex;
    justify-content: center;
    align-items: center
}

.card {
    height: 500px;
    width: 350px;
    background-color: white;
    border-radius: 10px;
    padding: 20px 15px
}

.card hr {
    border-top: 1px solid #ccc;
    margin-bottom: 20px;
    margin-top: 10px
}

.card h3 {
    letter-spacing: 1px;
    font-size: 20px;
    font-weight: 900
}

.card-details {
    position: relative
}

.card-details input {
    width: 100%;
    height: 48px;
    padding: 0px 10px;
    box-sizing: border-box;
    border: 3px solid #ccc;
    outline: none;
    border-radius: 10px;
    caret-color: #3769D3;
    font-size: 16px;
    transition: all 1s
}

.card-details input:focus {
    border: 3px solid #3769D3
}

.card-details input:focus~span {
    color: #3769D3;
    font-weight: 900
}

.card-details input:focus~i {
    color: #3769D3
}

.card-details span {
    position: absolute;
    top: -10px;
    left: 15px;
    background-color: white;
    font-size: 14px;
    padding: 0px 5px;
    transition: all 1s
}

.card-details i {
    position: absolute;
    right: 10px;
    top: 15px;
    color: #ccc;
    z-index: 1000;
    transition: all 1s
}

.exp-cvv {
    margin-top: 25px;
    display: flex;
    flex: 0 50%;
    flex-direction: row;
    justify-content: space-between;
    gap: 5px;
     
}

.mt-25 {
    margin-top: 25px
}

.tick {
    display: flex;
    padding: 20px 10px;
    align-items: center
}

.tick span {
    height: 20px;
    width: 20px;
    border-radius: 50%;
    border: 3px solid blue;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 14px;
    cursor: pointer;
    color: #fff
}

.d-none {
    display: none
}

.tick p {
    margin-left: 15px;
    font-weight: 900;
    font-size: 18px
}

.p-blue {
    background-color: blue !important
}

.button {
    display: flex;
    justify-content: center;
    align-items: center
}

.button button {
    height: 60px;
    width: 100%;
    border-radius: 10px;
    background-color: blue;
    color: white;
    font-size: 18px;
    font-weight: 600;
    transition: all 0.5s;
    cursor: pointer;
    border: none
}

.button button:hover {
    background-color: #040481
}</style>
</head>
<body classname="snippet-body">
<form action="<%= request.getContextPath() %>/fattura?action=insertOrder" method="post">
<div class="container">
    <div class="card">
        <div class="top">
            <h3>Secure payment</h3>
            <p>Your card will not be saved</p>
            <hr>
        </div>
        <div class="card-details"> <input type="text" placeholder="0000 0000 0000 0000" data-slots="0" data-accept="\d" size="19" required> <span>Card Number</span> <i class="fa fa-credit-card"></i> </div>
        <div class="exp-cvv">
            <div class="card-details"> <input type="text" placeholder="mm/yyyy" data-slots="my" required> <span>Expiry date</span> <i class="fa fa-calendar"></i> </div>
            <div class="card-details"> <input type="text" placeholder="000" data-slots="0" data-accept="\d" size="3" required> <span>CVV</span> <i class="fa fa-info-circle"></i> </div>
        </div>
        <div class="card-details mt-25"> <input type="text" placeholder="Enter cardholder's full name" required> <span>Card Holder Name</span> </div>
        <div class="card-details mt-25"> <input type="text" placeholder="Enter City" required name="citta"> <span>City</span> </div>
        <div class="card-details mt-25"> <input type="text" placeholder="Enter Region" required name="provincia"> <span>Region</span> </div>
        <br>
        <div class="button"> <button value="Submit" type="submit">Pay</button> </div>
    </div>
</div>
</form>

<script type="text/javascript">
	var tick=document.querySelector(".tick span");
	var tick_mark=document.querySelector(".tick span i");
	tick.addEventListener('click',function(){
		tick.classList.toggle('p-blue');
		tick_mark.classList.toggle('d-none');
	});
	
	document.addEventListener('DOMContentLoaded', () => {
		for (const el of document.querySelectorAll("[placeholder][data-slots]")) {
			const pattern = el.getAttribute("placeholder"),
			slots = new Set(el.dataset.slots || "_"),
			prev = (j => Array.from(pattern, (c,i) => slots.has(c)? j=i+1: j))(0),
			first = [...pattern].findIndex(c => slots.has(c)),
			accept = new RegExp(el.dataset.accept || "\\d", "g"),
			clean = input => {
				input = input.match(accept) || [];
				return Array.from(pattern, c =>
				input[0] === c || slots.has(c) ? input.shift() || c : c
				);
			},
			format = () => {
				const [i, j] = [el.selectionStart, el.selectionEnd].map(i => {
					i = clean(el.value.slice(0, i)).findIndex(c => slots.has(c));
					return i<0? prev[prev.length-1]: back? prev[i-1] || first: i; 
				});
				el.value=clean(el.value).join``; el.setSelectionRange(i, j); back=false; }; 
			let back=false; el.addEventListener("keydown", (e)=> back = e.key === "Backspace");
		    el.addEventListener("input", format);
		    el.addEventListener("focus", format);
		    el.addEventListener("blur", () => el.value === pattern && (el.value=""));
	    }
    });
    </script>
</body></html>