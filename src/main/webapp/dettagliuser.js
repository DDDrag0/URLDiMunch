function Modulo() {
  // Variabili associate ai campi del modulo
  var nome = document.getElementById().value;
  var cognome = document.getElementById().value;
  var password = document.getElementById().value;
  var indirizzo_spedizione = document.getElementById().value;
  var indirizzo_fatturazione = document.getElementById().value;
  var telefono = document.getElementById().value; //parseInt
  var email = document.getElementById().value;

  var email_reg_exp = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-]{2,})+.)+([a-zA-Z0-9]{2,})+$/;
 
 
  // Effettua il controllo sul campo NOME
  if ((nome == "") || (nome == "undefined")) {
    alert("Il campo Nome è obbligatorio.");
    document.getElementById().nome.focus();
    
  }
  // Effettua il controllo sul campo COGNOME
  else if ((cognome == "") || (cognome == "undefined")) {
    alert("Il campo Cognome è obbligatorio.");
    document.getElementById().cognome.focus();

  }
  // Effettua il controllo sul campo PASSWORD
  else if ((password == "") || (password == "undefined")) {
    alert("Il campo Password è obbligatorio.");
    document.getElementById().password.focus();

  }
  // Effettua il controllo sul campo INDIRIZZO DI SPEDIZIONE
  else if ((indirizzo_spedizione == "") || (indirizzo_spedizione == "undefined")) {
    alert("Il campo Indirizzo di spedizione è obbligatorio.");
    document.getElementById().indirizzospedizione.focus();
    //controllo=false;
    //numero=4;
  }
  // Effettua il controllo sul campo INDIRIZZO DI FATTURAZIONE
  else if ((indirizzo_fatturazione == "") || (indirizzo_fatturazione == "undefined")) {
    alert("Il campo Indirizzo di fatturazione è obbligatorio.");
    document.getElementById().indirizzofatturazione.focus();

  }
  // Effettua il controllo sul campo TELEFONO
  else if ((isNaN(telefono)) || (telefono == "") || (telefono == "undefined")) {
    alert("Il campo Telefono è numerico ed obbligatorio.");
    document.getElementById().telefono.focus();

  }
  // Effettua il controllo sul campo EMAIL
  else if (!email_reg_exp.test(email) || (email == "") || (email == "undefined")) {
    alert("Inserire un indirizzo email corretto.");
    document.getElementById().email.select();

  }
  // Tutti i controlli sono superati, il modulo è valido
  //alert(numero);
   // return controllo;
}
function mod() {
  if (Modulo()) {
    window.location.href = "http://localhost:8080/URLdiMunch/carrello.jsp";
  } else {
    alert("Errore");
  }
}