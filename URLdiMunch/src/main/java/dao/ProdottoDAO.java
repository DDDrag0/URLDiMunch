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

	public synchronized void doSave(Prodotto product) throws SQLException {
		
		PreparedStatement preparedStatement = null;

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
			preparedStatement.setInt(8, product.getQuantità());
			preparedStatement.setDouble(9, product.getIva());
			preparedStatement.setDouble(10, product.getPrezzo());
			//preparedStatement.setString(11, product.getImagepath());

			connection.commit();
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

	public synchronized Prodotto doRetrieveByKey(String code) throws SQLException {
		PreparedStatement preparedStatement = null;

		Prodotto prodotto = new Prodotto();

		String selectSQL = "SELECT * FROM prodotto WHERE idProdotto = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setIdProdotto(rs.getString("idProdotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setArtista(rs.getString("artista"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setEpoca(rs.getString("epoca"));
				prodotto.setDimensioni(rs.getString("dimensioni"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setQuantità(rs.getInt("quantità"));
				prodotto.setIva(rs.getDouble("iva"));
				prodotto.setPrezzo(rs.getDouble("prezzo"));
				prodotto.setImagepath(rs.getString("imagepath"));
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
	

	public synchronized ArrayList<Prodotto> RicercaProdottoNome(String nome) throws SQLException {
		PreparedStatement preparedStatement = null;

        ArrayList<Prodotto> a = new ArrayList<Prodotto>();

		String selectSQL = "SELECT * FROM prodotto WHERE nome LIKE concat('%',?,'%')";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, nome);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();
				prodotto.setIdProdotto(rs.getString("idProdotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setArtista(rs.getString("artista"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setEpoca(rs.getString("epoca"));
				prodotto.setDimensioni(rs.getString("dimensioni"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setQuantità(rs.getInt("quantità"));
				prodotto.setIva(rs.getDouble("iva"));
				prodotto.setPrezzo(rs.getDouble("prezzo"));
				prodotto.setImagepath(rs.getString("imagepath"));

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

	public synchronized Collection<Prodotto> doRetrieveAll(String order) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<Prodotto> products = new LinkedList<Prodotto>();

		String selectSQL = "SELECT * FROM  prodotto";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();

				prodotto.setIdProdotto(rs.getString("idProdotto"));
				prodotto.setNome(rs.getString("nome"));
				prodotto.setArtista(rs.getString("artista"));
				prodotto.setTipo(rs.getString("tipo"));
				prodotto.setEpoca(rs.getString("epoca"));
				prodotto.setDimensioni(rs.getString("dimensioni"));
				prodotto.setDescrizione(rs.getString("descrizione"));
				prodotto.setQuantità(rs.getInt("quantità"));
				prodotto.setIva(rs.getDouble("iva"));
				prodotto.setPrezzo(rs.getDouble("prezzo"));
				prodotto.setImagepath(rs.getString("imagepath"));
				
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