<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.User"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

User user = (User) session.getAttribute("utente");
String login;
login=user.getIdUtente();

Collection<?> users = (Collection<?>) request.getAttribute("adminUsers");
if(users == null) {
	response.sendRedirect(request.getContextPath()+"/adminGestion?source=admin/adminUsers.jsp");	
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
	<script type="text/javascript">
		function searchUsers() {
		    var searchQuery = document.querySelector('.inputSearch').value.toLowerCase(); // Ottieni l'id utente
	
		    var userList = document.querySelectorAll('.table ul li'); // Seleziona tutti gli elementi della lista degli utenti
	
		    for (var i = 0; i < userList.length; i++) {
		        var user = userList[i];
		        var userId = user.querySelector('.cell-150').textContent.toLowerCase(); // Ottieni l'ID dell'utente corrente
	
		        if (userId.includes(searchQuery)) {
		            user.style.display = 'block'; // Mostra l'utente se corrisponde l'id utente di ricerca
		        } else {
		            user.style.display = 'none'; // Nascondi l'utente se non corrisponde l'id utente di ricerca
		        }
		    }
		}
		// Aggiungi un gestore di eventi al campo di input per la ricerca degli utenti
		var searchInput = document.querySelector('.inputSearch');
		searchInput.addEventListener('input', searchUsers);
	</script>
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
	            <li><a href="admin/adminPage.jsp"><span class="fa fa-table"></span>PRODUCT</a>
	            <li><a href="admin/adminOrders.jsp"><span class="fa fa-money"></span>ORDERS</a></li>
	            <li><a href="admin/adminUsers.jsp"><span class="fa fa-user-o"></span>USER</a></li>
	            <li><a href="admin/adminReview.jsp"><span class="fa fa-envelope-o"></span>REVIEWS</a></li>
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
                    <li><a href="./index.jsp">View website</a></li>
                    <li><a href="<%=request.getContextPath()%>/LogOut">Log out<span class="fa fa-sign-out fr"></span></a></li>
                </ul>
            </div>
        </nav>
        <!-- END NAV -->
        <!-- CONTAINER  -->
        <div class="mainContent"> 
        
        <!-- SEARCH FILTER PANEL  -->
        <div class="row filterGroup">
		    <input type="text" class="inputSearch" placeholder="Search" name="searchQuery">
		    <button type="submit" class="btnSearch"><i class="fa fa-search"></i></button>
		</div>
			<!-- LIST FORM -->
			<form action="" method="GET" name="listForm" class="form scrollX">
			    <div class="formHeader row">
			        <h2 class="text-1 fl">User List</h2>
			        <div class="fr">
			        </div>
			    </div>
			    <div class="table">
			        <div class="row bg-1">
			            <div class="cell cell-150 text-center text-fff">ID</div>
			            <div class="cell cell-150 text-center text-fff">NAME</div>
			            <div class="cell cell-150 text-center text-fff">SURNAME</div>
			            <div class="cell cell-100p text-center text-fff">ADMIN PERMS</div>
			            <div class="cell cell-100 text-center text-fff">EDIT</div>
			        </div>
			    <!--   BEGIN LOOP -->
			        <ul>
						<%
						if (users != null && users.size() != 0) {
						    Iterator<?> it = users.iterator();
						    String searchQuery = request.getParameter("searchQuery"); // Ottieni la query di ricerca dalla richiesta
						
						    while (it.hasNext()) {
						        User bean = (User) it.next();
						        String userId = bean.getIdUtente();
						
						        // Verifica se l'ID dell'utente corrente corrisponde alla query di ricerca
						        if (searchQuery != null && !searchQuery.isEmpty() && !userId.contains(searchQuery)) {
						            continue; // Passa all'iterazione successiva del loop se l'utente non corrisponde alla query
						        }
						%>
			            <li class="row">
			                <div class="cell cell-150 text-center"><%= bean.getIdUtente() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getNome() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getCognome() %></div>
			                <div class="cell cell-100p text-center"><%= bean.getAmministratore() %></div>
			                <div class="cell cell-100 text-center">
			                <% if (!bean.getIdUtente().equals(login)){%>			                    
			                	<a href="<%=request.getContextPath()%>/AdminActions?action=adminUser&code=<%= bean.getIdUtente() %>" class="btnEdit fa fa-pencil bg-1 text-fff" onclick="return confirm(&quot;Do you really want to give administration perms?&quot;)"></a>
			                    <a href="<%=request.getContextPath()%>/AdminActions?action=deleteUser&code=<%= bean.getIdUtente() %>" class="btnRemove fa fa-remove bg-1 text-fff" onclick="return confirm(&quot;Do you really want to remove it?&quot;)"></a>
			                <% }%>
			                </div>
			            </li>
			            <%	}
							} else {
						%>
							<a>No Users available</a>
						<%
							}
						%>
			        </ul>
			    <!--   END LOOP -->
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