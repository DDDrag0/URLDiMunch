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
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String nome = request.getParameter("idutente");
        String password = request.getParameter("password");
        User user = new User();
        user.setIdUtente(nome);
        user.setPassword(password);
        String redirectedPage;
        try {
        	
            if (loginDAO.validate(user)) {
        		session.setAttribute("utente", user);
				request.getSession().setAttribute("adminRoles", new Boolean(true));
				redirectedPage = "/DettagliUser.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            } else {
				request.getSession().setAttribute("adminRoles", new Boolean(false));
				redirectedPage = "/logIn.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
		}
	}
}
