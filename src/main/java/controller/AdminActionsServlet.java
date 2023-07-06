package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;

/**
 * Servlet implementation class AdminActionsServlet
 */
@WebServlet("/AdminActions")
public class AdminActionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static ProdottoDAO prodottodao = new ProdottoDAO();
	
    public AdminActionsServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getParameter("action");
		String link="/index.jsp";
		
		try {
			if (action.equalsIgnoreCase("deleteProduct")) {
				prodottodao.doDelete(request.getParameter("code"));
		        link="/adminPage.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(link);
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
