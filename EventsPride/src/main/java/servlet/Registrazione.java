package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import javax.mail.MessagingException;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modelli.Utente;
import utility.Crittografia;
import utility.Email;
import utility.GestioneDB;
@MultipartConfig
@WebServlet(name = "registrazione", urlPatterns = "/registrazione")
public class Registrazione extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("messaggio", "hai provato a fare l'accesso all'aggiunta di un prodotto dalla get");
		req.getRequestDispatcher("login.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			GestioneDB gestioneDB = new GestioneDB(
					(EntityManagerFactory) getServletContext().getAttribute("emf"));
			
			HttpSession sessione = req.getSession();
			Utente utente = new Utente();
			utente.setNome(req.getParameter("nome"));
			utente.setCognome(req.getParameter("cognome"));
			utente.setUsername(req.getParameter("user"));
			utente.setPassword(Crittografia.encrypt(req.getParameter("password")));
			utente.setMail(req.getParameter("email"));
			utente.setTipo(req.getParameter("tipo"));
			Part image = req.getPart("image");
			InputStream f = image.getInputStream();
			byte[] imageBytes = new byte[(int) image.getSize()];
			f.read(imageBytes, 0, imageBytes.length);
			f.close();
			utente.setFoto(Base64.getEncoder().encodeToString(imageBytes));
			
			
			if (gestioneDB.controlloUtente(utente) != null) {
				req.setAttribute("messaggio", "utente già esistente");
				req.getRequestDispatcher("login.jsp").forward(req, resp);

			} else {
				gestioneDB.aggiungiUtente(utente);
				Email.sendEmail(utente.getMail(), "Conferma Mail",
						generaLinkValidazioneUtente(utente));
				req.setAttribute("messaggio", "utente aggiunto,controllare l'email");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			}
		} catch (MessagingException e) {
			req.setAttribute("messaggio", "utente Non aggiunto");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
			e.printStackTrace();
		}
	}

	private String generaLinkValidazioneUtente(Utente utente) {
		String validationPath = "http://localhost:8080/EventsPride/validazione?utente=";
		return "Per attivare la mail clicca su questo link: " + validationPath + utente.getId();
	}

}
