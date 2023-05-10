package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

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
		
		//HttpSession session = request.getSession();
		request.getSession().removeAttribute("cart");
    	request.getSession().removeAttribute("utente");
		request.getSession().removeAttribute("adminRoles");
		request.getSession().invalidate();
		
		String idutente = request.getParameter("idutente");
        String password = request.getParameter("password");
        User user = new User();
        user.setIdUtente(idutente);
        user.setPassword(password);
        String redirectedPage;
        try {
        	
            if (loginDAO.validate(user)) {
            	user= loginDAO.ricercaUser(idutente);
            	request.getSession().setAttribute("utente", user);
            	if(loginDAO.checkAdmin(idutente)) {
    				request.getSession().setAttribute("adminRoles", new Boolean(true)); //da cancellare dopo
            	}
            	else {
    				request.getSession().setAttribute("adminRoles", new Boolean(false));
            	}
				redirectedPage = "/DettagliUser.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            } else {
            	request.getSession().setAttribute("utente", null);
				request.getSession().setAttribute("adminRoles", new Boolean(false));
				redirectedPage = "/logIn.jsp";
				response.sendRedirect(request.getContextPath() + redirectedPage);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
