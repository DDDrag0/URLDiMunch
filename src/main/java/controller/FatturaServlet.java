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
		
		String action = request.getParameter("action");
		User user = (User) request.getSession().getAttribute("utente");
		String link="/index.jsp";
		
		try {
			if (action.equalsIgnoreCase("ricercaOrdine")) {
				String idOrdine= request.getParameter("idOrdine");
				String idUtente= user.getIdUtente();
		        ListaOrdini ordine = ordiniDAO.ricercaOrdine(idOrdine,idUtente);
		        if (ordine==null) {
		        	//nel caso si cerca di accedere ad un area riservata
		        	response.sendRedirect("./logIn.jsp");
		        }
		        request.setAttribute("fatturau", ordine);
		        link="/fattura.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(link);
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		User user = (User) request.getSession().getAttribute("utente");
		Carrello cart = (Carrello) request.getSession().getAttribute("cart");
		String link="/index.jsp";
		try {
			if (action.equalsIgnoreCase("ricercaTuttiOrdiniUtente")) {
		        Collection<ListaOrdini> ordini = ordiniDAO.ricercaTuttiOrdiniUtente(user);
		        request.setAttribute("ordini", ordini);
			}
			
			else if (action.equalsIgnoreCase("insertOrder")) {
				List<String> productIds = cart.getProductIds();
				String[] productIdsArray = productIds.toArray(new String[productIds.size()]);
				String idProdotti = String.join("&", productIdsArray);
				
				String prezzoStr = request.getParameter("prezzo");
			    double prezzo = Double.parseDouble(prezzoStr);
			    
				String indirizzo= user.getIndirizzoSpedizione();
				String idUtente= user.getIdUtente();
		        ordiniDAO.insertOrder(idUtente,idProdotti,prezzo,indirizzo, cart);
		    	request.getSession().removeAttribute("cart");
		    	link="/listaOrdini.jsp";
			}

			else if (action.equalsIgnoreCase("doDelete")) {
				String idOrdine= request.getParameter("idOrdine");
				ordiniDAO.doDelete(idOrdine);
		    	link="/listaOrdini.jsp";
			}
			
			else if (action.equalsIgnoreCase("ricercaTuttiOrdini")) {
				Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
				if ((adminRoles == null) || (!adminRoles.booleanValue()))
				{	
				    response.sendRedirect("./logIn.jsp");
				    return;
				}
		        Collection<ListaOrdini> ordini = ordiniDAO.ricercaTuttiOrdini();
		        request.setAttribute("ordini", ordini);
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(link);
			dispatcher.forward(request, response);
		}
		catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		} 
	}
}
