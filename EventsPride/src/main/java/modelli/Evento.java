package modelli;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Evento {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
private String nome;
private String dataApertura;
@OneToOne
private Esito esito;
@Lob
@Column(columnDefinition = "LONGBLOB NOT NULL")
private String foto;
private String stato;
@OneToMany(fetch = FetchType.EAGER)
@Column(name="utenti")
private List<Utente> listaUtenti;
public Evento() {
	
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public String getDataApertura() {
	return dataApertura;
}
public void setDataApertura(String dataApertura) {
	this.dataApertura = dataApertura;
}
public Esito getEsito() {
	return esito;
}
public void setEsito(Esito esito) {
	this.esito = esito;
}
public String getFoto() {
	return foto;
}
public void setFoto(String foto) {
	this.foto = foto;
}
public String getStato() {
	return stato;
}
public void setStato(String stato) {
	this.stato = stato;
}
public List<Utente> getListaUtenti() {
	return listaUtenti;
}
public void setListaUtenti(List<Utente> listaUtenti) {
	this.listaUtenti = listaUtenti;
}

}
