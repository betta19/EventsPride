<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<head>
<meta charset="ISO-8859-1">
<title>Dettagli</title>
</head>
<body>
 <br> <br> <br> <br> <br> <br> <br> 
		<div class="container">
			<div class="row">
				<div class="col-8 align-self-center ">
					<img width="400" height="400"
						src="data:image/png;base64,<c:out value="${evento.getFoto()}" />"><br><br>
						<p>
				Nome: <c:out value="${evento.getNome()}" />
			</p>
					<p>
				Data Apertura: <c:out value="${evento.getDataApertura()}" />
			</p>
				<p>
				Vincitori: <c:forEach items="${evento.getEsito().getUtentiScelti()}" var="listaVincitori">
				<c:out value="${listaVincitori.getUsername()}" /> <br>
				</c:forEach>
			</p>
				</div>
				<div class="col-4">
						<table class="table table-striped table-dark">
								<tr>
									<th>Username</th>
									<th>Foto</th>
								</tr>

								<c:forEach items="${evento.getListaUtenti()}" var="lista">

									<tr>
										<td><c:out value="${lista.getUsername()}" /></td>


										<td><img alt="immagine"
											src="data:image/jpg;base64, <c:out value = "${lista.getFoto()}"/>"
											style="width: 45px; height: 45px; margin: auto"></td>
										
									</tr>

								</c:forEach>

							</table>

					<form action="controllo" method="post">
						<button type="submit" class="btn btn-primary btn-lg btn-block"
			name="azione" value="4" style="width: 500px; height: 50px;">Indietro</button>
					</form>
				</div>
			</div>
		</div>
</body>
</html>