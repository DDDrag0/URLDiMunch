package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import model.ConPool;
import model.Wishlist;

public class WishListDAO {

	public synchronized void doSave(Wishlist wishlist) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO wishlist (idProdotto,idUtente) VALUES (?,?)";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, wishlist.getIdProdotto());
			preparedStatement.setString(2, wishlist.getIdUtente());

			connection.commit();
		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
    }

	public synchronized Wishlist doRetrieveByKey(String idutente) throws SQLException {
		PreparedStatement preparedStatement = null;

		Wishlist wishlist = new Wishlist();

		String selectSQL = "SELECT * FROM wishlist WHERE idProdotto = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idutente);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				wishlist.setIdProdotto(rs.getString("idProdotto"));
				wishlist.setIdUtente(rs.getString("idUtente"));
			}

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return wishlist;
    }

	public synchronized boolean doDelete(String idutente, String idprodotto) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM wishlist WHERE idProdotto = ? AND idUtente = ?";

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, idprodotto);
			preparedStatement.setString(1, idutente);

			result = preparedStatement.executeUpdate();

		}
		catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
		return (result != 0);
	}

	public synchronized Collection<Wishlist> doRetrieveAll(String order) throws SQLException {
		
		PreparedStatement preparedStatement = null;

		Collection<Wishlist> products = new LinkedList<Wishlist>();

		String selectSQL = "SELECT * FROM  wishlist ";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try (Connection connection = ConPool.getConnection()){
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				Wishlist wishlist = new Wishlist();
				
				wishlist.setIdProdotto(rs.getString("idProdotto"));
				wishlist.setIdUtente(rs.getString("idUtente"));
				
				products.add(wishlist);
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