package com.gestioProjet.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.gestioProjet.entities.Employe;
import com.gestionProjet.DAO.EmployeModel;

/**
 * Servlet implementation class Employecontroller
 */
@WebServlet("/employecontroller")
public class EmployeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			HttpSession session = request.getSession();
			EmployeModel emp = new EmployeModel();
			
			int id = Integer.parseInt(request.getParameter("ide"));
			
			Employe e = emp.getById(id);
			if (e.getEmailEmpl().equals(session.getAttribute("email"))) {
				throw new Exception("cannot delete current user");
			}else{
			emp.deleteEmloye(e);
			response.sendRedirect("AdminIndex.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			EmployeModel emp = new EmployeModel();
			if (request.getParameter("addEmloye")!=null) {
				Date daten = Date.valueOf(request.getParameter("daten"));
				String email = request.getParameter("email");
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String pass = request.getParameter("pass");
				String role = request.getParameter("role");
				int equipe = Integer.parseInt(request.getParameter("equipe"));
				Employe e= new Employe(nom,prenom,role,pass,email,daten);
				e.setEquipe(emp.getEquipeById(equipe));
				emp.addEmploye(e);
				response.sendRedirect("AdminIndex.jsp");
			}else if (request.getParameter("UpdateEmloye")!=null) {
				int ide = Integer.parseInt(request.getParameter("idemp"));
				Date daten = Date.valueOf(request.getParameter("daten"));
				String email = request.getParameter("email");
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String pass = request.getParameter("pass");
				String role = request.getParameter("role");
				int equipe = Integer.parseInt(request.getParameter("equipe"));
				Employe e= new Employe(nom,prenom,role,pass,email,daten);
				e.setEquipe(emp.getEquipeById(equipe));
				emp.updateEmploye(ide,nom,prenom,role,pass, email,daten,emp.getEquipeById(equipe));
				response.sendRedirect("AdminIndex.jsp");
			}else if (request.getParameter("chercherE") != null) {
				String codee = request.getParameter("codeE");
				List<Employe> emps = emp.searchEmloye(codee,codee,codee);
				HttpSession session = request.getSession();
				session.setAttribute("employes",emps);
				response.sendRedirect("listEmployes.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}
	}

}
