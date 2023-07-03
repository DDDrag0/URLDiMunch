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
	
	private UserDAO profileDAO = new UserDAO();

    public ProfileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("./DettagliUser.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if(action.equals("mod")) {
			User user = (User) request.getSession().getAttribute("utente");
			String passw = request.getParameter("passw");
			String nome = request.getParameter("nome");
			String cognome = request.getParameter("cognome");
			String email = request.getParameter("email");
			String telefono = request.getParameter("telefono");
			String indFatt = request.getParameter("indFatt");
			String indSped = request.getParameter("indSped");
			
	        user.setPassword(passw);
	        user.setNome(nome);
	        user.setCognome(cognome);
	        user.setEmail(email);
	        user.setTelefono(telefono);
	        user.setIndirizzoFatturazione(indFatt);
	        user.setIndirizzoSpedizione(indSped);
			
			try {
				profileDAO.modUser(user);
			} catch (ClassNotFoundException e) {
				//e.printStackTrace();	//sensitive
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("./DettagliUser.jsp");
			dispatcher.forward(request, response);
		}
		
		else if (action.equals("paymeth")) {
			User user = (User) request.getSession().getAttribute("utente");
			String ccn = request.getParameter("ccn");
			
			user.setCarta(profileDAO.addCard(user, ccn));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("./DettagliUser.jsp");
			dispatcher.forward(request, response);
		}
	}
}
