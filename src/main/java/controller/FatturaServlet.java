package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ListaOrdiniDAO;
import model.Carrello;
import model.ListaOrdini;
import model.User;

@WebServlet("/fattura")
public class FatturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ListaOrdiniDAO ordiniDAO;

    public void init() {
    	ordiniDAO = new ListaOrdiniDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("entro nella servlet");
		String action = request.getParameter("action");
		User user = (User) request.getSession().getAttribute("utente");
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");

		try {
			if (action.equalsIgnoreCase("ricercaTuttiOrdiniUtente")) {
		        Collection<ListaOrdini> ordini = ordiniDAO.ricercaTuttiOrdiniUtente(user);
		        request.setAttribute("ordini", ordini);
			}
			
			else if (action.equalsIgnoreCase("insertOrder")) {
				List<String> productIds = cart.getProductIds();
				String[] productIdsArray = productIds.toArray(new String[productIds.size()]);
				String idProdotti = String.join("&", productIdsArray);
				
				String[] quantitaArray = request.getParameterValues("quantitaProdotto");
				int[] quantita = new int[quantitaArray.length];
				for (int i = 0; i < quantitaArray.length; i++) {
				    try {
				      quantita[i] = Integer.parseInt(quantitaArray[i]);
				    } catch (NumberFormatException e) {
				      quantita[i] = 0;
				    }
				  }
				
				String prezzoStr = request.getParameter("prezzo");
			    double prezzo = Double.parseDouble(prezzoStr);
			    
				String indirizzo= request.getParameter("indirizzo");
				
		        ordiniDAO.insertOrder(idProdotti,prezzo,quantita,indirizzo);
			}
			
			else if (action.equalsIgnoreCase("ricercaOrdine")) {
				String idOrdine= request.getParameter("idOrdine");
		        ListaOrdini ordine = ordiniDAO.ricercaOrdine(idOrdine);
		        request.setAttribute("ordini", ordine);
			}

			else if (action.equalsIgnoreCase("doDelete")) {
				String idOrdine= request.getParameter("idOrdine");
				ordiniDAO.doDelete(idOrdine);
			}
			
			else if (action.equalsIgnoreCase("ricercaTuttiOrdini")) {
		        Collection<ListaOrdini> ordini = ordiniDAO.ricercaTuttiOrdini();
		        request.setAttribute("ordini", ordini);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		} 
	}
}
