package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.ListaOrdini;
	
public class ListaOrdiniDAO {
	    
	    public synchronized void CreaOrdine(ListaOrdini listaOrdini) throws ClassNotFoundException {

	        try (Connection connection = ConPool.getConnection()){

	            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO listaOrdini (idOrdine,nomeProdotto,prezzo,dataOrdine,dataConsegna,dataArrivo,indirizzoConsegna,citta,provincia, descrizioneProdotto, iva) VALUES (?,?,?,?,?,?,?,?,?,?,?);");
	            preparedStatement.setString(1, listaOrdini.getIdOrdine());
	            preparedStatement.setString(2, listaOrdini.getNomeProdotto());
	            preparedStatement.setDouble(3, listaOrdini.getPrezzo());
	            preparedStatement.setDate(4, listaOrdini.getDataOrdine());
	            preparedStatement.setDate(5, listaOrdini.getDataConsegna());
	            preparedStatement.setDate(6, listaOrdini.getDataArrivo());
	            preparedStatement.setString(7, listaOrdini.getIndirizzoConsegna());
	            preparedStatement.setString(8, listaOrdini.getCitta());
	            preparedStatement.setString(9, listaOrdini.getProvincia());
	            preparedStatement.setString(10, listaOrdini.getDescrizione());
	            preparedStatement.setDouble(11, listaOrdini.getIva());
	            System.out.println(preparedStatement);

	        } catch (SQLException e) {
	            printSQLException(e);
	        }
	    }
	    
	    public synchronized ListaOrdini ricercaOrdine(String id) throws SQLException {
			PreparedStatement preparedStatement = null;

			ListaOrdini ordine = new ListaOrdini();

			String selectSQL = "SELECT * FROM listaordini WHERE idOrdine = ?";

			try (Connection connection = ConPool.getConnection()){
				preparedStatement = connection.prepareStatement(selectSQL);
				preparedStatement.setString(1, id);

				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					ordine.setIdOrdine(rs.getString("idOrdine"));
					ordine.setNomeProdotto(rs.getString("nomeProdotto"));
					ordine.setPrezzo(rs.getDouble("prezzo"));
					ordine.setDataOrdine(rs.getDate("dataOrdine"));
					ordine.setDataConsegna(rs.getDate("dataConsegna"));
					ordine.setDataArrivo(rs.getDate("dataArrivo"));
					ordine.setIndirizzoConsegna(rs.getString("indirizzoConsegna"));
					ordine.setCitta(rs.getString("citta"));
					ordine.setProvincia(rs.getString("provincia"));
					ordine.setDescrizione(rs.getString("descrizione"));
					ordine.setIva(rs.getDouble("iva"));
				}

			}
			catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
			return ordine;
	    }

		public synchronized boolean doDelete(String code) throws SQLException {
			
			PreparedStatement preparedStatement = null;

			int result = 0;

			String deleteSQL = "DELETE FROM listaOrdini WHERE idOrdine = ?";

			try (Connection connection = ConPool.getConnection()){
				preparedStatement = connection.prepareStatement(deleteSQL);
				preparedStatement.setString(1, code);

				result = preparedStatement.executeUpdate();

			}
			catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
			return (result != 0);
		}

		public synchronized Collection<ListaOrdini> ricercaTuttiOrdini(String order) throws SQLException {
			
			PreparedStatement preparedStatement = null;

			Collection<ListaOrdini> orders = new LinkedList<ListaOrdini>();

			String selectSQL = "SELECT * FROM  listaOrdini ";

			if (order != null && !order.equals("")) {
				selectSQL += " ORDER BY " + order;
			}

			try (Connection connection = ConPool.getConnection()){
				preparedStatement = connection.prepareStatement(selectSQL);

				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					ListaOrdini ordine = new ListaOrdini();

					ordine.setIdOrdine(rs.getString("idOrdine"));
					ordine.setNomeProdotto(rs.getString("nomeProdotto"));
					ordine.setPrezzo(rs.getDouble("prezzo"));
					ordine.setDataOrdine(rs.getDate("dataOrdine"));
					ordine.setDataConsegna(rs.getDate("dataConsegna"));
					ordine.setDataArrivo(rs.getDate("dataArrivo"));
					ordine.setIndirizzoConsegna(rs.getString("indirizzoConsegna"));
					ordine.setCitta(rs.getString("citta"));
					ordine.setProvincia(rs.getString("provincia"));
					ordine.setDescrizione(rs.getString("descrizione"));
					ordine.setIva(rs.getDouble("iva"));
					
					orders.add(ordine);
				}

			}
			catch (SQLException e) {
	            // process sql exception
	            printSQLException(e);
	        }
			return orders;
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