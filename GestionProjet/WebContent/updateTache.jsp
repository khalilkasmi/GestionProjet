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
	<%
		Taches t = emp.getTacheById((Integer.parseInt(request
				.getParameter("idt"))));
	%>
	<%
		if (request.getAttribute("err") != null) {
	%>
	<div class="alert alert-dismissible alert-danger">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<strong>Oh snap!</strong>
		<%=request.getAttribute("err")%>
	</div>
	<%
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">

				<form action="tacheController" method="POST">
					<fieldset>
						<legend>
							Update Tache :
							<%=request.getParameter("idt")%></legend>
						<div class="form-group">
							<label for="exampleInputEmail1">Id Tache</label> <input
								type="text" name="id" value="<%=request.getParameter("idt")%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">project</label> <input
								type="text" value="<%=t.getProjet().getCodePro()%>"
								placeholder="<%=t.getProjet().getCodePro()%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">charge horaire</label> <input
								type="text" value="<%=t.getChargeHoraireTache()%>"
								placeholder="<%=t.getChargeHoraireTache()%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">date debut*</label> <input
								type="date" name="dateDebut"
								value="<%=t.getDateDebutTache()%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">date fin*</label> <input
								type="date" name="dateFin" value="<%=t.getDateFinTache()%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">descritption</label> <input
								type="text" value="<%=t.getDescriptionTache()%>"
								placeholder="<%=t.getDescriptionTache()%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">priorite</label> <input
								type="text" value="<%=t.getPrioriteTache()%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
						</div>
						<div class="form-group">
							<label for="exampleSelect2">status*</label> <select name="status"
								multiple="" class="form-control" id="exampleSelect2">
								<option value="A faire">a faire</option>
								<option value="en cour">en cours</option>
								<option value="termine">terminé</option>
							</select>
						</div>
						<div class="form-group">
							<label for="exampleSelect2">employe*</label> <select
								name="employeId" multiple="" class="form-control"
								id="exampleSelect2">

								<%!List<Employe> employes = emp.getEmpEmploye();%>
								<%
									for (Employe em : employes) {
								%>
								<option value="<%=em.getId()%>"><%=em.getNomEmpl()%></option>
								<%
									}
								%>
							</select>
						</div>

						</select> <input class="btn btn-primary" type="submit" name="updateT"
							value="valider">
					</fieldset>
				</form>
			</div>
		</div>
	</div>







</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>