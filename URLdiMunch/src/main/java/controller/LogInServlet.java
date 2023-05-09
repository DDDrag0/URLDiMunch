package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.Carrello;
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
		String nome = request.getParameter("idutente");
        String password = request.getParameter("password");
        User user = new User();
        user.setIdUtente(nome);
        user.setPassword(password);

        try {
            if (loginDAO.validate(user)) {
                response.sendRedirect("DettagliUser.jsp");
                


        		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
        		if(cart == null) {
        			cart = new Carrello();
        			request.getSession().setAttribute("cart", cart);
        		}
                
                request.getSession().setAttribute("cart", cart);
        		request.setAttribute("cart", cart);
        		
            } else {
                response.sendRedirect("logIn.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
		doGet(request, response);
		}
	}
}
