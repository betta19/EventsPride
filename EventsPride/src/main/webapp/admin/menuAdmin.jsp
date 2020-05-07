<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<title>Admin</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Montserrat", sans-serif
}

.w3-row-padding img {
	margin-bottom: 12px
}
/* Set the width of the sidebar to 120px */
.w3-sidebar {
	width: 120px;
	background: #222;
}
/* Add a left margin to the "page content" that matches the width of the sidebar (120px) */
#main {
	margin-left: 120px
}
/* Remove margins from "page content" on small screens */
@media only screen and (max-width: 600px) {
	#main {
		margin-left: 0
	}
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: none;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button4 {
	background-color: #222;
	color: white;
}

.button4:hover {
	background-color: black;
}
</style>

<body class="w3-black">

	<!-- Icon Bar (Sidebar - hidden on small screens) -->
	<nav class="w3-sidebar w3-bar-block w3-small w3-hide-small w3-center">
		<!-- Avatar image in top left corner -->
		<img
			src="data:image/jpg;base64,<c:out value = "${sessionScope.Utente.getFoto()}"/>"
			style="width: 100%"> <a href="#"
			class="w3-bar-item w3-button w3-padding-large w3-black"> <i
			class="fa fa-home w3-xxlarge"></i>
			<p>Profilo</p>
		</a> <a href="#Eventi"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-plus w3-xxlarge"></i>
			<p>Crea Evento</p>
		</a> <a href="#Admin"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-handshake-o w3-xxlarge"></i>
			<p>Registra Admin</p>
		</a> <a href="#Lista"
			class="w3-bar-item w3-button w3-padding-large w3-hover-black"> <i
			class="fa fa-eye w3-xxlarge"></i>
			<p>Lista Eventi</p>
		</a>
		<form action="controllo" method="post">
			<button class="button button4 fa fa-mail-reply w3-large "
				type="submit" name="azione" value="1">
				<p style="font-family: serif;">Logout</p>
			</button>
		</form>
	</nav>

	<!-- Navbar on small screens (Hidden on medium and large screens) -->
	<div class="w3-top w3-hide-large w3-hide-medium" id="myNavbar">
		<div
			class="w3-bar w3-black w3-opacity w3-hover-opacity-off w3-center w3-small">
			<a href="#" class="w3-bar-item w3-button"
				style="width: 25% !important">Profilo</a> <a href="#Eventi"
				class="w3-bar-item w3-button" style="width: 25% !important">Crea
				Evento</a><a href="#Admin"
				class="w3-bar-item w3-button" style="width: 25% !important">Registra
				Admin</a> <a href="#Lista" class="w3-bar-item w3-button"
				style="width: 25% !important">Eventi</a>

		</div>
	</div>

	<!-- Page Content -->
	<div class="w3-padding-large" id="main">
		<!-- Header/Home -->

		<header class="w3-container w3-padding-32 w3-center w3-black"
			id="home">
			<h1 class="w3-jumbo">
				<span class="w3-hide-small">Il tuo Dio </span>
				<c:out value="${sessionScope.Utente.getUsername()}" />
			</h1>
			<p>Creatore di Eventi.</p>
			<img
				src="data:image/jpg;base64,<c:out value = "${sessionScope.Utente.getFoto()}"/>"
				style="width: 30%;">
		</header>

		<!-- About Section -->
		<%
			String mess = (String) request.getAttribute("messaggio");
		if (mess != null) {
		%>
		<h4>
			<%=mess%>
		</h4>


		<%
			}
		%>
		<br>
		<div class="w3-content w3-justify w3-text-grey w3-padding-64"
			id="about">
			<h2 class="w3-text-light-grey">Il Mio Account</h2>
			<hr style="width: 200px" class="w3-opacity">
			<p>
				Nome:
				<c:out value="${sessionScope.Utente.getNome()}" />
			</p>
			<p>
				Cognome:
				<c:out value="${sessionScope.Utente.getCognome()}" />
			</p>
			<p>
				Username:
				<c:out value="${sessionScope.Utente.getUsername()}" />
			</p>
			<p>
				Email:
				<c:out value="${sessionScope.Utente.getMail()}" />
			</p>
			<br>
			<div class="w3-row w3-center w3-padding-16 w3-section w3-light-grey">
				<div class="w3-quarter w3-section">
					<span class="w3-xlarge">11+</span><br> Partners
				</div>
				<div class="w3-quarter w3-section">
					<span class="w3-xlarge">55+</span><br> Projects Done
				</div>
				<div class="w3-quarter w3-section">
					<span class="w3-xlarge">89+</span><br> Happy Clients
				</div>
				<div class="w3-quarter w3-section">
					<span class="w3-xlarge">150+</span><br> Meetings
				</div>
			</div>


			<div id="Eventi">
				<!-- Grid for pricing tables -->
				<h3 class="w3-padding-16 w3-text-light-grey">Eventi</h3>
				<div class="w3-row-padding" style="margin: 0 -16px">
						<ul
							class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
							<li class="w3-dark-grey w3-xlarge w3-padding-32">Crea Eventi</li>
							<li class="w3-light-grey w3-padding-24">
								<form action="controllo" method="post">
									<button
										class="w3-button w3-white w3-padding-large w3-hover-black"
										type="submit" name="azione" value="2">Crea</button>
								</form>
							</li>
						</ul>
					<!-- End Grid/Pricing tables -->
				</div>
			</div>
			<div id="Admin">
				<!-- Grid for pricing tables -->
				<h3 class="w3-padding-16 w3-text-light-grey">Admin</h3>
				<div class="w3-row-padding" style="margin: 0 -16px">
					<ul
						class="w3-ul w3-white w3-center w3-opacity w3-hover-opacity-off">
						<li class="w3-dark-grey w3-xlarge w3-padding-32">Aggiungi
							admin</li>
						<li class="w3-light-grey w3-padding-24">
							<form action="controllo" method="post">
								<input type="hidden" id="tipo" name="tipo" value="admin">
								<button
									class="w3-button w3-white w3-padding-large w3-hover-black"
									type="submit" name="azione" value="0">Aggiungi</button>
							</form>
						</li>
					</ul>
					<!-- End Grid/Pricing tables -->
				</div>
			</div>
			<br>

			<!-- Testimonials -->
			<div id="Lista">
				<h3 class="w3-padding-16 w3-text-light-grey">Lista Eventi</h3>
				<div class="container">
					<div class="row">
						<div class="col">
							<table class="table table-striped table-dark">
								<tr>
									<th>Nome</th>
									<th>Immagine</th>
									<th>Stato</th>
									<th>Rimuovi</th>
									<th>Estrai vincitori</th>
									<th>Dettagli</th>
								</tr>

								<c:forEach items="${listaEventi}" var="evento">

									<tr>
										<td><c:out value="${evento.getNome()}" /></td>


										<td><img alt="immagine"
											src="data:image/jpg;base64, <c:out value = "${evento.getFoto()}"/>"
											style="width: 45px; height: 45px; margin: auto"></td>
										<td><c:out value="${evento.getStato()}" /></td>
										<td>
											<form action="controllo" method="post">
												<input type="number" hidden="true" name="idEvento"
													value=<c:out value = "${evento.getId()}"/>>
												<button type="submit" name="azione" value="5"
													class="btn btn-danger">Rimuovi</button>
											</form>
										</td>

										<c:set var="n" value="${evento.getListaUtenti().size()}" />
										<td>
										<c:if test="${n>3}">
												<form action="chiudiEvento" method="post">
													<select name="numero">


														<c:forEach var="i" begin="1" end="3">
															<option value="<c:out value = "${i}"/>">
																<c:out value="${i}" /></option>
														</c:forEach>


													</select>


													<button type="submit" class="btn btn-warning"
														name="idEvento" value=<c:out value = "${evento.getId()}"/>>Estrazione
														</button>

												</form>



											</c:if>
											</td>

										<td>
											<form action="controllo" method="post">
												<input type="number" hidden="true" name="idEvento"
													value=<c:out value = "${evento.getId()}"/>>
												<button type="submit" name="azione" value="6"
													class="btn btn-info">Info</button>
											</form>
										</td>

									</tr>

								</c:forEach>

							</table>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<footer class="w3-content w3-padding-64 w3-text-grey w3-xlarge">
					<i class="fa fa-instagram w3-hover-opacity"></i>
					<p class="w3-medium">
						Powered by <a href="https://www.instagram.com/giuseppescalesse/"
							target="_blank" class="w3-hover-text-green">La_Casa_di_Peppe.</a>
					</p>
					<!-- End footer -->
				</footer>

				<!-- END PAGE CONTENT -->
			</div>
		</div>
</body>
</html>
