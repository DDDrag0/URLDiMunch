package dao;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import model.Carrello;
import model.ConPool;
import model.Prodotto;

public class ProdottoDAO {
	String idProdotto ="idProdotto";
	String nome = "nome";
	String artista = "artista";
	String tipo = "tipo";
	String epoca = "epoca";
	String dimensioni = "dimensioni";
	String descrizione = "descrizione";
	String quantita = "quantità";
	String iva = "iva";
	String prezzo = "prezzo";
	String imagepath ="imagepath";
	String data ="dataaggiunta";
	
	public synchronized int doSave(Prodotto product) throws SQLException {
		SecureRandom rand = new SecureRandom();	//per casi di security sensitive 
		byte[] bytes = new byte [20];
		rand.nextBytes(bytes);
		String co = null;
		PreparedStatement checkcodice = null;
		PreparedStatement preparedStatement = null;

	    double iva = 0.0;
		int result = 0;
		
		String subquery = "SELECT iva FROM urldimunch.prodotto LIMIT 1";
		String insertSQL = "INSERT INTO prodotto (idProdotto,nome, artista, tipo, epoca, dimensioni, descrizione, quantità, iva, prezzo, dataaggiunta, imagepath) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try (Connection connection2 = ConPool.getConnection()) {
		    // Esegui la subquery per ottenere il valore di iva
		    PreparedStatement subqueryStatement = connection2.prepareStatement(subquery);
		    ResultSet subqueryResult = subqueryStatement.executeQuery();
		    if (subqueryResult.next()) {
		        iva = subqueryResult.getDouble("iva");
		    }
		}
		
		try (Connection connection = ConPool.getConnection()){

			//la parte del controllo per l'id prodotto univoco
	    	checkcodice = connection.prepareStatement("SELECT idProdotto FROM prodotto where idProdotto = ?");
	        
	        int ordineValido=0;
	        int ordineInvalido=0;
			while(ordineValido==0) {
				int codr = rand.nextInt(99999);
				co= "prod-"+codr;
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
	        //fine parte del controllo per l'id prodotto univoco
			
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, co);
			preparedStatement.setString(2, product.getNome());
			preparedStatement.setString(3, product.getArtista());
			preparedStatement.setString(4, product.getTipo());
			preparedStatement.setString(5, product.getEpoca());
			preparedStatement.setString(6, product.getDimensioni());
			preparedStatement.setString(7, product.getDescrizione());
			preparedStatement.setInt(8, product.getQuantita());
		    preparedStatement.setDouble(9, iva);
		    preparedStatement.setDouble(10, product.getPrezzo());
		    preparedStatement.setDate(11, Date.valueOf(LocalDate.now()));
		    preparedStatement.setString(12, product.getImagepath());

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

	public synchronized Prodotto doRetrieveByKey(String code) throws SQLException {
		PreparedStatement preparedStatement = null;

		Prodotto prodotto = new Prodotto();

		String selectSQL = "SELECT * FROM prodotto WHERE idProdotto = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setIdProdotto(rs.getString(idProdotto));
				prodotto.setNome(rs.getString(nome));
				prodotto.setArtista(rs.getString(artista));
				prodotto.setTipo(rs.getString(tipo));
				prodotto.setEpoca(rs.getString(epoca));
				prodotto.setDimensioni(rs.getString(dimensioni));
				prodotto.setDescrizione(rs.getString(descrizione));
				prodotto.setQuantita(rs.getInt(quantita));
				prodotto.setIva(rs.getDouble(iva));
				prodotto.setPrezzo(rs.getDouble(prezzo));
				prodotto.setImagepath(rs.getString(imagepath));
				prodotto.setDataaggiunta(rs.getString(data));
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
		return prodotto;
    }
	

	public synchronized ArrayList<Prodotto> ricercaProdottoNome(String nomeq) throws SQLException {
		PreparedStatement preparedStatement = null;

        ArrayList<Prodotto> a = new ArrayList<>();

		String selectSQL = "SELECT * FROM prodotto WHERE nome LIKE concat('%',?,'%')";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nomeq);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getString(idProdotto));
				prodotto.setNome(rs.getString(nome));
				prodotto.setArtista(rs.getString(artista));
				prodotto.setTipo(rs.getString(tipo));
				prodotto.setEpoca(rs.getString(epoca));
				prodotto.setDimensioni(rs.getString(dimensioni));
				prodotto.setDescrizione(rs.getString(descrizione));
				prodotto.setQuantita(rs.getInt(quantita));
				prodotto.setIva(rs.getDouble(iva));
				prodotto.setPrezzo(rs.getDouble(prezzo));
				prodotto.setImagepath(rs.getString(imagepath));
				prodotto.setDataaggiunta(rs.getString(data));

				a.add(prodotto);
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
		return a;
    }
	
	public synchronized boolean modQuant(String quant, String code) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "UPDATE prodotto SET quantità = ? WHERE idProdotto=?";
		
		int quantI = Integer.parseInt(quant);
		
		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setDouble(1, quantI);
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
	
	public synchronized boolean doChangeTax(String tax) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "UPDATE prodotto SET iva = ?";
		
		double ivap = Double.parseDouble(tax);
		
		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setDouble(1, ivap);

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
	
	public synchronized boolean doDelete(String code) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM prodotto WHERE idProdotto = ?";

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
	
	public synchronized void subProd(String code[], Carrello cart) throws SQLException {
	 	try (Connection connection = ConPool.getConnection();
	         PreparedStatement statement = connection.prepareStatement("UPDATE prodotto SET quantità = quantità - ? WHERE idProdotto = ?")) {
	        int quant= 0;
	        int i = code.length;
	        for (int j=0; j<=i-1; j++) {
		        Prodotto prodotto = cart.searchProduct(code[j]);
		        quant = prodotto.getQuantitaCart();
		        
		 		statement.setInt(1, quant);
		        statement.setString(2, code[j]);
		        statement.executeUpdate();
	        	
	        }
	    } catch (SQLException e) {
	        printSQLException(e);
	        throw e;
	    }
	}

	public synchronized Collection<Prodotto> doRetrieveAll() throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<Prodotto> products = new LinkedList<>();

		String selectSQL = "SELECT * FROM  prodotto";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();

				prodotto.setIdProdotto(rs.getString(idProdotto));
				prodotto.setNome(rs.getString(nome));
				prodotto.setArtista(rs.getString(artista));
				prodotto.setTipo(rs.getString(tipo));
				prodotto.setEpoca(rs.getString(epoca));
				prodotto.setDimensioni(rs.getString(dimensioni));
				prodotto.setDescrizione(rs.getString(descrizione));
				prodotto.setQuantita(rs.getInt(quantita));
				prodotto.setIva(rs.getDouble(iva));
				prodotto.setPrezzo(rs.getDouble(prezzo));
				prodotto.setImagepath(rs.getString(imagepath));
				prodotto.setDataaggiunta(rs.getString(data));
				
				products.add(prodotto);
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
		return products;
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