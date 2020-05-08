package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import modelli.Evento;
import modelli.Utente;
import utility.GestioneDB;

@MultipartConfig
@WebServlet(name = "aggiungiEvento", urlPatterns = { "/admin/aggiungiEvento"})
public class AggiungiEvento extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/home.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		GestioneDB db = new GestioneDB((EntityManagerFactory) getServletContext().getAttribute("emf"));
		Evento evento = new Evento();
		Date data = new Date();
		DateFormat formato = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		String dataApertura= formato.format(data);
		evento.setDataApertura(dataApertura);
		Part image = req.getPart("image");
		InputStream f = image.getInputStream();
		byte[] imageBytes = new byte[(int) image.getSize()];
		f.read(imageBytes, 0, imageBytes.length);
		f.close();
		String imageStr = Base64.getEncoder().encodeToString(imageBytes);
		evento.setFoto(imageStr);
		evento.setListaUtenti(new ArrayList<Utente>());
		evento.setNome(req.getParameter("nome"));
		evento.setStato("aperto");
		db.aggiungiEvento(evento);
		req.setAttribute("listaEventi", db.mostraEventi());
		req.setAttribute("messaggio", "Evento aggiunto con successo!");
		req.getRequestDispatcher("/admin/menuAdmin.jsp").forward(req, resp);
	}
}
