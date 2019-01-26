package com.gestioProjet.Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gestioProjet.entities.Employe;
import com.gestioProjet.entities.Taches;
import com.gestionProjet.DAO.EmployeModel;

/**
 * Servlet implementation class tacheController
 */
@WebServlet("/tacheController")
public class tacheController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public tacheController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			if (request.getParameter("idtach") != null) {
				EmployeModel emp = new EmployeModel();
				emp.deleteTache(Integer.parseInt(request.getParameter("idtach")));
				response.sendRedirect("ChefIndex.jsp");
			}else  doPost(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("ChefIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			response.setContentType("text/html");
			HttpSession session = request.getSession();

			if (request.getParameter("updateT") != null) {
				EmployeModel emplm = new EmployeModel();
				int tacheId = Integer.parseInt(request.getParameter("id"));
				System.out.println(tacheId);
				session.setAttribute("idTache", tacheId);

				Date dateDebutTache = Date.valueOf(request.getParameter("dateDebut"));
				Date dateFinTache = Date.valueOf(request.getParameter("dateFin"));
				String status = request.getParameter("status");
				int idEmpl = Integer.parseInt(request.getParameter("employeId"));
				Employe e = emplm.getById(idEmpl);
				emplm.updateTache(tacheId, status, dateDebutTache, dateFinTache, e);

				response.sendRedirect("ChefIndex.jsp");
			}else

			if (request.getParameter("addP") != null) {
				EmployeModel emplm = new EmployeModel();

				String codep =  request.getParameter("codep");
				int charge = Integer.parseInt(request.getParameter("charge"));
				Date dateDebutTache = Date.valueOf(request.getParameter("datedebut"));
				Date dateFinTache = Date.valueOf(request.getParameter("datefin"));
				String description =  request.getParameter("description");
				String status =  request.getParameter("status");
				int priorite = Integer.parseInt(request.getParameter("priorite"));
				Employe e = emplm.getById(Integer.parseInt(request
						.getParameter("employeId")));

				System.out.println(dateDebutTache);
				
				Taches t = new Taches(description, charge, priorite, status,
						dateDebutTache, dateFinTache);
				t.setEmploye(e);
				t.setProjet(emplm.getByCode(codep));
				emplm.ajouterTache(t);

				response.sendRedirect("ChefIndex.jsp");

			}			
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("ChefIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}

	}
}
