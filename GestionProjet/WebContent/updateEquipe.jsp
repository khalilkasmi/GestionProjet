<%@page import="com.gestioProjet.entities.Equipe"%>
<%@page import="java.util.List"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">
				<%!EmployeModel emp = new EmployeModel();%>
				<%
					Equipe e = emp.getEquipeById(Integer.parseInt(request
							.getParameter("code")));
				%>
				<form action="equipeController" method="POST">
					<fieldset>
						<legend>
							Update Equipe :
							<%=e.getNomEquipe()%></legend>
						<div class="form-group">
							<label for="exampleInputEmail1">Code Equipe</label> <input
								type="text" class="form-control"  name="codeEquipe" id="exampleInputEmail1"
								 value="<%=e.getId()%>" placeholder="<%=e.getId()%>">
							
						</div> 
						<div class="form-group">
							<label for="exampleInputEmail1">Nom Equipe</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								 name="nom" value="<%=e.getNomEquipe()%>" placeholder="<%=e.getNomEquipe()%>">
							
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Description Equipe</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								 name="desc" value="<%=e.getDescriptionEquipe()%>" placeholder="<%=e.getDescriptionEquipe()%>">
							
						</div>
						<button type="submit" class="btn btn-primary" name="updateE" value="valider">Valider</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>