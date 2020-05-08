package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelli.Evento;
import modelli.Utente;
import utility.GestioneDB;

@WebServlet(name = "chiudiEvento", urlPatterns = { "/admin/chiudiEvento" })
public class ChiudiEvento extends HttpServlet {
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
		Set<Integer> numeri = new LinkedHashSet<>();
		int scelta = Integer.parseInt(req.getParameter("numero"));
		if (e.getListaUtenti().size() <= 3) {
			switch (scelta) {
			case 1:
				if (e.getListaUtenti().size() == 1) {
					lista.add(e.getListaUtenti().get(0));
				} else {
					for (int i = 0; i < scelta; i++) {
						numeri.add(estraiRandom(e.getListaUtenti().size()));
					}
				}
				break;
			case 2:
				if (e.getListaUtenti().size() == 2) {
					lista.add(e.getListaUtenti().get(0));
					lista.add(e.getListaUtenti().get(1));
				} else {
					for (int i = 0; i < scelta; i++) {
						numeri.add(estraiRandom(e.getListaUtenti().size()));
					}
				}
				break;
			case 3:
				if (e.getListaUtenti().size() == 3) {
					lista.add(e.getListaUtenti().get(0));
					lista.add(e.getListaUtenti().get(1));
					lista.add(e.getListaUtenti().get(2));
				}
				break;

			}
		} else {
			for (int i = 0; i < scelta; i++) {
				numeri.add(estraiRandom(e.getListaUtenti().size()));
			}
		}
		for (Integer integer : numeri) {
			lista.add(e.getListaUtenti().get(integer));
		}
		db.salvaEsito(e.getId(), lista);
		req.setAttribute("messaggio", "Estrazione andata a buon fine!");
		req.setAttribute("listaEventi", db.mostraEventi());
		req.getRequestDispatcher("admin/menuAdmin.jsp").forward(req, resp);
	}

	//public Utente estraiRandom(List<Utente> lista) {
	//	int index = (int) (Math.random() * lista.size());
	//	return lista.get(index);
	//}
	public int estraiRandom(int max) {
		  Random rand = new Random();
		  int randomNum = rand.nextInt(max);
		  return randomNum;
		}
}
