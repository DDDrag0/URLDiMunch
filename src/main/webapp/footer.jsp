<!DOCTYPE html>
<html lang="it">
<head>
    <link href="./css/footer.css" rel="stylesheet" type="text/css">
    <title>footer</title>
    <script>
        function subscribe() {
            var emailInput = document.getElementById('emailSubscription');
            var errorMessage = document.getElementById('newsletterValidation');
            var successMessage = document.getElementById('dNewsLetterSuccess');

            // Controlla se l'indirizzo email è valido
            var email = emailInput.value;
            if (!validateEmail(email)) {
                errorMessage.style.display = 'block';
                successMessage.style.display = 'none';
                return;
            }

            // Effettua l'azione di sottoscrizione

            // Mostra il messaggio di successo
            errorMessage.style.display = 'none';
            successMessage.style.display = 'block';
            emailInput.value = '';
        }

        function validateEmail(email) {
            // Esegue la validazione dell'indirizzo email (puoi usare una regex o una libreria di validazione dell'email)
            // Restituisce true se l'email è valida, altrimenti false
            // ...

            return true;
        }
    </script>
</head>
<body>
<div>
    <div class="newsletter" style="display: block;">
        <div class="holder">
            <h3 style="color: black">Newsletter Sign up</h3>
            <div class="newsletterWraper">
                <div id="newsletterInfo">
                    <input name="email" placeholder="Enter your email" class="text" id="emailSubscription" type="text" maxlength="100" contactattributeid="3820038">
                    <input id="btSubscribe" type="submit" value="Submit" onclick="subscribe()">
                </div>
            </div>
            <div style="display: none;" id="newsletterValidation">
                <div class="invalid-email">Please enter a valid email address.</div>
            </div>
            <div style="display: none;" id="dNewsLetterSuccess">
                <div class="success-newsletter">Thank you for subscribing!</div>
            </div>
        </div>
    </div>
    <div class="modal fade" style="display: none;" id="newsletterModal" tabindex="-1" role="dialog" aria-labelledby="newsletterModal">
    </div>
    <ul class="links infoLinks">
        <li><a href="./static/about.html">About</a></li>
        <li><a href="./static/contatti.html">Contact</a></li>
        <li><a href="./static/jobs.html">Jobs</a></li>
        <li><a href="./static/faq.html">FAQ</a></li>
    </ul>
    <ul class="links infoLinks">
        <li><a href="./static/terms.html">Terms</a></li>
        <li><a href="./static/privacy.html">Privacy</a></li>
    </ul>
    <p>©2023 URLdiMunch Worldwide Corporation. All rights reserved.</p>
</div>
</body>
</html>
