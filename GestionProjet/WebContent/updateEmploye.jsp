<%@page import="java.util.List"%>
<%@page import="com.gestioProjet.entities.Equipe"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@page import="com.gestioProjet.entities.Employe"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%
		Employe p = (Employe) emp.getById(Integer.parseInt(request
				.getParameter("id")));
	%>

	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto mt-6 pt-6">
				<form action="employecontroller" method="POST">
					<fieldset>
						<legend>
							Update Employe :
							<%=p.getNomEmpl()%></legend>
						<div class="form-group">
							<label for="exampleInputEmail1">Id</label> <input type="text"
								class="form-control" name="idemp" value="<%=p.getId()%>"
								id="exampleInputEmail1" placeholder="do no modify">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Date Naissance</label> <input
								type="date" class="form-control" name="daten"
								value="<%=p.getDateNaissanceEmpl()%>" id="exampleInputEmail1">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="Email"
								class="form-control" name="email"
								value="<%=p.getEmailEmpl()%>" id="exampleInputEmail1"
								placeholder="employe's email">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Nom</label> <input type="text"
								class="form-control" name="nom" value="<%=p.getNomEmpl()%>"
								id="exampleInputEmail1" placeholder="employe's first name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Prenom</label> <input type="text"
								class="form-control" name="prenom"
								value="<%=p.getPrenomEmpl()%>" id="exampleInputEmail1"
								placeholder="employe's last name">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" class="form-control" name="pass"
								id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-group">
							<label for="exampleSelect1">Role</label> <select
								class="form-control" id="exampleSelect1" name="role">
								
								<option value="Admin">Admin</option>
								<option value="Chef">Chef</option>
								<option value="Employe">Employe</option>

							</select>
						</div>
						<div class="form-group">
							<label for="exampleSelect1">Equipe</label> <select
								class="form-control" id="exampleSelect1" name="equipe">
								<%
									List<Equipe> equipes = (List<Equipe>) emp.getAllEquipes();
								%>
								<%
									for (Equipe e : equipes) {
								%>

								<option value=<%=e.getId()%>><%=e.getNomEquipe()%></option>

								<%
									}
								%>
							</select>
						</div>
					</fieldset>
					<button type="submit" class="btn btn-primary" name="UpdateEmloye"
						value="editer">Submit</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>


</body>
</html>