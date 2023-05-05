<div class="footer">
                <div class="newsletter" style="display: block;">
                <div class="holder">
                    <h3>Newsletter Signup</h3>
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
                <!-- Newsletter Modal -->
                <div class="modal fade" style="display: none;" id="newsletterModal" tabindex="-1" role="dialog" aria-labelledby="newsletterModal">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <img src="/media/redesign/img/logo_brand.svg?v=2" class="brand-logo-style">
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
                <li><a href="about.html">About</a></li>
                <li><a href="contatti.html">Contact</a></li>
                <li><a href="jobs.html">Jobs</a></li>
                <li><a href="faq.html">FAQ</a></li>
            </ul>
            <ul class="links infoLinks">
                <li><a href="data:image/jpeg;base64,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">Terms</a></li>
                <li><a href="/about/privacy-formal.asp">Privacy</a></li>
            </ul>
            <p>©2023 URLdiMunch Worldwide Corporation. All rights reserved.</p>
</div>