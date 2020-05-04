package modelli;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Utente {
	@Id

	private String username;
	private String nome;
	private String cognome;
	private String mail;
	private String password;
	private String tipo;
	private String foto;
	@Column(columnDefinition = "boolean default false")
	private boolean active;
	@OneToMany(fetch = FetchType.EAGER)
	private List<Evento> listaEventi;


	public Utente() {

	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
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


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public List<Evento> getListaEventi() {
		return listaEventi;
	}


	public void setListaEventi(List<Evento> listaEventi) {
		this.listaEventi = listaEventi;
	}

	
	
}
