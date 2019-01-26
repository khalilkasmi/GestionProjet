<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<div class="container">

		<div class="row">
			<div class="col-6 mx-auto">
				<form action="equipeController" method="POST">
					<fieldset>
						<legend>Ajouter Equipe</legend>

						<div class="form-group">
							<label for="exampleInputEmail1">ID</label> <input type="text"
								class="form-control" name="codeE" id="exampleInputEmail1"
								placeholder="Leave Empty">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Nom</label> <input type="text"
								class="form-control" name="nom" id="exampleInputEmail1"
								placeholder="Enter name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Description</label> <input
								type="text" class="form-control" name="desc"
								id="exampleInputEmail1" placeholder="Enter breif description">

						</div>
					</fieldset>
					<button name="addE" value="valider" class="btn btn-primary">Ajouter</button>
					</fieldset>
				</form>
			</div>
		</div>

	</div>




</body>
</html>