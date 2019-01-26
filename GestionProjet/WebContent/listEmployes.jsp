<%@page import="com.gestioProjet.entities.Employe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%
		List<Employe> e = (List<Employe>) session.getAttribute("employes");
	%>

	<div class="container">

	<div class="row">

		<div class="col-12 mx-auto">

			<nav class="navbar navbar-expand-lg navbar-light "> <a
				class="navbar-brand" href="#">resultat de la recherche</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarColor03" aria-controls="navbarColor03"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

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
						for (Employe p : e) {
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
</body>
</html>