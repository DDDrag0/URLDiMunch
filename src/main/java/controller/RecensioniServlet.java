package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RecensioneDAO;
import model.Recensione;

@WebServlet("/recensioni")
public class RecensioniServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private RecensioneDAO recensioneDAO;
    private String idprodotto = "idProdotto";

    public void init() {
        recensioneDAO = new RecensioneDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.getWriter().append("Served at: ").append(request.getContextPath());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detailsSearch.jsp");
		dispatcher.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		//System.out.println(action);
		
		try {
			if (action.equalsIgnoreCase("doRetrieveAll")) {
				Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
				if ((adminRoles == null) || (!adminRoles.booleanValue()))
				{	
				    response.sendRedirect("./logIn.jsp");
				    return;
				}
		        Collection<Recensione> recensioni = recensioneDAO.doRetrieveAll();
		        request.setAttribute("recensioni", recensioni);
			}
			
			else if (action.equalsIgnoreCase("doRetrieveByProduct")) {
		        String idProdotto = request.getParameter(idprodotto);
		        Collection<Recensione> recensioni = recensioneDAO.doRetrieveByProduct(idProdotto);
		        request.setAttribute("recensioni", recensioni);
			}
			
			else if (action.equalsIgnoreCase("doSave")) {
			    String idProdotto = request.getParameter(idprodotto);
			    String idUtente = request.getParameter("idUtente");
			    String recensione = request.getParameter("recensione");

			    Recensione nuovaRecensione = new Recensione();
			    nuovaRecensione.setIdProdotto(idProdotto);
			    nuovaRecensione.setIdUtente(idUtente);
			    nuovaRecensione.setRecensione(recensione);

			    recensioneDAO.doSave(nuovaRecensione);
			    
			}
			
			else if (action.equalsIgnoreCase("doDelete")) {
				String idRecensione = request.getParameter("idRecensione");

			    try {
			        // Chiamata al metodo doDelete del RecensioneDAO
			        boolean result = recensioneDAO.doDelete(idRecensione);

			        if (!result) {
			            // Errore nell'eliminazione della recensione
			            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore durante l'eliminazione della recensione.");
			        }
			    } catch (SQLException e) {
					//e.printStackTrace();	//sensitive
			    }
			}
			
			else if (action.equalsIgnoreCase("modRecensione")) {
				String idUser = request.getParameter("idUtente");
				String idProdotto = request.getParameter(idprodotto);
			    String nuovaRecensione = request.getParameter("recensione");
			    
			    Recensione recensione = recensioneDAO.doRetrieveByProdUser(idUser, idProdotto);

		        if (recensione != null) {
		        	
		            recensione.setRecensione(nuovaRecensione);

		            int result = recensioneDAO.modRecensione(recensione);

		            if (result <= 0) {
		                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore durante la modifica della recensione.");
		            }
		        } else {
		            // Recensione non trovata
		            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Recensione non trovata.");
		        }
			}			
		}
		catch (SQLException e) {
			//System.out.println("Error:" + e.getMessage());
		} catch (ClassNotFoundException e) {
			//e.printStackTrace();	//sensitive
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/detailsSearch.jsp");
		dispatcher.forward(request, response);
    }
}
