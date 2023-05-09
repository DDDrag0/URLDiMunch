package dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	
	import model.ConPool;
	import model.ListaOrdini;
	
public class ListaOrdiniDAO {
	    
	    public synchronized void CreaOrdine(ListaOrdini listaOrdini) throws ClassNotFoundException {

	        int result = 0;

	        try (Connection connection = ConPool.getConnection()){

	            // Step 2:Create a statement using connection object
	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO ListaOrdini (IdOrdine,nomeProdotto,prezzo,dataOrdine,dataConsegna,dataArrivo,indirizzoConsegna,citta,provincia, descrizioneProdotto, iva) VALUES (?,?,?,?,?,?,?,?,?,?,?);");
	            preparedStatement.setString(1, listaOrdini.getIdOrdine());
	            preparedStatement.setString(2, listaOrdini.getNomeProdotto());
	            preparedStatement.setDouble(3, listaOrdini.getPrezzo());
	            preparedStatement.setDate(4, listaOrdini.getDataOrdine());
	            preparedStatement.setDate(5, listaOrdini.getDataConsegna());
	            preparedStatement.setDate(6, listaOrdini.getDataArrivo());
	            preparedStatement.setString(7, listaOrdini.getIndirizzoConsegna());
	            preparedStatement.setString(8, listaOrdini.getCitta());
	            preparedStatement.setString(9, listaOrdini.getProvincia());
	            preparedStatement.setString(9, listaOrdini.getDescrizione());
	            preparedStatement.setDouble(9, listaOrdini.getIva());
	            System.out.println(preparedStatement);
	            // Step 3: Execute the query or update query
	            result = preparedStatement.executeUpdate();

	        } catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
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