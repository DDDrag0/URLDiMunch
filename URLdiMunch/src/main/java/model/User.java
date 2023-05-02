package model;

public class User {
	private String nome;
	private String cognome;
	private String password;
	private String telefono;
	
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	@Override
	public String toString() {
		return "User [nome=" + nome + ", cognome=" + cognome + ", password=" + password + ", telefono=" + telefono
				+ "]";
	}	
}
