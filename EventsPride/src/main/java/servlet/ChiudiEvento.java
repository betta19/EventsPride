package servlet;

import java.io.IOException;

import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
	db.cambioStato(idEvento);
req.setAttribute("listaEventi", db.mostraEventi());
req.getRequestDispatcher("admin/chiudiEvento.jsp").forward(req, resp);
	}
}
