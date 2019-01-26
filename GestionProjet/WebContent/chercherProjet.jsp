<%@page import="java.util.List"%>
<%@page import="com.gestioProjet.entities.Projet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<body>
	<%
		List<Projet> projets = (List<Projet>) session
				.getAttribute("resRech");
	%>
	<%
		if (projets == null) {
	%>
	<h1>no results</h1>
	<%
		} else {
	%>
	<div class="container mt-12">
		<div class="row">
			<div class="col-12 mx-auto">
				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">Resultat de la recherche</a>
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
		<%
			}
		%>
	
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
