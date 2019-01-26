<%@page import="com.gestioProjet.entities.Employe"%>
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
	<%!List<Employe> employes = emp.getAllEmployes();%>
	<form action="tacheController" method="POST">
		<fieldset>
			<legend>Ajouter Tache</legend>
			<div class="form-group">
				<label for="exampleInputEmail1">project</label> <input type="text"
					name="codep" value="<%=request.getParameter("id")%>"
					class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
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
				<label for="exampleInputEmail1">date fin</label> <input type="date"
					name="datefin" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">descritption</label> <input
					type="text" name="description" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp">
			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">priorite</label> <input type="text"
					name="priorite" class="form-control" id="exampleInputEmail1"
					aria-describedby="emailHelp">
			</div>
			<div class="form-group">
				<label for="exampleSelect2">status</label> <select name="status"
					multiple="" class="form-control" id="exampleSelect2">
					<option value="A faire">a faire</option>
					<option value="en cour">en cours</option>
					<option value="termine">terminé</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleSelect2">employe</label> <select name="status"
					multiple="" class="form-control" id="exampleSelect2">
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
</body>
</html>