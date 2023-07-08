package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListaOrdiniDAO;
import dao.ProdottoDAO;
import dao.RecensioneDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AdminActionsServlet
 */
@WebServlet("/AdminActions")
public class AdminActionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoDAO prodottodao = new ProdottoDAO();
	static UserDAO userdao = new UserDAO();
	static ListaOrdiniDAO ordinedao = new ListaOrdiniDAO();
	static RecensioneDAO recensionedao = new RecensioneDAO();
	
    public AdminActionsServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action = request.getParameter("action");
		String link="/index.jsp";
		
		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./logIn.jsp");
		    return;
		}
		
		try {
			if (action.equalsIgnoreCase("deleteProduct")) {
				prodottodao.doDelete(request.getParameter("code"));
		        link="/adminPage.jsp";
			}
			else if (action.equalsIgnoreCase("taxchange")) {
				prodottodao.doChangeTax(request.getParameter("taxRate"));
		        link="/adminPage.jsp";
			}
			else if (action.equalsIgnoreCase("deleteOrder")) {
				ordinedao.doDelete(request.getParameter("code"));
		        link="/adminOrders.jsp";
			}
			else if (action.equalsIgnoreCase("deleteUser")) {
				userdao.doDelete(request.getParameter("code"));
		        link="/adminUsers.jsp";
			}
			else if (action.equalsIgnoreCase("adminUser")) {
				userdao.doAdmin(request.getParameter("code"));
		        link="/adminUsers.jsp";
			}
			else if (action.equalsIgnoreCase("deleteReview")) {
				recensionedao.doDelete(request.getParameter("code"));
		        link="/adminReview.jsp";
			}
			else if (action.equalsIgnoreCase("modifyQuant")) {
				prodottodao.modQuant(request.getParameter("quant"),request.getParameter("code"));
		        link="/SearchServlet?cerca="+request.getParameter("code");
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(link);
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			//System.out.println("Error:" + e.getMessage());
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
