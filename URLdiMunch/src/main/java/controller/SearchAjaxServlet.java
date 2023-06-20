package controller;

import com.google.gson.Gson;
import model.Prodotto;
import dao.ProdottoDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/SearchAjaxServlet")
public class SearchAjaxServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SearchAjaxServlet()
    {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("cerca");
        ProdottoDAO prod = new ProdottoDAO();
        ArrayList<Prodotto> a = new ArrayList<>();

        try {
           a = prod.ricercaProdottoNome(nome);
        } catch (SQLException e) {

        	//e.printStackTrace();	//sensitive
		}
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(convertListToJson(a));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private String convertListToJson(ArrayList<Prodotto> list) {
        return new Gson().toJson(list);
    }
}
