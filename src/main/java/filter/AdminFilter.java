package filter;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebFilter("/admin/*")
public class AdminFilter implements Filter {

    public AdminFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        UserDAO userDAO = new UserDAO();
        if(httpRequest.getSession().getAttribute("utente")==null){
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied.jsp");
        }
        else {
	        User user = (User) httpRequest.getSession().getAttribute("utente");
	        String userID = user.getIdUtente();
	        try {
	            boolean isAdmin = userDAO.checkAdmin(userID);
	
	            if (isAdmin) {
	                // L'utente è un amministratore, permetti l'accesso alla cartella admin
	                chain.doFilter(request, response);
	            } else {
	                // L'utente non è un amministratore, reindirizza alla pagina di accesso negato
	                httpResponse.sendRedirect(httpRequest.getContextPath() + "/access-denied.jsp");
	            }
	        } catch (SQLException e) {
	            // Gestionare l'eccezione in modo appropriato
	        }
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}
