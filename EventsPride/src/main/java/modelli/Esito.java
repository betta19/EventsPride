package modelli;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Esito {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@OneToOne
	private Evento evento;
	@OneToMany( cascade = CascadeType.ALL,
    orphanRemoval = true)
	@Column(name="esiti")
private List<Utente> utentiScelti;
public Esito() {
	
}
public long getId() {
	return id;
}
public void setId(long id) {
	this.id = id;
}
public Evento getEvento() {
	return evento;
}
public void setEvento(Evento evento) {
	this.evento = evento;
}
public List<Utente> getUtentiScelti() {
	return utentiScelti;
}
public void setUtentiScelti(List<Utente> utentiScelti) {
	this.utentiScelti = utentiScelti;
}

}
