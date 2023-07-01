package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Carrello;
import dao.ProdottoDAO;

@WebServlet("/prodottoCliente")
public class ProdottoClienteServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoClienteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");
		String link="/prodottiCliente.jsp";

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					String id = request.getParameter("id");
					String quantS = request.getParameter("quantity");
					int quant = Integer.parseInt(quantS);
					if(cart.prodExist(id)) {
						cart.updateProduct(quant, id);
					}else {
						cart.addProduct(prodottodao.doRetrieveByKey(id),quant);
						request.setAttribute("cart", cart);
						link="/prodottiCliente.jsp";
					}
				} 
				
				else if (action.equalsIgnoreCase("deleteC")) {
					String id = request.getParameter("id");
					cart.deleteProduct(prodottodao.doRetrieveByKey(id));
					request.setAttribute("cart", cart);
					link="/carrello.jsp";
				} 
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		try {
			request.removeAttribute("products");
			request.setAttribute("products", prodottodao.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(link);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
