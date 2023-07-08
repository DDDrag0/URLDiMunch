<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession, java.util.*, model.User, model.Prodotto" %>
<%
// Check user credentials
Boolean adminRoles0 = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles0 == null) || (!adminRoles0.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}

User user = (User) session.getAttribute("utente");
String login;
login=user.getIdUtente();

Collection<?> products = (Collection<?>) request.getAttribute("adminProducts");
if(products == null) {
	response.sendRedirect("./prodottoAdmin");	
	return;
}
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>URLDiMunchAdmin</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="./css/lib/noUiSlider.css">
	<link rel="stylesheet" href="./css/admin.css" type="text/css">
</head>

<body translate="no">
	<div class="container">
	<!--     SIDE AREA -->
	    <div class="sideArea">
			<div class="avatar">
	            <img src="./image/revpic.jpg" alt="">
	            <div class="avatarName">Welcome,<br><%= login %></div>
	        </div>
	        <ul class="sideMenu">
	            <li><a href="adminPage.jsp"><span class="fa fa-table"></span>PRODUCT</a>
	            <li><a href="adminOrders.jsp"><span class="fa fa-money"></span>ORDERS</a></li>
	            <li><a href="adminUsers.jsp"><span class="fa fa-user-o"></span>USER</a></li>
	            <li><a href="adminReview.jsp"><span class="fa fa-envelope-o"></span>REVIEWS</a></li>
	        </ul>
	    </div>
<!--     SIDE AREA -->
    <div class="mainArea">
        <!-- BEGIN NAV -->
        <nav class="navTop row">
            <div class="menuIcon fl"><span class="fa fa-bars"></span></div>
            <div class="account fr">
                <div class="name has-submenu"><%= login %><span class="fa fa-angle-down"></span></div>
                <ul class="accountLinks submenu">
                    <li><a href="index.jsp">View website</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogOut">Log out<span class="fa fa-sign-out fr"></span></a></li>
                </ul>
            </div>
        </nav>
        <!-- END NAV -->
        <!-- CONTAINER  -->
        <div class="mainContent">  
			<!-- LIST FORM -->
			    <div class="formHeader row">
			        <h2 class="text-1 fl">Product List</h2>
			        <div class="fr">
			        <form action="<%=request.getContextPath()%>/AdminActions" method="GET">
						<span>TaxRate:</span><input required type="text" name="taxRate" style="width: 50px" pattern="[0-9]{2}">
						<input type="hidden" name="action" value="taxchange">
						<button class="btnAdd fa fa-plus bg-1 text-fff" onclick="return confirm(&quot;Do you want to change the taxes?&quot;)"></button>
			        </form>
			        </div>
			    </div>
			    <div class="table">
			        <div class="row bg-1">
			            <div class="cell cell-150 text-center text-fff">ID</div>
			            <div class="cell cell-150 text-center text-fff">PRODUCT</div>
			            <div class="cell cell-150 text-center text-fff">QUANTITY</div>
			            <div class="cell cell-250 text-center text-fff">PRICE</div>
			            <div class="cell cell-100p text-center text-fff"></div>
			            <div class="cell cell-100 text-center text-fff">EDIT</div>
			        </div>
			    <!--   BEGIN LOOP -->
			        <ul>
						<%
						if (products != null && products.size() != 0) {
							Iterator<?> it = products.iterator();
							while (it.hasNext()) {
								Prodotto bean = (Prodotto) it.next();
						%>
			            <li class="row">
			                <div class="cell cell-150 text-center"><%= bean.getIdProdotto() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getNome() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getQuantita() %></div>
			                <div class="cell cell-250 text-center"><%= bean.getPrezzo() %>$</div>
			                <div class="cell cell-100p text-center"></div>
			                <div class="cell cell-100 text-center">
			                    <a href="SearchServlet?cerca=<%= bean.getIdProdotto() %>" class="btnEdit fa fa-eye bg-1 text-fff"></a>
			                    <a href="AdminActions?action=deleteProduct&code=<%= bean.getIdProdotto() %>" class="btnRemove fa fa-remove bg-1 text-fff" onclick="return confirm(&quot;Do you really want to remove it?&quot;)"></a>
			                </div>
			            </li>
			            <%	}
							} else {
						%>
							<a>No Product available</a>
						<%
							}
						%>
			        </ul>
			    <!--   END LOOP -->
			    </div>
			<!-- INSERTION FORM -->
			
			<form action="<%=request.getContextPath()%>/prodottoAdmin" enctype='multipart/form-data' method="POST" class="form">
			    <div class="formHeader row">
			        <h2 class="text-1 fl">Product Detail</h2>
			        <div class="fr">
			            <button type="submit" class="btnSave bg-1 text-fff text-bold fr">SAVE</button>
			        </div>
			    </div>
			    <div class="formBody row">
			        <div class="column s-6">
			            <label class="inputGroup">
			                <span>Name</span>
			                <span><input type="text" title="at least 5 characters" name="nome" pattern="^[a-zA-Z\d\.\s,-]{5,45}$" required></span>
			            </label>
			            <label class="inputGroup">
			                <span>Artist</span>
			                <span><input type="text" title="at least 5 characters" name="artista" pattern="^[a-zA-Z\d\.\s,-]{5,45}$" required></span>
			            </label>
			            <label class="inputGroup">
			                <span>Price</span>
			                <span><input type="number" title="only numbers" name="prezzo" pattern="[0-9]*" required></span>
			            </label>
			            <label class="inputGroup">
			                <span>Quantity</span>
			                <span><input type="number" title="only numbers" name="quantita" pattern="[0-9]*" required></span>
			            </label>
			        </div>
			        
			        <div class="column s-6">
			            <label class="inputGroup">
			                <span>Dimensions</span>
			                <span>
			                    <select name="dimensioni">
			                        <option value="40cm x 40cm">40cm x 40cm</option>
			                        <option value="60cm x 40cm">60cm x 40cm</option>
			                        <option value="40cm x 60cm">40cm x 60cm</option>
			                        <option value="70cm x 70cm">70cm x 70cm</option>
			                        <option value="100cm x 70cm">100cm x 70cm</option>
			                        <option value="70cm x 100cm">70cm x 100cm</option>
			                    </select>
			                </span>
			            </label>
			            <label class="inputGroup">
			                <span>Category</span>
			                <span>
			                    <select name="tipo">
			                        <option value="Painting">Painting</option>
			                        <option value="Statue">Statue</option>
			                        <option value="Carpet">Carpet</option>
			                    </select>
			                </span>
			            </label>
			            <label class="inputGroup">
			                <span>Age</span>
			                <span>
			                    <select name="epoca">
			                        <option value="before 1500">before 1500</option>
			                        <option value="1500-1600">1500-1600</option>
			                        <option value="1600-1700">1600-1700</option>
			                        <option value="1700-1800">1700-1800</option>
			                        <option value="1800-1900">1800-1900</option>
			                        <option value="1900-2000">1900-2000</option>
			                        <option value="modern">modern</option>
			                    </select>
			                </span>
			            </label>
			            <label class="inputGroup">
			                <span>Image</span>
			                <span>
			                    <input type="file" name="img" >
			                </span>
			                
			            </label>
			        </div>
			      <div class="column">
			          <label class="inputGroup">
			              <span>Description</span>
			              <textarea name="descrizione" maxlength="1000" required></textarea>
			          </label>
			      </div>
			    </div>
			</form>  
        </div>
        <!-- END CONTAINER  -->
	    </div>
	</div>
	<script src="./js/lib/nouislider.js"></script>
	<script src="./js/lib/stopExecutionOnTimeout.js"></script>
	<script id="rendered-js" src="./js/admin.js"></script>
</body>
</html>