package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelli.Evento;
import modelli.Utente;
import utility.GestioneDB;

@WebServlet(name = "chiudiEvento", urlPatterns = { "/chiudiEvento" })
public class ChiudiEvento extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	req.getRequestDispatcher("/home.jsp").forward(req, resp);
}
@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
	GestioneDB db = new GestioneDB((EntityManagerFactory) getServletContext().getAttribute("emf"));
	long idEvento = Long.parseLong(req.getParameter("idEvento"));
	Evento e = db.cambioStato(idEvento);
	List<Utente> lista = new ArrayList<>();
	for (int i = 0; i < Integer.parseInt(req.getParameter("numero")); i++) {
		lista.add(estraiRandom(e.getListaUtenti()));
	}
	db.salvaEsito(e.getId(), lista);
req.setAttribute("listaEventi", db.mostraEventi());
req.getRequestDispatcher("admin/chiudiEvento.jsp").forward(req, resp);
	}
public Utente estraiRandom(List<Utente> lista) {
	 int index = (int) (Math.random() * lista.size());
	 return lista.get(index);
}
}
