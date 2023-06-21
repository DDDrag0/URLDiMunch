package controller;

import model.Prodotto;
import dao.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchServlet()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("cerca");
        ProdottoDAO prod = new ProdottoDAO();
        Prodotto opera = new Prodotto();
		request.getSession().removeAttribute("prodottoDettagli");

        try {
        	opera = prod.doRetrieveByKey(nome);
        } catch (SQLException e) {

        	//e.printStackTrace();	//sensitive
		}
        
    	request.getSession().setAttribute("prodottoDettagli", opera);
        
        System.out.println("Servlet");
        System.out.println(opera);
        
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detailsSearch.jsp");
		dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
