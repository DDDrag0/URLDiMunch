package dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.ListaOrdini;
	
public class ListaOrdiniDAO {
	    
	    public synchronized void creaOrdine(ListaOrdini listaOrdini) throws SQLException {
	    	
			SecureRandom rand = new SecureRandom();	//per casi di security sensitive 
			byte[] bytes = new byte [20];
			rand.nextBytes(bytes);
			
			
			String co = null;
			PreparedStatement preparedStatement = null;
			PreparedStatement checkcodice = null;
	        try (Connection connection = ConPool.getConnection()){

	            preparedStatement = connection.prepareStatement("INSERT INTO listaOrdini (idOrdine,nomeProdotto,prezzo,dataOrdine,dataConsegna,dataArrivo,"
	            																+ "indirizzoConsegna, iva) VALUES (?,?,?,?,?,?,?,?);");
	            checkcodice = connection.prepareStatement("SELECT idOrdine FROM listaOrdini where idOrdine = ?");
	            checkcodice.setString(1, co);
	            
	            int ordineValido=0;
	            int ordineInvalido=0;
				while(ordineValido==0) {
					int codr = rand.nextInt(999999999);
					co= "ord-"+codr;
					ResultSet resultSet = checkcodice.executeQuery();
					while (resultSet.next()) {
						String codTess= resultSet.getString("codice");
						if(co.equals(codTess)) {
							ordineInvalido=1;
						}
					}
					if(ordineInvalido==0) {
						ordineValido=1;
					}
				}
				System.out.println("Il codice ordine sarà: "+co);
	            
	            preparedStatement.setString(1, co);
	            //preparedStatement.setString(2, listaOrdini.getNomeProdotto());
	            preparedStatement.setDouble(3, listaOrdini.getPrezzo());
	            preparedStatement.setString(4, listaOrdini.getDataOrdine());
	            preparedStatement.setString(5, listaOrdini.getDataConsegna());
	            preparedStatement.setString(6, listaOrdini.getDataArrivo());
	            preparedStatement.setString(7, listaOrdini.getIndirizzoConsegna());
	            preparedStatement.setDouble(8, listaOrdini.getIva());
	            System.out.println(preparedStatement);

	        } catch (SQLException e) {
	            printSQLException(e);
	        }finally {
	            try {
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	                if (checkcodice != null) {
	                    checkcodice.close();
	                }
	            } catch (SQLException e) {
	                printSQLException(e);
	            }
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
					//ordine.setNomeProdotto(rs.getString("nomeProdotto"));
					ordine.setPrezzo(rs.getDouble("prezzo"));
					ordine.setDataOrdine(rs.getString("dataOrdine"));
					ordine.setDataConsegna(rs.getString("dataConsegna"));
					ordine.setDataArrivo(rs.getString("dataArrivo"));
					ordine.setIndirizzoConsegna(rs.getString("indirizzoConsegna"));
					ordine.setIva(rs.getDouble("iva"));
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
			return (result != 0);
		}

		public synchronized Collection<ListaOrdini> ricercaTuttiOrdini() throws SQLException {
			
			PreparedStatement preparedStatement = null;

			Collection<ListaOrdini> orders = new LinkedList<>();

			String selectSQL = "SELECT * FROM  listaOrdini";

			try (Connection connection = ConPool.getConnection()){
				preparedStatement = connection.prepareStatement(selectSQL);

				ResultSet rs = preparedStatement.executeQuery();

				while (rs.next()) {
					ListaOrdini ordine = new ListaOrdini();

					ordine.setIdOrdine(rs.getString("idOrdine"));
					//ordine.setIdProdotto(rs.getString("nomeProdotto"));
					ordine.setPrezzo(rs.getDouble("prezzo"));
					ordine.setDataOrdine(rs.getString("dataOrdine"));
					ordine.setDataConsegna(rs.getString("dataConsegna"));
					ordine.setDataArrivo(rs.getString("dataArrivo"));
					ordine.setIndirizzoConsegna(rs.getString("indirizzoConsegna"));
					ordine.setIva(rs.getDouble("iva"));
					
					orders.add(ordine);
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