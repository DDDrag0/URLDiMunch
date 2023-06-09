package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.User;

public class UserDAO {
	private String idUtentet ="idUtente";
	private String passwordt ="password";
	private String nomet ="nome";
	private String cognomet ="cognome";
	private String emailt ="email";
	private String cartat ="carta";
	private String telefonot ="telefono";
	private String indirizzoFatturazionet ="indirizzoFatturazione";
	private String indirizzoSpedizionet ="indirizzoSpedizione";
	private String amministratoret ="amministratore";

    public synchronized boolean validate(User user) throws ClassNotFoundException {
        boolean status = false;
        PreparedStatement preparedStatement = null;
        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
            preparedStatement = connection.prepareStatement("select * from utente where idutente = ? and password = ? ");
            preparedStatement.setString(1, user.getIdUtente());
            preparedStatement.setString(2, user.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        return status;
    }
    
    public synchronized int registerUser(User user) throws ClassNotFoundException {

        int result = 0;

		PreparedStatement preparedStatement = null;
        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
            preparedStatement = connection.prepareStatement("INSERT INTO utente (idUtente,password,email) VALUES (?,?,?);");
            preparedStatement.setString(1, user.getIdUtente());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());

            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        return result;
    }
    
    public synchronized int modUser(User user) throws ClassNotFoundException {

        int result = 0;
		PreparedStatement preparedStatement = null;

        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
        	preparedStatement = connection.prepareStatement("UPDATE utente SET password=?,nome=?,cognome=?,email=?,telefono=?,indirizzoFatturazione=?,indirizzoSpedizione=? WHERE idUtente=?;");
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getNome());
            preparedStatement.setString(3, user.getCognome());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getTelefono());
            preparedStatement.setString(6, user.getIndirizzoFatturazione());
            preparedStatement.setString(7, user.getIndirizzoSpedizione());
            preparedStatement.setString(8, user.getIdUtente());

            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        return result;
    }
    
    public synchronized String addCard(User user, String card) {

		PreparedStatement preparedStatement = null;
		//form per ottenere le stringhe come xxxx xxxx xxxx 1234, per le carte censurate dato che sarebbe illegale salvarle nel sito.
		String hiddenPart = card.substring(0, card.length() - 4).replaceAll("\\d", "x");
		String visiblePart = card.substring(card.length() - 4);
		String result = hiddenPart + visiblePart;

        try (Connection connection = ConPool.getConnection()){

        	preparedStatement = connection.prepareStatement("UPDATE utente SET carta=? WHERE idUtente=?;");
            preparedStatement.setString(1, result);
            preparedStatement.setString(2, user.getIdUtente());

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
        return result;
    }
    
    public synchronized boolean checkAdmin(String id) throws SQLException{
		PreparedStatement preparedStatement = null;
		Boolean check = false;
		String selectSQL = "SELECT amministratore FROM utente WHERE idutente = ?";
		
		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, id);

			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			int res=rs.getInt(amministratoret);
			if(res==1) {
				check=true;
			}
		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
		
    	return check;
    }
    
    public synchronized boolean doAdmin(String code) throws SQLException {
		
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		int val=0;
		boolean checkadmin=checkAdmin(code);
		if (checkadmin) {
			val=0;
		}
		else {
			val=1;
		}
		String deleteSQL = "UPDATE utente SET amministratore=? WHERE idUtente=?;";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, val);
			preparedStatement.setString(2, code);

			result = preparedStatement.executeUpdate();

		}
		catch (SQLException e) {
	        // process sql exception
	        printSQLException(e);
	    }finally {
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }
		return (result != 0);
	}
    
    public synchronized User ricercaUser(String id) throws SQLException {
		PreparedStatement preparedStatement = null;

		User user = new User();

		String selectSQL = "SELECT * FROM utente WHERE idutente = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, id);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				
				user.setIdUtente(rs.getString(idUtentet));
				user.setPassword(rs.getString(passwordt));
				user.setNome(rs.getString(nomet));
				user.setCognome(rs.getString(cognomet));
				user.setEmail(rs.getString(emailt));
				user.setCarta(rs.getString(cartat));
				user.setTelefono(rs.getString(telefonot));
				user.setIndirizzoFatturazione(rs.getString(indirizzoFatturazionet));
				user.setIndirizzoSpedizione(rs.getString(indirizzoSpedizionet));
				user.setAmministratore(rs.getInt(amministratoret));
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
		return user;
    }
    
	public synchronized Collection<User> ricercaTuttiUtenti() throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<User> users = new LinkedList<>();

		String selectSQL = "SELECT * FROM  utente";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				User user = new User();

				user.setIdUtente(rs.getString(idUtentet));
				user.setNome(rs.getString(nomet));
				user.setCognome(rs.getString(cognomet));
				user.setEmail(rs.getString(emailt));
				user.setCarta(rs.getString(cartat));
				user.setTelefono(rs.getString(telefonot));
				user.setIndirizzoFatturazione(rs.getString(indirizzoFatturazionet));
				user.setIndirizzoSpedizione(rs.getString(indirizzoSpedizionet));
				user.setAmministratore(rs.getInt(amministratoret));
				
				users.add(user);
			}
			preparedStatement.close();

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
        }
		return users;
	}
	
	public synchronized boolean doDelete(String code) throws SQLException {
		
		PreparedStatement preparedStatement = null;
		
		int result = 0;

		String deleteSQL = "DELETE FROM utente WHERE idutente = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, code);

			result = preparedStatement.executeUpdate();

		}
		catch (SQLException e) {
	        // process sql exception
	        printSQLException(e);
	    }finally {
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }
		return (result != 0);
	}
	
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                //e.printStackTrace(//System.err);
                //System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                //System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                //System.err.println("Message: " + e.getMessage());
                //Throwable t = ex.getCause();
                //while (t != null) {
                    //System.out.println("Cause: " + t);
                    //t = t.getCause();
                //}
            }
        }
    }
}