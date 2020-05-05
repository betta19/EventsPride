package utility;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Query;

import modelli.Evento;
import modelli.Utente;


public class GestioneDB {
	
	
	private EntityManager em;

	public GestioneDB(EntityManagerFactory emf) {
		this.em = emf.createEntityManager();
	}
	
	
	public Utente aggiungiUtente(Utente utente) {
		em.getTransaction().begin();
		em.persist(utente);
		em.getTransaction().commit();
		return utente;
	}
	
	public Utente validaUtente(Long idUtente) {
		Utente utente = em.find(Utente.class, idUtente);
		em.getTransaction().begin();
		utente.setActive(true);
		em.getTransaction().commit();
		return utente;
	}
	
	public Utente controlloUtente(Utente utente) {
		Query query = em
				.createQuery("SELECT utente FROM Utente utente WHERE utente.username = ?1 and utente.password = ?2");
		query.setParameter(1, utente.getUsername());
		query.setParameter(2, utente.getPassword());
		try {
			return (Utente) query.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}
	
	
	public boolean aggiungiEvento(Evento evento) {
		em.getTransaction().begin();
		em.persist(evento);
		em.getTransaction().commit();
		return true;
	}
	
	
	public boolean rimuoviEventoById(long IdEvento) {

		Evento e = em.find(Evento.class, IdEvento);

		em.getTransaction().begin();
		em.remove(e);
		em.getTransaction().commit();
		return true;
	}
	
	public List<Evento> mostraEventi() {
		return em.createQuery("SELECT evento FROM Evento evento", Evento.class).getResultList();
	}



}
