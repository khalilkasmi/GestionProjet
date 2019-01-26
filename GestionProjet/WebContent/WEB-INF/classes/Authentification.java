package com.gestioProjet.Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.gestionProjet.DAO.*;

/**
 * Servlet implementation class Authentification
 */
//@WebServlet("/Authentification")
public class Authentification extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmployeModel empl = new EmployeModel();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Authentification() {
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
		doPost(request, response);

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
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String role;
			if (empl.authentification(email, pass)) {
				role = empl.getRole(email);
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("role", role);
				Employe emp =  empl.getByEmail(email);
				session.setAttribute("id",emp.getId());
				session.setAttribute("nom",emp.getNomEmpl());
				session.setAttribute("prenom",emp.getPrenomEmpl());
				session.setAttribute("e", emp);
				if (role.equals("Employe")) {
					response.sendRedirect("EmpIndex.jsp");
				} else if (role.equals("Admin")) {
					response.sendRedirect("AdminIndex.jsp");
				} else if (role.equals("Chef")) {
					response.sendRedirect("ChefIndex.jsp");
				}
			}else{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				//out.print("<h3><b>email ou password est non valide</b></h3>");
				RequestDispatcher dispatcher = request.getRequestDispatcher("loginPage.jsp");
				request.setAttribute("err","false");
				dispatcher.include(request,response);
			}

		} catch (Exception e) {
			// TODO: handle exception
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			//out.print("<h3><b>email ou password est non valide</b></h3>");
			RequestDispatcher dispatcher = request.getRequestDispatcher("loginPage.jsp");
			request.setAttribute("err","false");
			dispatcher.include(request,response);
		}
	}

}
