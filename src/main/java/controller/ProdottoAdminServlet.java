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
import model.Prodotto;

@WebServlet("/prodottoAdmin")
public class ProdottoAdminServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logIn.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idutente = request.getParameter("idutente");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		Prodotto product = new Prodotto();
		
		
		
		try {
			prodottodao.doSave(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logIn.jsp");
		dispatcher.forward(request, response);
	}

}
