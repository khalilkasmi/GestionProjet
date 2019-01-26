package com.gestioProjet.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javafx.beans.value.WritableBooleanValue;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gestioProjet.entities.Equipe;
import com.gestionProjet.DAO.EmployeModel;

/**
 * Servlet implementation class EquipeController
 */
@WebServlet("/equipeController")
public class EquipeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EquipeController() {
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
			int codeEquipe = Integer.parseInt(request.getParameter("codeE"));
			EmployeModel emp = new EmployeModel();
			Equipe e = emp.getEquipeById(codeEquipe);
			emp.deleteEquipe(e);
			response.sendRedirect("AdminIndex.jsp");
			
		} catch (Exception e) {
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
		EmployeModel emp = new EmployeModel();
		try {
			if (request.getParameter("addE") != null) {
				
				String desc = request.getParameter("desc");
				String nom = request.getParameter("nom");
				
				emp.addEquipe(new Equipe(nom,desc));
				response.sendRedirect("AdminIndex.jsp");
				
				
			}else if (request.getParameter("updateE") != null) {
				int codeE = Integer.parseInt(request.getParameter("codeEquipe"));
				String desc = request.getParameter("desc");
				String nom = request.getParameter("nom");
				
				emp.updateEquipe(codeE,nom,desc);

				response.sendRedirect("AdminIndex.jsp");
				
			}else if (request.getParameter("searchE") != null) {
				
				HttpSession session = request.getSession();
				String nom = request.getParameter("nom");
				List<Equipe> equipes = emp.searchEquipe(nom);
				session.setAttribute("eqp",equipes);
				response.sendRedirect("listEquipes.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			RequestDispatcher dispatcher = request.getRequestDispatcher("AdminIndex.jsp");
			request.setAttribute("err",e.getMessage());
			dispatcher.include(request,response);
		}
	}

}
