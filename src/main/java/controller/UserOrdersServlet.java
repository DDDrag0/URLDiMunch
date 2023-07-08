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
import model.User;

@WebServlet("/userOrders")
public class UserOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static ListaOrdiniDAO listaordinidao = new ListaOrdiniDAO();
	
    public UserOrdersServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("utente");
		try {
            request.removeAttribute("orders");
            request.setAttribute("orders", listaordinidao.ricercaTuttiOrdiniUtente(user));
        } catch (SQLException e) {
            //System.out.println("Error:" + e.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/listaOrdini.jsp");
        dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}