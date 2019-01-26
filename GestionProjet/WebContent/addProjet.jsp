<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<body>

	<div class="container">
		<div class="row">
			<div class="col-6 mx-auto">
				<form action="projectController" method="POST">
					<fieldset>
						<legend>Ajouter un Projet</legend>

						<div class="form-group">
							<label for="exampleInputEmail1">Code</label> <input type="text"
								name="code" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Code de projet">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">Charge Horaire</label> <input
								type="text" name="charge" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="charge horaire du projet">
						</div>


						<div class="form-group">
							<label for="exampleInputEmail1">description</label> <input
								type="text" name="description" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								placeholder="brief description">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">nom</label> <input type="text"
								name="nom" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="nom du projet">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">chef</label> <input type="text"
								value="<%=session.getAttribute("nom")%>" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" disabled>
						</div>

						<input type="submit" class="btn btn-primary" name="addP"
							value="ajouter">
					</fieldset>
				</form>
			</div>
		</div>
	</div>

</body>
</html>