package dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.ListaOrdini;
import model.User;
	
public class ListaOrdiniDAO {
	
	public void insertOrder(String idProdotti, double prezzo, String indirizzo) {
		SecureRandom rand = new SecureRandom();	//per casi di security sensitive 
		byte[] bytes = new byte [20];
		rand.nextBytes(bytes);
		String co = null;
		PreparedStatement checkcodice = null;
	    String insertQuery = "INSERT INTO listaOrdini (idOrdine, nomeProdotto, idProdotto, prezzo, dataOrdine, indirizzoConsegna, iva) " +
	                        "VALUES (?, ?, ?, ?, ?, ?, (SELECT iva FROM urldimunch.prodotto LIMIT 1))";
	    
	    try (Connection connection = ConPool.getConnection();
	         PreparedStatement statement = connection.prepareStatement(insertQuery)) {
	    	
	        //la parte del controllo per l'id ordine univoco
	    	checkcodice = connection.prepareStatement("SELECT idOrdine FROM listaOrdini where idOrdine = ?");
            
            int ordineValido=0;
            int ordineInvalido=0;
			while(ordineValido==0) {
				int codr = rand.nextInt(999999999);
				co= "ord-"+codr;
				checkcodice.setString(1, co);
				ResultSet resultSet = checkcodice.executeQuery();
				while (resultSet.next()) {
					String codOrdine= resultSet.getString("codice");
					if(co.equals(codOrdine)) {
						ordineInvalido=1;
					}
				}
				if(ordineInvalido==0) {
					ordineValido=1;
				}
			}
			System.out.println("Il codice ordine sarà: "+co);
	        //fine parte del controllo per l'id ordine univoco
	    	
	        statement.setString(1, co);
	        
	        String nomeProdotti = getProductNames(idProdotti);
	        statement.setString(2, nomeProdotti);
	        
	        statement.setString(3, idProdotti);
	        statement.setDouble(4, prezzo);
	        statement.setDate(5, Date.valueOf(LocalDate.now()));
	        statement.setString(6, indirizzo);
	        
	        statement.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	private String getProductNames(String idProdotti) {
	    String[] nomiArray = idProdotti.split("&");
	    StringBuilder idBuilder = new StringBuilder();
	    
	    try (Connection connection = ConPool.getConnection()) {
	        for (String nome : nomiArray) {
				PreparedStatement search = connection.prepareStatement("SELECT nome FROM urldimunch.prodotto WHERE idProdotto =  ? ");
				search.setString(1, nome);
				ResultSet resultSet = search.executeQuery();
	            if (resultSet.next()) {
	                int idProdotto = resultSet.getInt("idProdotto");
	                idBuilder.append("ID").append(idProdotto).append("&");
	            }
	            resultSet.close();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    if (idBuilder.length() > 0) {
	        idBuilder.setLength(idBuilder.length() - 1);
	    }
	    return idBuilder.toString();
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
				ordine.setIdProdotto(rs.getString("idProdotto"));
				ordine.setIdUtente(rs.getString("idUtente"));
				ordine.setPrezzo(rs.getDouble("prezzo"));
				ordine.setDataOrdine(rs.getString("dataOrdine"));
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
				ordine.setNomeProdotto(rs.getString("nomeProdotto"));
				ordine.setIdProdotto(rs.getString("idProdotto"));
				ordine.setIdUtente(rs.getString("idUtente"));
				ordine.setPrezzo(rs.getDouble("prezzo"));
				ordine.setDataOrdine(rs.getString("dataOrdine"));
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
	
	public synchronized Collection<ListaOrdini> ricercaTuttiOrdiniUtente(User user) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<ListaOrdini> orders = new LinkedList<>();
		

		try (Connection connection = ConPool.getConnection()){
			
			PreparedStatement search = connection.prepareStatement("SELECT * FROM  listaOrdini WHERE idUtente= ? ");
			search.setString(1, user.getIdUtente());
			ResultSet rs = search.executeQuery();

			while (rs.next()) {
				ListaOrdini ordine = new ListaOrdini();

				ordine.setIdOrdine(rs.getString("idOrdine"));
				ordine.setNomeProdotto(rs.getString("nomeProdotto"));
				ordine.setIdProdotto(rs.getString("idProdotto"));
				ordine.setIdUtente(rs.getString("idUtente"));
				ordine.setPrezzo(rs.getDouble("prezzo"));
				ordine.setDataOrdine(rs.getString("dataOrdine"));
				ordine.setIndirizzoConsegna(rs.getString("indirizzoConsegna"));
				ordine.setIva(rs.getDouble("iva"));
				
				orders.add(ordine);
			}
			search.close();

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