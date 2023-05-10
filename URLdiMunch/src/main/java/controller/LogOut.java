package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		

    	request.getSession().removeAttribute("cart");
    	request.getSession().removeAttribute("utente");
		request.getSession().removeAttribute("adminRoles");
		request.getSession().invalidate();

		String redirectedPage = "/index.jsp";
		response.sendRedirect(request.getContextPath() + redirectedPage);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

	private static final long serialVersionUID = 1L;
    
    public LogOut() {
        super();
    }
	
}
