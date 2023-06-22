package dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.Recensione;

public class RecensioneDAO {

public synchronized Recensione doRetrieveById(String idRecensione) throws SQLException {
	    PreparedStatement preparedStatement = null;
	    Recensione recensione = null;
	    
	    String selectSQL = "SELECT * FROM recensione WHERE idRecensione = ?";
	    
	    try (Connection connection = ConPool.getConnection()) {
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, idRecensione);
	        
	        ResultSet rs = preparedStatement.executeQuery();
	        
	        if (rs.next()) {
	            recensione = new Recensione();
	            
	            recensione.setIdRecensione(rs.getInt("idRecensione"));
	            recensione.setIdProdotto(rs.getString("idProdotto"));
	            recensione.setIdUtente(rs.getString("idUtente"));
	            recensione.setRecensione(rs.getString("recensione"));
	        }
	    } catch (SQLException e) {
	        printSQLException(e);
	    } finally {
	        if (preparedStatement != null) {
	            preparedStatement.close();
	        }
	    }
	    
	    return recensione;
}

public synchronized int doSave(Recensione recensione) throws SQLException {
	SecureRandom rand = new SecureRandom();	//per casi di security sensitive 
	byte[] bytes = new byte [20];
	rand.nextBytes(bytes);
	
	
	int codr=0;
	PreparedStatement preparedStatement = null;
	PreparedStatement checkcodice = null;
    try (Connection connection = ConPool.getConnection()){

        checkcodice = connection.prepareStatement("SELECT idRecensione FROM recensione where idRecensione = ?");
        
        int ordineValido=0;
        int ordineInvalido=0;
		while(ordineValido==0) {
			codr = rand.nextInt(999999999);
	        checkcodice.setInt(1, codr);
			ResultSet resultSet = checkcodice.executeQuery();
			while (resultSet.next()) {
				int codRec= resultSet.getInt("idRecensione");
				if(codr==codRec) {
					ordineInvalido=1;
				}
			}
			if(ordineInvalido==0) {
				ordineValido=1;
			}
		}
		System.out.println("Il codice ordine sarà: "+codr);
    }
	
	int result = 0;
	
	String insertSQL = "INSERT INTO recensione (idRecensione,idProdotto, idUtente, recensione) VALUES (?,?,?,?)";

	try (Connection connection = ConPool.getConnection()){
		preparedStatement = connection.prepareStatement(insertSQL);
		preparedStatement.setInt(1, codr);
		preparedStatement.setString(2, recensione.getIdProdotto());
		preparedStatement.setString(3, recensione.getIdUtente());
		preparedStatement.setString(4, recensione.getRecensione());

        System.out.println(preparedStatement);

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

public synchronized boolean doDelete(String code) throws SQLException {
	
	PreparedStatement preparedStatement = null;

	int result = 0;

	String deleteSQL = "DELETE FROM recensione WHERE idRecensione = ?";

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

public synchronized int modRecensione(Recensione rec) throws ClassNotFoundException {

    int result = 0;
	PreparedStatement preparedStatement = null;

    try (Connection connection = ConPool.getConnection()){

        // Step 2:Create a statement using connection object
    	preparedStatement = connection.prepareStatement("UPDATE recensione SET recensione=? WHERE idRecensione=?;");
        preparedStatement.setString(1, rec.getRecensione());

        System.out.println(preparedStatement);
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

public synchronized Collection<Recensione> doRetrieveByProduct(String code) throws SQLException {
	
	PreparedStatement preparedStatement = null;

	Collection<Recensione> recensioni = new LinkedList<>();

	String selectSQL = "SELECT * FROM  recensione WHERE idProdotto = ?";

	try (Connection connection = ConPool.getConnection()){
		preparedStatement = connection.prepareStatement(selectSQL);
		preparedStatement.setString(1, code);
		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			Recensione recensione = new Recensione();

			recensione.setIdRecensione(rs.getInt("idRecensione"));
			recensione.setIdProdotto(rs.getString("idProdotto"));
			recensione.setIdUtente(rs.getString("idUtente"));
			recensione.setRecensione(rs.getString("recensione"));
			
			recensioni.add(recensione);
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
	return recensioni;
}

public synchronized Collection<Recensione> doRetrieveAll() throws SQLException {
	
	PreparedStatement preparedStatement = null;

	Collection<Recensione> recensioni = new LinkedList<>();

	String selectSQL = "SELECT * FROM  recensione";

	try (Connection connection = ConPool.getConnection()){
		preparedStatement = connection.prepareStatement(selectSQL);

		ResultSet rs = preparedStatement.executeQuery();

		while (rs.next()) {
			Recensione recensione = new Recensione();

			recensione.setIdRecensione(rs.getInt("idRecensione"));
			recensione.setIdProdotto(rs.getString("idProdotto"));
			recensione.setIdUtente(rs.getString("idUtente"));
			recensione.setRecensione(rs.getString("recensione"));
			
			recensioni.add(recensione);
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
	return recensioni;
}

private void printSQLException(SQLException ex) {
    for (Throwable e: ex) {
        if (e instanceof SQLException) {
            e.printStackTrace(System.err);
            System.err.println("SQLState: " + ((SQLException) e).getSQLState());
            System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
            System.err.println("Message: " + e.getMessage());
            Throwable t = ex.getCause();
            while (t != null) {
                System.out.println("Cause: " + t);
                t = t.getCause();
            }
        }
    }
}
}