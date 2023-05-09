package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/login")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserDAO loginDAO;
	
	public void init() {
        loginDAO = new UserDAO();
    }

    public LogInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String nome = request.getParameter("idutente");
        String password = request.getParameter("password");
        User user = new User();
        user.setIdUtente(nome);
        user.setPassword(password);
        
		

        try {
        	
            if (loginDAO.validate(user)) {

        		session.setAttribute("utente", user);
            	
                response.sendRedirect("DettagliUser.jsp");
       		
            } else {
                response.sendRedirect("logIn.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
		doGet(request, response);
		}
	}
}
