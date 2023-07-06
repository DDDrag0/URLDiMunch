<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.User"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
// Check user credentials
Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
if ((adminRoles == null) || (!adminRoles.booleanValue()))
{	
    response.sendRedirect("logIn.jsp");
    return;
}

User user = (User) session.getAttribute("utente");
String login;
login=user.getIdUtente();

Collection<?> users = (Collection<?>) request.getAttribute("adminUsers");
if(users == null) {
	response.sendRedirect("./adminGestion?source=adminUsers.jsp");	
	return;
}
%>
<!DOCTYPE html>
<html lang="it">
<head>
	<title>URLDiMunchAdmin</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.css">
	<link rel="stylesheet" href="./css/admin.css" type="text/css">
</head>

<body translate="no">
	<div class="container">
	<!--     SIDE AREA -->
	    <div class="sideArea">
			<div class="avatar">
	            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCNOdyoIXDDBztO_GC8MFLmG_p6lZ2lTDh1ZnxSDawl1TZY_Zw" alt="">
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
        
        <!-- SEARCH FILTER PANEL  -->
		<div class="row filterGroup">
		    <form action="" method="POST" class="formSearch fl">
		        <input type="text" class="inputSearch" placeholder="Search">
		        <button type="submit" class="btnSearch"><i class="fa fa-search"></i></button>
		    </form>
		</div> 
			<!-- LIST FORM -->
			<form action="" method="GET" name="listForm" class="form scrollX">
			    <div class="formHeader row">
			        <h2 class="text-1 fl">User List</h2>
			        <div class="fr">
			          <button type="submit" class="btnSave bg-1 text-fff text-bold fr">SAVE</button><a href="" class="btnAdd fa fa-plus bg-1 text-fff"></a>
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
							while (it.hasNext()) {
								User bean = (User) it.next();
						%>
			            <li class="row">
			                <div class="cell cell-150 text-center"><%= bean.getIdUtente() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getNome() %></div>
			                <div class="cell cell-150 text-center"><%= bean.getCognome() %></div>
			                <div class="cell cell-100p text-center"><%= bean.getAmministratore() %></div>
			                <div class="cell cell-100 text-center">
			                <% if (!bean.getIdUtente().equals(login)){%>
			                    <a href="" class="btnEdit fa fa-pencil bg-1 text-fff" onclick="return confirm(&quot;Do you really want to give administration perms?&quot;)"></a>
			                    <a href="" class="btnRemove fa fa-remove bg-1 text-fff" onclick="return confirm(&quot;Do you really want to remove it?&quot;)"></a>
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
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/noUiSlider/10.1.0/nouislider.js"></script>
  
      <script id="rendered-js" src="./js/admin.js"></script>
</body>
</html>