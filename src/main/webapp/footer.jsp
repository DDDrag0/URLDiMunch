<!DOCTYPE html>
<html lang="it">
<head> 
<link href="./css/footer.css" rel="stylesheet" type="text/css">
<title>footer</title>
</head>
<body>
<div>

                <div class="newsletter" style="display: block;">
                <div class="holder">
                    <h3 style="color: black">Newsletter Sign up</h3>
                    <div class="newsletterWraper">
                        <div id="newsletterInfo">
                            <input name="email" placeholder="Enter your email" class="text" id="emailSubscription" type="text" maxlength="100" contactattributeid="3820038">
                            <input id="btSubscribe" type="submit" value="Submit">
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
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <img src="/media/redesign/img/logo_brand.svg?v=2" alt="logo" class="brand-logo-style">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true"></span>
                          </button>
                      </div>
                      <div class="modal-body">
                        <div id="newsletterForm">
                            <p>Get the latest news on the events, trends, and people that shape the global art market with our daily newsletter.</p>
                            <div class="form-inline">
                                <div class="form-group">
                                    <div></div>
                                    <input placeholder="ENTER YOUR EMAIL" class="form-control" id="emailModalSubscription" type="text" contactattributeid="3820038">
                                    <button type="submit" id="modalSubmit">SIGN UP</button>
                                </div>
                                <div id="newsletterModalValidation" class="error" style="display: none;">Please enter a valid email address</div>
                            </div>
                            <a href="/about/privacy-formal.asp" target="_blank">Privacy Policy</a>
                        </div>
                        <div id="newsletterConfirmation" style="display: none;">
                            <p>Thank you for subscribing!</p>
                            <a href="#" id="newsletterConfirmationClose" data-dismiss="modal">CLOSE</a>
                        </div>
                      </div>
                    </div>
                  </div>
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