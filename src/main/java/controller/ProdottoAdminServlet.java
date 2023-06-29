package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdottoDAO;
import model.Prodotto;

@WebServlet("/prodottoAdmin")
public class ProdottoAdminServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idProdotto = request.getParameter("idProdotto");
		String nome = request.getParameter("nome");
		String artista = request.getParameter("artista");
		String tipo = request.getParameter("tipo");
		String epoca = request.getParameter("epoca");
		String dimensioni = request.getParameter("dimensioni");
		String descrizione = request.getParameter("descrizione");
		String Squantita = request.getParameter("quantita");
		String Sprezzo = request.getParameter("prezzo");
		String Siva = request.getParameter("iva");

		System.out.println(idProdotto);
		System.out.println(Squantita);
		System.out.println(Sprezzo);
		System.out.println(Siva);
		
		int quantita = Integer.parseInt(Squantita);
		double prezzo = Double.parseDouble(Sprezzo);
		double iva = Double.parseDouble(Siva);
		
		Prodotto product = new Prodotto();
		
		product.setIdProdotto(idProdotto);
		product.setNome(nome);
		product.setArtista(artista);
		product.setTipo(tipo);
		product.setEpoca(epoca);
		product.setDimensioni(dimensioni);
		product.setDescrizione(descrizione);
		product.setQuantita(quantita);
		product.setPrezzo(prezzo);
		product.setIva(iva);
		
		
		try {
			prodottodao.doSave(product);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//per fare nel caso la tabella
		try {
			request.removeAttribute("adminProducts");
			request.setAttribute("adminProducts", prodottodao.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
		dispatcher.forward(request, response);
	}

}
