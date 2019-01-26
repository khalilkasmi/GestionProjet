package com.gestioProjet.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gestioProjet.entities.Employe;
import com.gestioProjet.entities.Projet;
import com.gestionProjet.DAO.EmployeModel;

/**
 * Servlet implementation class deleteProjet
 */
@WebServlet("/projectController")
public class ProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			EmployeModel empl = new EmployeModel();
			String codep = request.getParameter("id");
			empl.deleteProjet(empl.getByCode(codep));
			
			response.sendRedirect("ChefIndex.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("ChefIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("updateP")!=null) {
			EmployeModel emp = new EmployeModel();
			String code=request.getParameter("code");
			int charge = Integer.parseInt(request.getParameter("chargeH"));
			String desc = request.getParameter("description");
			String nom = request.getParameter("nom");
			emp.updateProjet(code, nom, desc, charge);
			response.sendRedirect("ChefIndex.jsp");
		}
		if (request.getParameter("addP")!=null) {
			HttpSession session = request.getSession();
			EmployeModel emp = new EmployeModel();
			String code=request.getParameter("code");
			int charge = Integer.parseInt(request.getParameter("charge"));
			String desc = request.getParameter("description");
			String nom = request.getParameter("nom");
			Projet p = new Projet(code, nom, desc, charge);
			p.setEmploye(emp.getByEmail((String) session.getAttribute("email")));
			emp.ajouterProjet(p);
			response.sendRedirect("ChefIndex.jsp");
		}else
			if(request.getParameter("chercherP")!=null){
				HttpSession session= request.getSession();
				EmployeModel emplm = new EmployeModel();
				String codep =  request.getParameter("codep");
				Employe chef = (Employe) emplm.getByEmail((String) session.getAttribute("email"));
				session.setAttribute("resRech",emplm.searchProjet(codep,codep,chef.getId()));
				response.sendRedirect("chercherProjet.jsp");
			}
	}

}
