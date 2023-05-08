package model;

public class User {
	private String idUtente;
	private String password;
	private String nome;
	private String cognome;
	private String email;
	private String carta;
	private String telefono;
	private String indirizzoFatturazione;
	private String indirizzoSpedizione;
	private int amministratore;
	
	
	public String getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(String idUtente) {
		this.idUtente = idUtente;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCarta() {
		return carta;
	}
	public void setCarta(String carta) {
		this.carta = carta;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getIndirizzoFatturazione() {
		return indirizzoFatturazione;
	}
	public void setIndirizzoFatturazione(String indirizzoFatturazione) {
		this.indirizzoFatturazione = indirizzoFatturazione;
	}
	public String getIndirizzoSpedizione() {
		return indirizzoSpedizione;
	}
	public void setIndirizzoSpedizione(String indirizzoSpedizione) {
		this.indirizzoSpedizione = indirizzoSpedizione;
	}
	public int getAmministratore() {
		return amministratore;
	}
	public void setAmministratore(int amministratore) {
		this.amministratore = amministratore;
	}
	
	@Override
	public String toString() {
		return "User [idUtente=" + idUtente + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome
				+ ", email=" + email + ", carta=" + carta + ", telefono=" + telefono + ", indirizzoFatturazione="
				+ indirizzoFatturazione + ", indirizzoSpedizione=" + indirizzoSpedizione + ", amministratore="
				+ amministratore + "]";
	} 
}
