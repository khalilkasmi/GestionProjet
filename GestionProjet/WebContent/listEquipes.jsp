<%@page import="com.gestioProjet.entities.Equipe"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>
<body>
<% List<Equipe> e = (List<Equipe>) session.getAttribute("eqp"); %>
	<div class="container mt-12">

		<div class="row">

			<div class="col-12 mx-auto">

				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">resultat de la recherche</a>
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
							<th scope="col">nom</th>
							<th scope="col">description</th>
							<th scope="col">editer</th>
							<th scope="col">supprimer</th>
						</tr>
					</thead>
					<tbody>
						<% for(Equipe eq : e) { %>

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
	
	
	
</body>
</html>