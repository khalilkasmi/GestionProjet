<%@page import="com.gestioProjet.entities.Employe"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.gestioProjet.entities.Taches"%>
<%@page import="java.util.List"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
<body>

<%!EmployeModel emp = new EmployeModel();%>
<% Employe e = (Employe) session.getAttribute("e"); %>
<%
	List<Taches> taches = emp.getTaches(e.getId());
%>

<div class="container">
<div class="row">

			<div class="col-12 mx-auto">

				<nav class="navbar navbar-expand-lg navbar-light ">
					<a class="navbar-brand" href="#">Mes Taches</a>
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
		<th scope="col">description</th>
		<th scope="col">charge</th>
		<th scope="col">priorite</th>
		<th scope="col">status</th>
		<th scope="col">projet</th>
		<th scope="col"></th>
	</tr>
	</thead>
	<tbody>
	<% for(Taches t : taches){ %>
		<tr>
			<th><%= t.getId() %></th>
			<th><%= t.getDescriptionTache() %></th>
			<th><%= t.getChargeHoraireTache() %></th>
			<th><%= t.getPrioriteTache() %></th>
			<th><%= t.getStatusTache() %></th>
			<th><%= t.getProjet().getCodePro() %></th>
			<th>
			<a  class="btn btn-warning btn-sm" href="Updatete.jsp?idt=<%= t.getId() %>">editer</a>
			</th>
		</tr>
	<% } %>
	</tbody>
</table>
		</div>
	</div>
</div>

</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>