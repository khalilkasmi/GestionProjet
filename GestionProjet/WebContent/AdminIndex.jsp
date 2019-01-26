<%@page import="com.gestioProjet.entities.Equipe"%>
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
		List<Employe> employes = emp.getAllEmployes();
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
					<a class="navbar-brand" href="#">List des Employe</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarColor03" aria-controls="navbarColor03"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarColor03">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								data-toggle="modal" data-target="#addEmpl">Ajouter Employe
							</a></li>
						</ul>
						<form class="form-inline my-2 my-lg-0" action="employecontroller"
							method="POST">
							<input class="form-control mr-sm-2" type="text" name="codeE"
								placeholder="Chercher par nom,prenom,email">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit"
								name="chercherE" value="chercher">Search</button>
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
							<th scope="col">id</th>
							<th scope="col">date naissance</th>
							<th scope="col">email</th>
							<th scope="col">nom</th>
							<th scope="col">prenom</th>
							<th scope="col">role</th>
							<th scope="col">equipe</th>
							<th scope="col">editer</th>
							<th scope="col">supprimer</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Employe p : employes) {
						%>

						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getDateNaissanceEmpl()%></td>
							<td><%=p.getEmailEmpl()%></td>
							<td><%=p.getNomEmpl()%></td>
							<td><%=p.getPrenomEmpl()%></td>
							<td><%=p.getRoleEmpl()%></td>
							<td><%=p.getEquipe().getNomEquipe()%></td>
							<td><a class="btn btn-warning btn-sm"
								href="
								updateEmploye.jsp?id=<%=p.getId()%>">editer</a></td>
							<td><a class="btn btn-danger btn-sm"
								href="employecontroller?ide=<%=p.getId()%>">supprimer</a></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>

	</div>


	<!--  //////////////////////////////////////  -->

	<%
		List<Equipe> eqp = (List<Equipe>) emp.getAllEquipes();
	%>

	<div class="container mt-12">

		<div class="row">

			<div class="col-12 mx-auto">

				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">list des Equipes</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarColor03" aria-controls="navbarColor03"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarColor03">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								href="addEquipe.jsp" data-toggle="modal" data-target="#addEq">Ajouter
									Equipe </a></li>
						</ul>
						<form class="form-inline my-2 my-lg-0" action="equipeController"
							method="POST">
							<input class="form-control mr-sm-2" type="text" name="nom"
								placeholder="Chercher par nom">
							<button class="btn btn-secondary my-2 my-sm-0" type="submit"
								name="searchE" value="chercher">Search</button>
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
							<th scope="col">id</th>
							<th scope="col">nom</th>
							<th scope="col">description</th>
							<th scope="col">editer</th>
							<th scope="col">supprimer</th>
						</tr>
					</thead>
					<tbody>
						<%
							for (Equipe eq : eqp) {
						%>

						<tr>
							<th><%=eq.getId()%></th>
							<th><%=eq.getNomEquipe()%></th>
							<th><%=eq.getDescriptionEquipe()%></th>
							<th><a class="btn btn-warning btn-sm"
								href="updateEquipe.jsp?code=<%=eq.getId()%>">editer</a></th>
							<th><a class="btn btn-danger btn-sm"
								href="equipeController?codeE=<%=eq.getId()%>">supprimer</a></th>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<!-- modal update employe -->
	<div class="modal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Update Employe</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- content -->


					<!--  ///// -->
				</div>
			</div>
		</div>
	</div>
	<!--  -->


	<!--  modal add employe -->

	<div id="addEmpl" class="modal">
		<div class="modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Add New Employe</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div id="addEmploye" class="modal-body">
					<!--  modal content  -->

					<jsp:include page="addEmploye.jsp"></jsp:include>

					<!-- ///////////// -->
				</div>

			</div>
		</div>
	</div>
	<!--  modal add equipe  -->

	<div id="addEq" class="modal">
		<div class="modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Ajouter Equipe</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--  modal content -->

					 <jsp:include page="addEquipe.jsp"></jsp:include>

					<!-- /////////// -->
				</div>

			</div>
		</div>
	</div>

	<!-- /////////////////// -->

</body>


<jsp:include page="footer.jsp"></jsp:include>
</html>