package servlet;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelli.Utente;
import utility.GestioneDB;

@WebServlet(name = "partecipa", urlPatterns = { "/partecipa", "/utente/partecipa"})
public class Partecipa extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("/home.jsp").forward(req, resp);
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	HttpSession session = req.getSession();
	GestioneDB db = new GestioneDB((EntityManagerFactory) getServletContext().getAttribute("emf"));
	Utente utente = (Utente) session.getAttribute("Utente");
	db.aggiungiPartecipante(Long.parseLong(req.getParameter("idEvento")), utente);
	req.setAttribute("listaEventiAperti", db.controlloIscrizione(utente, db.mostraEventiAperti()));
	req.setAttribute("eventiPartecipati", db.eventiPartecipati(utente));
	req.setAttribute("eventiVinti", db.eventiVinti(utente, db.mostraEventiChiusi()));
	req.setAttribute("messaggio", "Ti sei registrato ad un evento!");
	req.getRequestDispatcher("utente/menuUtente.jsp").forward(req, resp);
	}
}
