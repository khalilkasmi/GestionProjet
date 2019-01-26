<%@page import="com.gestionProjet.DAO.EmployeModel"%>
<%@page import="com.gestioProjet.entities.Projet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<jsp:include page="header.jsp"></jsp:include>

<body>
	<%!EmployeModel emp = new EmployeModel();%>
	<%
		Projet p = emp.getByCode(request.getParameter("id"));
	%>



	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">
				<form action="projectController" method="POST">
					<fieldset>
						<legend>
							update projet code :
							<%=p.getCodePro()%></legend>

						<div class="form-group">
							<label for="exampleInputEmail1">Code</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="code"
								value="<%=p.getCodePro()%>" placeholder="<%=p.getCodePro()%>"
								>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Charge Horaire</label> <input
								ttype="text" name="chargeH" value="<%=p.getChargeHorairePro()%>"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp"
								placeholder="<%=p.getChargeHorairePro()%>">
						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">description</label> <input
								type="text" name="description"
								value="<%=p.getDescriptionPro()%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="<%=p.getDescriptionPro()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">nom</label> <input type="text"
								name="nom" value="<%=p.getNomPro()%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="<%=p.getNomPro()%>">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">chef</label> <input type="text"
								value="<%=session.getAttribute("nom")%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" disabled>
						</div>

						<input type="submit" class="btn btn-primary" name="updateP"
							value="valider">
					</fieldset>
				</form>
			</div>
		</div>
	</div>


</body>

<jsp:include page="footer.jsp"></jsp:include>

</html>