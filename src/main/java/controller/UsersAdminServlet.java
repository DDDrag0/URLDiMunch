package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

@WebServlet("/usersAdmin")
public class UsersAdminServlet extends HttpServlet {
	static UserDAO userdao = new UserDAO();
	private static final long serialVersionUID = 1L;
       
    public UsersAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
            request.removeAttribute("adminUsers");
            request.setAttribute("adminUsers", userdao.ricercaTuttiUtenti());
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}