package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dao.ListaOrdiniDAO;
import dao.RecensioneDAO;

@WebServlet("/searchAdmin")
public class SearchAdminServlet extends HttpServlet {
	
	static UserDAO userdao = new UserDAO();
	static RecensioneDAO recensionedao = new RecensioneDAO();
	static ListaOrdiniDAO listaordinidao = new ListaOrdiniDAO();
	
	private static final long serialVersionUID = 1L;
       
    public SearchAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			request.removeAttribute("adminUsers");
			request.setAttribute("adminUsers", userdao.ricercaTuttiUtenti());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		try {
			request.removeAttribute("adminReviews");
			request.setAttribute("adminReviews", recensionedao.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		try {
			request.removeAttribute("adminOrders");
			request.setAttribute("adminOrders", listaordinidao.ricercaTuttiOrdini());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
		dispatcher.forward(request, response);
	}

}
