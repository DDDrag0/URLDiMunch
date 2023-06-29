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

@WebServlet("/usersAdmin")
public class OrdersAdminServlet extends HttpServlet {
	
	static ListaOrdiniDAO listaordinidao = new ListaOrdiniDAO();
	
	private static final long serialVersionUID = 1L;
       
    public OrdersAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        try {
            request.removeAttribute("adminOrders");
            request.setAttribute("adminOrders", listaordinidao.ricercaTuttiOrdini());
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminUsers.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
