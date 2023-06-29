package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecensioneDAO;

@WebServlet("/reviewsAdmin")
public class ReviewsAdminServlet extends HttpServlet {
	static RecensioneDAO recensionedao = new RecensioneDAO();
	private static final long serialVersionUID = 1L;
       
    public ReviewsAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.removeAttribute("adminReviews");
            request.setAttribute("adminReviews", recensionedao.doRetrieveAll());
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