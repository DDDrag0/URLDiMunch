package model;

public class Wishlist {
	private String idProdotto;
	private String idUtente;
	
	
	public String getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}
	public String getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}
	
	@Override
	public String toString() {
		return "Wishlist [idProdotto=" + idProdotto + ", idUtente=" + idUtente + "]";
	}
}
