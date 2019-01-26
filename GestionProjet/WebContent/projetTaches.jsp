<%@page import="com.gestioProjet.entities.Employe"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@page import="java.util.List"%>
<%@page import="com.gestioProjet.entities.Taches"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%
		List<Taches> taches = emp.getTaches(emp.getByCode(request
				.getParameter("id")));
	%>
	<div class="container mt-12">
		<div class="row">
			<div class="col-12 mx-auto">
				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">List des Taches</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarColor03" aria-controls="navbarColor03"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarColor03">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link"
								data-toggle="modal" data-target="#addTache">Ajouter Tache </a></li>
						</ul>

					</div>
				</nav>
			</div>
		</div>
		<!-- 			<div class="collapse navbar-collapse" id="navbarColor03"> -->
		<!-- 				<ul class="navbar-nav ml-auto"> -->
		<!-- 					<li class="nav-item active"><a class="nav-link" -->
		<!-- 						data-toggle="modal" data-target="#addProjet">Ajouter tache </a></li> -->
		<!-- 					<li class="nav-item active"><a -->
		<%-- 						href="addTache.jsp?proId=<%=request.getParameter("id")%>"></a></li> --%>
		<!-- 				</ul> -->

		<!-- 			</div> -->

		<div class="row">
			<div class="col-12 mx-auto">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">id</th>
							<th scope="col">description</th>
							<th scope="col">charge</th>
							<th scope="col">priorite</th>
							<th scope="col">status</th>
							<th scope="col">projet</th>
							<th scope="col">Employe</th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<%
						for (Taches t : taches) {
					%>
					<tbody>

						<tr>
							<th><%=t.getId()%></th>
							<th><%=t.getDescriptionTache()%></th>
							<th><%=t.getChargeHoraireTache()%></th>
							<th><%=t.getPrioriteTache()%></th>
							<th><%=t.getStatusTache()%></th>
							<th><%=t.getProjet().getCodePro()%></th>
							<th><%=t.getEmploye().getNomEmpl()%></th>
							<th><a class="btn btn-warning btn-sm"
								href="updateTache.jsp?idt=<%=t.getId()%>">editer</a></th>
							<th><a class="btn btn-danger btn-sm"
								href="tacheController?idtach=<%=t.getId()%>">supprimer</a></th>
						</tr>

					</tbody>
					<%
						}
					%>
				</table>
			</div>
		</div>
	</div>
	<div class="modal" id="addTache">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Ajouter Tache</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- content -->

					<%!List<Employe> employes = emp.getEmpEmploye();%>
					<form action="tacheController" method="POST">
						<fieldset>
							<legend>Ajouter Tache</legend>
							<div class="form-group">
								<label for="exampleInputEmail1">project</label> <input
									type="text" name="codep"
									value="<%=request.getParameter("id")%>" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">charge horaire</label> <input
									type="text" name="charge" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">date debut</label> <input
									type="date" name="datedebut" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">date fin</label> <input
									type="date" name="datefin" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">descritption</label> <input
									type="text" name="description" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">priorite</label> <input
									type="text" name="priorite" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
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
								<label for="exampleSelect2">employe</label> <select
									name="employeId" multiple="" class="form-control"
									id="exampleSelect2">
									<%
										for (Employe em : employes) {
									%>
									<option value="<%=em.getId()%>"><%=em.getNomEmpl()%></option>
									<%
										}
									%>
								</select>
							</div>

							</select> <input class="btn btn-primary" type="submit" name="addP"
								value="ajouter">
						</fieldset>
					</form>


					<!--  ///// -->
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>