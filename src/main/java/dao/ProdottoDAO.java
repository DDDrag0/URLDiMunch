package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

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
	
	public synchronized int doSave(Prodotto product) throws SQLException {
		
		PreparedStatement preparedStatement = null;
		
		int result = 0;
		
		String insertSQL = "INSERT INTO prodotto (idProdotto,nome, artista, tipo, epoca, dimensioni, descrizione, quantità, iva, prezzo) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getIdProdotto());
			preparedStatement.setString(2, product.getNome());
			preparedStatement.setString(3, product.getArtista());
			preparedStatement.setString(4, product.getTipo());
			preparedStatement.setString(5, product.getEpoca());
			preparedStatement.setString(6, product.getDimensioni());
			preparedStatement.setString(7, product.getDescrizione());
			preparedStatement.setInt(8, product.getQuantita());
			preparedStatement.setDouble(9, product.getIva());
			preparedStatement.setDouble(10, product.getPrezzo());

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
	
public synchronized void subProd(String code,int quant) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String sql = "UPDATE prodotto SET quantità = quantità - ? WHERE idProdotto = ?";

		try (Connection connection = ConPool.getConnection()){
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, quant);
			statement.setString(2, code);


			result = statement.executeUpdate();

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