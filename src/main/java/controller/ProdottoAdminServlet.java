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

@WebServlet("/prodottoAdmin")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB

public class ProdottoAdminServlet extends HttpServlet {
	
	static ProdottoDAO prodottodao = new ProdottoDAO();
	
	private static final long serialVersionUID = 1L;
       
    public ProdottoAdminServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./logIn.jsp");
		    return;
		}
		try {
			request.removeAttribute("adminProducts");
			request.setAttribute("adminProducts", prodottodao.doRetrieveAll());
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/adminPage.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part filePart = request.getPart("img");
		String fileName = filePart.getSubmittedFileName();
		System.out.println(fileName);
		// questa è quella da mettere prima dell'esame, dato che di base non funziona
		//String uploadPath = getServletContext().getRealPath("/image");
		// questa è quella da cambiare, fai tasto destro sulla cartella image del progetto, dovrebbe esserci: show in.../system explorer, e prendi il path della cartella image del tuo pc, che bellezza.
		String uploadPath="C:\\Users\\"/*qua inserisci il nome del tuo pc*/+"\\git\\URLDiMunch\\src\\main\\webapp\\image";
		System.out.println(uploadPath);
		filePart.write(uploadPath + fileName);
		
		Boolean adminRoles = (Boolean) request.getSession().getAttribute("adminRoles");
		if ((adminRoles == null) || (!adminRoles.booleanValue()))
		{	
		    response.sendRedirect("./logIn.jsp");
		    return;
		}
		
		String nome = request.getParameter("nome");
		String artista = request.getParameter("artista");
		String tipo = request.getParameter("tipo");
		String epoca = request.getParameter("epoca");
		String dimensioni = request.getParameter("dimensioni");
		String descrizione = request.getParameter("descrizione");
		String Squantita = request.getParameter("quantita");
		String Sprezzo = request.getParameter("prezzo");
		String imagepath="/image/"+fileName;
		
		int quantita = Integer.parseInt(Squantita);
		double prezzo = Double.parseDouble(Sprezzo);
		
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
