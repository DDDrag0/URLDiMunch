package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProdottoDAO;
import model.Prodotto;
import model.ScriptImage;

@WebServlet("/prodottoAdmin")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB

public class ProdottoAdminServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	static ScriptImage script= new ScriptImage();
	String adminProducts = "adminProducts";
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./access-denied.jsp");
		    return;
		}
		try {
			request.removeAttribute(adminProducts);
			request.setAttribute(adminProducts, prodottodao.doRetrieveAll());
		} catch (SQLException e) {
			//System.out.println("Error:" + e.getMessage());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("img");
		String fileName = filePart.getSubmittedFileName();
		String uploadPath = getServletContext().getRealPath("/image/");
		//System.out.println(uploadPath);
		filePart.write(uploadPath + fileName);
		
		script.copy(uploadPath, fileName);
		
		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./access-denied.jsp");
		    return;
		}
		
		String nome = request.getParameter("nome");
		String artista = request.getParameter("artista");
		String tipo = request.getParameter("tipo");
		String epoca = request.getParameter("epoca");
		String dimensioni = request.getParameter("dimensioni");
		String descrizione = request.getParameter("descrizione");
		String squantita = request.getParameter("quantita");
		String sprezzo = request.getParameter("prezzo");
		String imagepath="/image/"+fileName;
		
		int quantita = Integer.parseInt(squantita);
		double prezzo = Double.parseDouble(sprezzo);
		
		Prodotto product = new Prodotto();
		
		product.setNome(nome);
		product.setArtista(artista);
		product.setTipo(tipo);
		product.setEpoca(epoca);
		product.setDimensioni(dimensioni);
		product.setDescrizione(descrizione);
		product.setQuantita(quantita);
		product.setPrezzo(prezzo);
		product.setImagepath(imagepath);
		
		
		try {
			prodottodao.doSave(product);
		} catch (SQLException e) {
			//e.printStackTrace();	//sensitive
		}
		//per fare nel caso la tabella
		try {
			request.removeAttribute(adminProducts);
			request.setAttribute(adminProducts, prodottodao.doRetrieveAll());
		} catch (SQLException e) {
			//System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminPage.jsp");
		dispatcher.forward(request, response);
	}

}
