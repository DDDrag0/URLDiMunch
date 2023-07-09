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
		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./access-denied.jsp");
		    return;
		}
		
		try {
			RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
			if (action.equalsIgnoreCase("deleteProduct")) {
				prodottodao.doDelete(request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/adminPage.jsp");
			}
			else if (action.equalsIgnoreCase("taxchange")) {
				prodottodao.doChangeTax(request.getParameter("taxRate"));
				dispatcher = request.getRequestDispatcher("admin/adminPage.jsp");
			}
			else if (action.equalsIgnoreCase("deleteOrder")) {
				ordinedao.doDelete(request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/adminOrders.jsp");
			}
			else if (action.equalsIgnoreCase("deleteUser")) {
				userdao.doDelete(request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/adminUsers.jsp");
			}
			else if (action.equalsIgnoreCase("adminUser")) {
				userdao.doAdmin(request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/adminUsers.jsp");
			}
			else if (action.equalsIgnoreCase("deleteReview")) {
				recensionedao.doDelete(request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/adminReview.jsp");
			}
			else if (action.equalsIgnoreCase("modifyQuant")) {
				prodottodao.modQuant(request.getParameter("quant"),request.getParameter("code"));
				dispatcher = request.getRequestDispatcher("admin/SearchServlet?cerca="+request.getParameter("code"));
			}
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
