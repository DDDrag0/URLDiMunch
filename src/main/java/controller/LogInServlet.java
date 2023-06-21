package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//prese dalla logOut
		String utente="utente";
		String admin="adminRoles";
    	request.getSession().removeAttribute(utente);
		request.getSession().removeAttribute(admin);
		//prese dalla logOut
		
		String idutente = request.getParameter("idutente");
        String password = request.getParameter("password");
        User user = new User();
        user.setIdUtente(idutente);
        user.setPassword(password);
        String redirectedPage;
        try {
        	
            if (loginDAO.validate(user)) {
            	user= loginDAO.ricercaUser(idutente);
            	request.getSession().setAttribute(utente, user);
            	if(loginDAO.checkAdmin(idutente)) {
    				request.getSession().setAttribute(admin, Boolean.valueOf(true));
            	}
            	else {
    				request.getSession().setAttribute(admin, Boolean.valueOf(false));
            	}
				redirectedPage = "/DettagliUser.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            } else {
            	request.getSession().setAttribute(utente, null);
				request.getSession().setAttribute(admin, Boolean.valueOf(false));
				redirectedPage = "/logIn.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            }
        } catch (ClassNotFoundException | SQLException e) {
            //e.printStackTrace();	//sensitive
		}
	}
}
