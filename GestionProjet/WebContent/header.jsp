<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://bootswatch.com/4/lux/bootstrap.min.css"
	crossorigin="anonymous">
<title><%=session.getAttribute("nom")%> :: <%=session.getAttribute("role")%></title>
</head>
<nav
		class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<a class="navbar-brand" href="#">E-PROJET</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor03" aria-controls="navbarColor03"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor03">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="#"><%=session.getAttribute("nom")%> | <%=session.getAttribute("prenom")%><span
						class="sr-only">(current)</span> </a></li>
				<li class="nav-item"><a
					class="nav-link btn btn-secondary my-2 my-sm-0" href="Deconnexion">se
						deconnecter</a></li>
			</ul>
		</div>
	</nav>