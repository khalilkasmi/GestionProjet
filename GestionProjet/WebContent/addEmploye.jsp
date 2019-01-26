<%@page import="com.gestioProjet.entities.Equipe"%>
<%@page import="java.util.List"%>
<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%
		List<Equipe> equipes = emp.getAllEquipes();
	%>


<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">
				<form action="employecontroller" method="POST">
					<fieldset>

						<div class="form-group">
							<label for="exampleInputEmail1">Date de Naissance</label> <input
								type="date" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="daten"
								 required>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Email</label> <input type="email"
								name="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="daten"
								placeholder="Enter email" required>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Nom</label> <input type="text"
								name="nom" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="daten"
								placeholder="Enter name" required>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Prenom</label> <input type="text"
								name="prenom" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="daten"
								placeholder="Enter last name" required>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Password</label> <input
								type="password" name="pass" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="daten"  required>
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
									for (Equipe e : equipes) {
								%>
								<option value=<%=e.getId()%>><%=e.getNomEquipe()%></option>
								<%
									}
								%>
							</select>
						</div>
						<button type="submit" class="btn btn-primary" name="addEmloye"
							value="ajouter">Ajouter</button>
					</fieldset>
				</form>
		
</div>
</div>
</div>






</body>
</html>