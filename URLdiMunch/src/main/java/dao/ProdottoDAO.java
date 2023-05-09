package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.Prodotto;

public class ProdottoDAO {

	public synchronized void doSave(Prodotto product) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO prodotto (idProdotto,nome, artista, tipo, epoca, dimensioni, descrizione, quantità, tipoPittura, cornice, materiale, colori, tipoStampa, iva, prezzo) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			preparedStatement.setString(9, product.getTipoPittura());
			preparedStatement.setInt(10, product.getCornice());
			preparedStatement.setString(11, product.getMateriale());
			preparedStatement.setString(12, product.getColori());
			preparedStatement.setString(13, product.getTipoStampa());
			preparedStatement.setDouble(14, product.getIva());
			preparedStatement.setDouble(15, product.getPrezzo());
			preparedStatement.setString(16, product.getImagepath());

			connection.commit();
		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
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
				prodotto.setIdProdotto(rs.getString("IdProdotto"));
				prodotto.setNome(rs.getString("Nome"));
				prodotto.setArtista(rs.getString("Artista"));
				prodotto.setTipo(rs.getString("Tipo"));
				prodotto.setEpoca(rs.getString("Epoca"));
				prodotto.setDimensioni(rs.getString("Dimensioni"));
				prodotto.setDescrizione(rs.getString("Descrizione"));
				prodotto.setQuantità(rs.getInt("Quantità"));
				prodotto.setTipoPittura(rs.getString("TipoPittura"));
				prodotto.setCornice(rs.getInt("Cornice"));
				prodotto.setMateriale(rs.getString("Materiale"));
				prodotto.setColori(rs.getString("Colori"));
				prodotto.setTipoStampa(rs.getString("TipoStampa"));
				prodotto.setIva(rs.getDouble("Iva"));
				prodotto.setPrezzo(rs.getDouble("Prezzo"));
				prodotto.setImagepath(rs.getString("Imagepath"));
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return prodotto;
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
        }
		return (result != 0);
	}

	public synchronized Collection<Prodotto> doRetrieveAll(String order) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<Prodotto> products = new LinkedList<Prodotto>();

		String selectSQL = "SELECT * FROM  prodotto ";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();

				prodotto.setIdProdotto(rs.getString("IdProdotto"));
				prodotto.setNome(rs.getString("Nome"));
				prodotto.setArtista(rs.getString("Artista"));
				prodotto.setTipo(rs.getString("Tipo"));
				prodotto.setEpoca(rs.getString("Epoca"));
				prodotto.setDimensioni(rs.getString("Dimensioni"));
				prodotto.setDescrizione(rs.getString("Descrizione"));
				prodotto.setQuantità(rs.getInt("Quantità"));
				prodotto.setTipoPittura(rs.getString("TipoPittura"));
				prodotto.setCornice(rs.getInt("Cornice"));
				prodotto.setMateriale(rs.getString("Materiale"));
				prodotto.setColori(rs.getString("Colori"));
				prodotto.setTipoStampa(rs.getString("TipoStampa"));
				prodotto.setIva(rs.getDouble("Iva"));
				prodotto.setPrezzo(rs.getDouble("Prezzo"));
				prodotto.setImagepath(rs.getString("Imagepath"));
				
				products.add(prodotto);
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
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