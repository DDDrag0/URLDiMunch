let $loginMsg = $('.loginMsg');
let $login = $('.login');
let $signupMsg = $('.signupMsg');
let $signup = $('.signup');
let $frontbox = $('.frontbox');

$('#switch1').on('click', function() {
  $loginMsg.addClass("moveRight");
  $frontbox.addClass("moving");
  document.getElementById("messaggio_rec").style.display="none";
  $signupMsg.toggleClass("visibility");
  
  $signup.toggleClass('hide');
  $login.toggleClass('hide');
});

$('#switch2').on('click', function() {
  $loginMsg.removeClass("moveRight");
  $frontbox.removeClass("moving");
  document.getElementById("messaggio_rec").style.display="block";
  $signupMsg.toggleClass("visibility");

  $signup.toggleClass('hide');
  $login.toggleClass('hide');
});
