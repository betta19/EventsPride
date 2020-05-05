package servlet;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelli.Utente;
import utility.GestioneDB;

@WebServlet(urlPatterns = { "/validazione" })

public class Validazione extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GestioneDB gestioneDB = new GestioneDB(
				(EntityManagerFactory) getServletContext().getAttribute("emf"));
		Utente utente = gestioneDB.validaUtente(Long.parseLong(req.getParameter("utente")));
		req.setAttribute("messaggio", "L'utente " + utente.getUsername() + " è stato validato");
		req.getRequestDispatcher("login.jsp").forward(req, resp);

	}

}
