package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.ConPool;
import model.User;

public class UserDAO {

    public synchronized boolean validate(User user) throws ClassNotFoundException {
        boolean status = false;
        
        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement("select * from utente where idutente = ? and password = ? ");
            preparedStatement.setString(1, user.getIdUtente());
            preparedStatement.setString(2, user.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }
    
    public synchronized int registerUser(User user) throws ClassNotFoundException {

        int result = 0;

        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO utente (idUtente,password,email) VALUES (?,?,?);");
            preparedStatement.setString(1, user.getIdUtente());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getEmail());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return result;
    }
    
    public synchronized int modUser(User user) throws ClassNotFoundException {

        int result = 0;

        try (Connection connection = ConPool.getConnection()){

            // Step 2:Create a statement using connection object
        	PreparedStatement preparedStatement = connection.prepareStatement("UPDATE INTO utente (password,nome,cognome,email,telefono,indirizzoFatturazione,indirizzoSpedizione) VALUES (?,?,?,?,?,?,?) WHERE idUtente=?;");
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getNome());
            preparedStatement.setString(3, user.getCognome());
            preparedStatement.setString(4, user.getEmail());
            preparedStatement.setString(5, user.getTelefono());
            preparedStatement.setString(6, user.getIndirizzoFatturazione());
            preparedStatement.setString(7, user.getIndirizzoSpedizione());
            preparedStatement.setString(8, user.getIdUtente());

            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
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
			int res=rs.getInt("amministratore");
			if(res==1) {
				check=true;
			}
		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		
    	return check;
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
				
				user.setIdUtente(rs.getString("idUtente"));
				user.setPassword(rs.getString("password"));
				user.setNome(rs.getString("nome"));
				user.setCognome(rs.getString("cognome"));
				user.setEmail(rs.getString("email"));
				user.setCarta(rs.getString("carta"));
				user.setTelefono(rs.getString("telefono"));
				user.setIndirizzoFatturazione(rs.getString("indirizzoFatturazione"));
				user.setIndirizzoSpedizione(rs.getString("indirizzoSpedizione"));
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return user;
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
