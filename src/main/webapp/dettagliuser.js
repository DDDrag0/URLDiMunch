function Modulo() {
  // Variabili associate ai campi del modulo
  var nome = document.getElementById("a").value;
  var cognome = document.getElementById("b").value;
  var password = document.getElementById("g").value;
  var indirizzo_spedizione = document.getElementById("e").value;
  var indirizzo_fatturazione = document.getElementById("d").value;
  var telefono = parseInt(document.getElementById("c").value);
  var email = document.getElementById("f").value;
  var controllo = true;
  var numero = 0;
  var email_reg_exp = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-]{2,})+.)+([a-zA-Z0-9]{2,})+$/;
 
  // Effettua il controllo sui campi del modulo
 
  // Effettua il controllo sul campo NOME
  if ((nome == "") || (nome == "undefined")) {
    alert("Il campo Nome è obbligatorio.");
    document.getElementById(a).nome.focus();
    controllo=false;
    numero=1;
  }
  // Effettua il controllo sul campo COGNOME
  else if ((cognome == "") || (cognome == "undefined")) {
    alert("Il campo Cognome è obbligatorio.");
    document.getElementById(b).cognome.focus();
    controllo=false;
    numero=2;
  }
  // Effettua il controllo sul campo PASSWORD
  else if ((password == "") || (password == "undefined")) {
    alert("Il campo Password è obbligatorio.");
    document.getElementById(g).password.focus();
    controllo=false;
    numero=3;
  }
  // Effettua il controllo sul campo INDIRIZZO DI SPEDIZIONE
  else if ((indirizzo_spedizione == "") || (indirizzo_spedizione == "undefined")) {
    alert("Il campo Indirizzo di spedizione è obbligatorio.");
    document.getElementById(e).indirizzospedizione.focus();
    controllo=false;
    numero=4;
  }
  // Effettua il controllo sul campo INDIRIZZO DI FATTURAZIONE
  else if ((indirizzo_fatturazione == "") || (indirizzo_fatturazione == "undefined")) {
    alert("Il campo Indirizzo di fatturazione è obbligatorio.");
    document.getElementById(d).indirizzofatturazione.focus();
    controllo=false;
    numero=5;
  }
  // Effettua il controllo sul campo TELEFONO
  else if ((isNaN(telefono)) || (telefono == "") || (telefono == "undefined")) {
    alert("Il campo Telefono è numerico ed obbligatorio.");
    document.getElementById(c).telefono.focus();
    controllo=false;
    numero=6;
  }
  // Effettua il controllo sul campo EMAIL
  else if (!email_reg_exp.test(email) || (email == "") || (email == "undefined")) {
    alert("Inserire un indirizzo email corretto.");
    document.getElementById(f).email.select();
    controllo=false;
    numero=7;
  }
  // Tutti i controlli sono superati, il modulo è valido
  alert(numero);
    return controllo;
}