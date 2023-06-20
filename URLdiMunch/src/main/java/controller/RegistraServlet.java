package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet("/register")
public class RegistraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAO registraDAO = new UserDAO();

    public RegistraServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/userRegistrazione.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idutente = request.getParameter("idutente");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		User user = new User();
		
		user.setIdUtente(idutente);
        user.setPassword(password);
        user.setEmail(email);
		
		try {
			registraDAO.registerUser(user);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/logIn.jsp");
		dispatcher.forward(request, response);
	}

}
