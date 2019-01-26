<%@page import="com.gestioProjet.entities.Projet"%>
<%@page import="java.util.List"%>
<%@page import="com.gestioProjet.entities.Employe"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%
		Employe e = (Employe) session.getAttribute("e");
	%>
	<%
		List<Projet> projets = emp.getAllProjets(e.getId());
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
	<div class="container mt-12">
		<div class="row">
			<div class="col-12 mx-auto">
				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">List des Projets</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarColor03" aria-controls="navbarColor03"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarColor03">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								data-toggle="modal" data-target="#addProjet">Ajouter Projet
							</a></li>
						</ul>
						<form action="projectController" method="POST" class="form-inline my-2 my-lg-0" action="employecontroller"
							method="POST">
							<input class="form-control mr-sm-2" type="text" name="codep"
								placeholder="chercher par code ou nom">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit"
								name="chercherP" value="chercher">Search</button>
						</form>
					</div>
				</nav>
			</div>
		</div>
		<div class="row">
			<div class="col-12 mx-auto">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">Code</th>
							<th scope="col">charge horaire</th>
							<th scope="col">descritpion</th>
							<th scope="col">nom</th>
							<th scope="col">modifier</th>
							<th scope="col">supprimer</th>
							<th scope="col">gerer les taches</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Projet p : projets) {
						%>
						<tr>
							<td><%=p.getCodePro()%></td>
							<td><%=p.getChargeHorairePro()%></td>
							<td><%=p.getDescriptionPro()%></td>
							<td><%=p.getNomPro()%></td>
							<td><a class="btn btn-warning btn-sm"
								href="updateProjet.jsp?id=<%=p.getCodePro()%>">editer</a></td>
							<td><a class="btn btn-danger btn-sm"
								href="projectController?id=<%=p.getCodePro()%>">supprimer</a></td>
							<td><a class="btn btn-info btn-sm"
								href="projetTaches.jsp?id=<%=p.getCodePro()%>">taches</a></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<div class="modal" id="addProjet">
		<div class="modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Ajouter Projet</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- content -->
	
					<jsp:include page="addProjet.jsp"></jsp:include>

					<!--  ///// -->
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>