package modelli;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
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
@ManyToMany
@JoinTable(name="Evento_Utente",
joinColumns=@JoinColumn(name="Evento_id"),
inverseJoinColumns=@JoinColumn(name="Utente_id"))
private List<Utente> listaUtenti;


public Evento() {
	
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + (int) (id ^ (id >>> 32));
	result = prime * result + ((nome == null) ? 0 : nome.hashCode());
	return result;
}

@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Evento other = (Evento) obj;
	if (id != other.id)
		return false;
	if (nome == null) {
		if (other.nome != null)
			return false;
	} else if (!nome.equals(other.nome))
		return false;
	return true;
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
