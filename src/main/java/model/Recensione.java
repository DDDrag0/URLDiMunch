package model;

public class Recensione {
	int idRecensione;
	String idProdotto;
	String idUtente;
	String recensione;
	
	public int getIdRecensione() {
		return idRecensione;
	}
	public void setIdRecensione(int idRecensione) {
		this.idRecensione = idRecensione;
	}
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
	public String getRecensione() {
		return recensione;
	}
	public void setRecensione(String recensione) {
		this.recensione = recensione;
	}
	@Override
	public String toString() {
		return "Recensione [idRecensione=" + idRecensione + ", idProdotto=" + idProdotto + ", idUtente=" + idUtente
				+ ", recensione=" + recensione + "]";
	}
}
