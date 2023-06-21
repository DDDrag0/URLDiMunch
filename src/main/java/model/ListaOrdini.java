package model;

import java.util.List;

public class ListaOrdini {

	private String idOrdine;
	private List<String> nomeProdotto;
	private List<String> idProdotto;
	private String indirizzoConsegna;
	private double prezzo;
	private String dataOrdine;
	private String dataConsegna;
	private String dataArrivo;
	private double iva;
	
	public String getIdOrdine() {
		return idOrdine;
	}
	public void setIdOrdine(String idOrdine) {
		this.idOrdine = idOrdine;
	}
	public List<String> getNomeProdotto() {
		return nomeProdotto;
	}
	public void setNomeProdotto(List<String> nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}
	public List<String> getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(List<String> idProdotto) {
		this.idProdotto = idProdotto;
	}
	public String getIndirizzoConsegna() {
		return indirizzoConsegna;
	}
	public void setIndirizzoConsegna(String indirizzoConsegna) {
		this.indirizzoConsegna = indirizzoConsegna;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public String getDataOrdine() {
		return dataOrdine;
	}
	public void setDataOrdine(String dataOrdine) {
		this.dataOrdine = dataOrdine;
	}
	public String getDataConsegna() {
		return dataConsegna;
	}
	public void setDataConsegna(String dataConsegna) {
		this.dataConsegna = dataConsegna;
	}
	public String getDataArrivo() {
		return dataArrivo;
	}
	public void setDataArrivo(String dataArrivo) {
		this.dataArrivo = dataArrivo;
	}
	public double getIva() {
		return iva;
	}
	public void setIva(double iva) {
		this.iva = iva;
	}
	@Override
	public String toString() {
		return "ListaOrdini [idOrdine=" + idOrdine + ", nomeProdotto=" + nomeProdotto 
				+ ", indirizzoConsegna=" + indirizzoConsegna + ", prezzo=" + prezzo + ", dataOrdine=" + dataOrdine 
				+ ", dataConsegna=" + dataConsegna + ", dataArrivo=" + dataArrivo + ", iva=" + iva + "]";
	}
}