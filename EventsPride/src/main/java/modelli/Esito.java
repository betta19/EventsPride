package modelli;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Esito {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@OneToOne
	private Evento evento;
private Utente utente;
private Utente utente2;
private Utente utente3;
public Esito() {
	super();
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
public Utente getUtente() {
	return utente;
}
public void setUtente(Utente utente) {
	this.utente = utente;
}
public Utente getUtente2() {
	return utente2;
}
public void setUtente2(Utente utente2) {
	this.utente2 = utente2;
}
public Utente getUtente3() {
	return utente3;
}
public void setUtente3(Utente utente3) {
	this.utente3 = utente3;
}

}
