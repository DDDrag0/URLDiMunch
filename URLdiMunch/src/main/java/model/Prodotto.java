package model;

import java.io.Serializable;

public class Prodotto implements Serializable {

	private String idProdotto;
	private String nome;
	private String artista;
	private String tipo;
	private String epoca;
	private String dimensioni;
	private String descrizione;
	private String tipoPittura;
	private String materiale;
	private String colori;
	private String tipoStampa;
	private String imagepath;
	private int cornice;
	private double prezzo;
	private double iva;
	public String getIdProdotto() {
		return idProdotto;
	}
	public void setIdProdotto(String idProdotto) {
		this.idProdotto = idProdotto;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getArtista() {
		return artista;
	}
	public void setArtista(String artista) {
		this.artista = artista;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getEpoca() {
		return epoca;
	}
	public void setEpoca(String epoca) {
		this.epoca = epoca;
	}
	public String getDimensioni() {
		return dimensioni;
	}
	public void setDimensioni(String dimensioni) {
		this.dimensioni = dimensioni;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getTipoPittura() {
		return tipoPittura;
	}
	public void setTipoPittura(String tipoPittura) {
		this.tipoPittura = tipoPittura;
	}
	public String getMateriale() {
		return materiale;
	}
	public void setMateriale(String materiale) {
		this.materiale = materiale;
	}
	public String getColori() {
		return colori;
	}
	public void setColori(String colori) {
		this.colori = colori;
	}
	public String getTipoStampa() {
		return tipoStampa;
	}
	public void setTipoStampa(String tipoStampa) {
		this.tipoStampa = tipoStampa;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public int getCornice() {
		return cornice;
	}
	public void setCornice(int cornice) {
		this.cornice = cornice;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public double getIva() {
		return iva;
	}
	public void setIva(double iva) {
		this.iva = iva;
	}
	@Override
	public String toString() {
		return "Prodotto [idProdotto=" + idProdotto + ", nome=" + nome + ", artista=" + artista + ", tipo=" + tipo
				+ ", epoca=" + epoca + ", dimensioni=" + dimensioni + ", descrizione=" + descrizione + ", tipoPittura="
				+ tipoPittura + ", materiale=" + materiale + ", colori=" + colori + ", tipoStampa=" + tipoStampa
				+ ", imagepath=" + imagepath + ", cornice=" + cornice + ", prezzo=" + prezzo + ", iva=" + iva + "]";
	}
}
