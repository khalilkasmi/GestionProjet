<%@page import="com.gestioProjet.entities.Employe"%>
<%@page import="java.util.List"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@page import="com.gestioProjet.entities.Taches"%>
<%@page import="com.gestioProjet.Controller.tacheController"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%!List<Employe> employes = emp.getAllEmployes();%>
	<%
		Taches t = emp.getTacheById((Integer.parseInt(request
				.getParameter("idt"))));
	%>
	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">

				<form action="tacheControllerEmp" action="POST">
					<fieldset>
						<legend>
							Edition de la tache :
							<%=request.getParameter("idt")%></legend>

						<div class="form-group">
							<label for="exampleInputEmail1">Id Tache</label> <input
								class="form-control" type="text" name="id"
								value="<%=request.getParameter("idt")%>"
								placeholder=<%=request.getParameter("idt")%>>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Code Projet</label> <input
								class="form-control" type="text"
								value="<%=t.getProjet().getCodePro()%>"
								placeholder="<%=t.getProjet().getCodePro()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Charge</label> <input
								class="form-control" type="text"
								value="<%=t.getChargeHoraireTache()%>"
								placeholder="<%=t.getChargeHoraireTache()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Priorite</label> <input
								class="form-control" type="text"
								value="<%=t.getPrioriteTache()%>"
								placeholder="<%=t.getPrioriteTache()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Description</label> <input
								class="form-control" type="text"
								value="<%=t.getDescriptionTache()%>"
								placeholder="<%=t.getDescriptionTache()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Date Debut*</label> <input
								class="form-control" type="date" name="dateDebut"
								value="<%=t.getDateDebutTache()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Date Fin*</label> <input
								class="form-control" type="date" name="dateFin"
								value="<%=t.getDateFinTache()%>">
						</div>

						<div class="form-group">
							<label for="exampleSelect1">Status*</label> <select
								class="form-control" id="exampleSelect1" name="status">
								<option value="A faire">a faire</option>
								<option value="en cours">en cours</option>
								<option value="terminé">terminé</option>
							</select>
						</div>

						</select> <input class="btn btn-primary" type="submit" value="valider">
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>