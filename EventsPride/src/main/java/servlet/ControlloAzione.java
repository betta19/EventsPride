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

@WebServlet(name = "controllo", urlPatterns = { "/controllo", "/admin/controllo" })

public class ControlloAzione extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int azione = Integer.parseInt(req.getParameter("azione"));
		try {
			GestioneDB gestioneDB = new GestioneDB((EntityManagerFactory) getServletContext().getAttribute("emf"));
			HttpSession sessione = req.getSession();
			Utente utente = (Utente) sessione.getAttribute("Utente");

			switch (azione) {
			case 0: {
				req.setAttribute("tipo", req.getParameter("tipo"));
				req.getRequestDispatcher("registrazione.jsp").forward(req, resp);
				break;
			}
			case 1: {
				sessione.invalidate();
				req.getRequestDispatcher("login.jsp").forward(req, resp);
				break;

			}
			case 2: {
				req.getRequestDispatcher("admin/aggiungiEvento.jsp").forward(req, resp);
				break;
			}
			case 3: {
				req.setAttribute("listaEventi", gestioneDB.mostraEventiAperti());
				req.getRequestDispatcher("admin/chiudiEvento.jsp").forward(req, resp);
				break;
			}
			case 4: {
				req.setAttribute("listaEventi", gestioneDB.mostraEventi());
				req.getRequestDispatcher("admin/menuAdmin.jsp").forward(req, resp);
				break;
			}
			case 5: {
				gestioneDB.rimuoviEvento(Long.parseLong(req.getParameter("idEvento")));
				req.setAttribute("messaggio", "Evento rimosso");
				req.setAttribute("listaEventi", gestioneDB.mostraEventi());
				req.getRequestDispatcher("admin/menuAdmin.jsp").forward(req, resp);
				break;
			}
			case 6: {
				req.setAttribute("evento", gestioneDB.findEvento(Long.parseLong(req.getParameter("idEvento"))));
				req.getRequestDispatcher("admin/info.jsp").forward(req, resp);
				break;
			}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "Devi prima accedere");
		req.getRequestDispatcher(req.getContextPath() + "login.jsp").forward(req, resp);
	}
}
