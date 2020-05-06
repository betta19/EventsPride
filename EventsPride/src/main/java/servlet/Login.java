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
import utility.Crittografia;
import utility.GestioneDB;

@WebServlet(name = "login", urlPatterns = { "/login", "/"})
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Devi prima accedere");
		req.getRequestDispatcher("login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
	       GestioneDB gestioneDB = new GestioneDB(
					(EntityManagerFactory) getServletContext().getAttribute("emf"));
	       Utente p=new Utente();
	       p.setUsername(req.getParameter("user"));
	       p.setPassword(Crittografia.encrypt(req.getParameter("password")));
			Utente utente = gestioneDB.controlloUtente(p);
			if (utente == null) {
				req.setAttribute("messaggio", "Credenziali invalide");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			} else if (utente.isActive()) {
				if (utente.getTipo().equals("utente")) {
					HttpSession sessione = req.getSession();
					sessione.setAttribute("Utente", utente);
					
					req.getRequestDispatcher("utente/menuUtente.jsp").forward(req, resp);
				} else {
					HttpSession sessione = req.getSession();
					sessione.setAttribute("Utente", utente);
					req.setAttribute("listaEventi", gestioneDB.mostraEventi());
					req.getRequestDispatcher("admin/menuAdmin.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("messaggio", "Utente non attivo, controllare l'email");
				req.getRequestDispatcher("login.jsp").forward(req, resp);

			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
			req.setAttribute("messaggio", "Errore d'accesso");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

}