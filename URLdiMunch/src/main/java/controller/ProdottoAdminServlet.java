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
import model.Prodotto;

@WebServlet("/prodottoAdmin")
public class ProdottoAdminServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Carrello cart = (Carrello)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Carrello();
			request.getSession().setAttribute("cart", cart);
		}
		
		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					String id = request.getParameter("id");
					cart.addProduct(prodottodao.doRetrieveByKey(id));
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("deleteC")) {
					String id = request.getParameter("id");
					cart.deleteProduct(prodottodao.doRetrieveByKey(id));
					request.setAttribute("cart", cart);
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/carrello.jsp");
					dispatcher.forward(request, response);
				} else if (action.equalsIgnoreCase("read")) {
					String id = request.getParameter("id");
					request.removeAttribute("product");
					request.setAttribute("product", prodottodao.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("delete")) {
					String id = request.getParameter("id");
					prodottodao.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {
					String name = request.getParameter("name");
					String description = request.getParameter("description");
					int price = Integer.parseInt(request.getParameter("price"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					
					
					//response.sendRedirect("carrello.jsp");	perchè?
					Prodotto prodotto = new Prodotto();
					prodotto.setNome(name);
					prodotto.setDescrizione(description);
					prodotto.setPrezzo(price);
					prodotto.setQuantità(quantity);
					prodottodao.doSave(prodotto);
				}
			}			
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		request.getSession().setAttribute("cart", cart);
		request.setAttribute("cart", cart);
		
		
		String sort = request.getParameter("sort");

		try {
			request.removeAttribute("products");
			request.setAttribute("products", prodottodao.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/prodottiAdmin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
