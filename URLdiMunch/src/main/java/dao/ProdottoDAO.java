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

		String insertSQL = "INSERT INTO product (NAME, DESCRIPTION, PRICE, QUANTITY) VALUES (?, ?, ?, ?)";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, product.getNome());
			preparedStatement.setString(2, product.getDescrizione());
			preparedStatement.setInt(3, product.getPrezzo());
			preparedStatement.setInt(4, product.getQuantità());

			preparedStatement.executeUpdate();

			connection.commit();
		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
    }

	public synchronized Prodotto doRetrieveByKey(int code) throws SQLException {
		PreparedStatement preparedStatement = null;

		Prodotto prodotto = new Prodotto();

		String selectSQL = "SELECT * FROM product WHERE CODE = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				prodotto.setCodice(rs.getInt("CODE"));
				prodotto.setNome(rs.getString("NAME"));
				prodotto.setDescrizione(rs.getString("DESCRIPTION"));
				prodotto.setPrezzo(rs.getInt("PRICE"));
				prodotto.setQuantità(rs.getInt("QUANTITY"));
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return prodotto;
    }

	public synchronized boolean doDelete(int code) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM product WHERE CODE = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

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

		String selectSQL = "SELECT * FROM  product ";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Prodotto prodotto = new Prodotto();

				prodotto.setCodice(rs.getInt("CODE"));
				prodotto.setNome(rs.getString("NAME"));
				prodotto.setDescrizione(rs.getString("DESCRIPTION"));
				prodotto.setPrezzo(rs.getInt("PRICE"));
				prodotto.setQuantità(rs.getInt("QUANTITY"));
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