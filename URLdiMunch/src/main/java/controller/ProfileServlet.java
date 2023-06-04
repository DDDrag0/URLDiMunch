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

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAO registraDAO = new UserDAO();

    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/DettagliUser.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idUser = request.getParameter("idUser");
		String passw = request.getParameter("passw");
		String nome = request.getParameter("nome");
		String cognome = request.getParameter("cognome");
		String email = request.getParameter("email");
		String carta = request.getParameter("carta");
		String telefono = request.getParameter("telefono");
		String indFatt = request.getParameter("indFatt");
		String indSped = request.getParameter("indSped");
		
		User user = new User();
		
		user.setIdUtente(idUser);
        user.setPassword(passw);
        user.setNome(nome);
        user.setCognome(cognome);
        user.setEmail(email);
        user.setCarta(carta);
        user.setTelefono(telefono);
        user.setIndirizzoFatturazione(indFatt);
        user.setIndirizzoSpedizione(indSped);
		
		try {
			registraDAO.registerUser(user);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/logIn.jsp");
		dispatcher.forward(request, response);
	}

}
