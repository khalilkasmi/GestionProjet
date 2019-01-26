package com.gestioProjet.Controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gestioProjet.entities.Employe;
import com.gestionProjet.DAO.EmployeModel;

/**
 * Servlet implementation class tacheControllerEmp
 */
@WebServlet("/tacheControllerEmp")
public class tacheControllerEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tacheControllerEmp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		EmployeModel emplm = new EmployeModel();
		int tacheId = Integer.parseInt(request.getParameter("id"));
		System.out.println(tacheId);
		session.setAttribute("idTache", tacheId);

		Date dateDebutTache = Date.valueOf(request.getParameter("dateDebut"));
		Date dateFinTache = Date.valueOf(request.getParameter("dateFin"));
		String status = request.getParameter("status");
		//int idEmpl = Integer.parseInt(request.getParameter("employeId"));
		//Employe e = emplm.getByEmail((String) session.getAttribute("email"));
		emplm.updateTache(tacheId, status, dateDebutTache, dateFinTache);

		response.sendRedirect("EmpIndex.jsp");
	}

}
