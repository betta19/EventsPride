<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
<link rel="stylesheet" type="text/css" href="Register.css">
</head>
<body>

      <div class="pre_contenitore">
			<p>Registrazione</p>
		</div>
		<div class="contenitore">
		<form action="registrazione" method="post" enctype="multipart/form-data">				
		<p>Inserisci le tue credenziali</p>
					<p>
						<label>USERNAME</label><br>
							<input type="text" name="user" class="user" placeholder="Username">
					</p>
					<p>
						<label>NOME</label><br>
							<input type="text" name="nome" class="nome" placeholder="Nome">
					</p>
					<p>
						<label>COGNOME</label><br>
							<input type="text" name="cognome" class="cognome" placeholder="Cognome">
					</p>
					<p>
						<label>EMAIL</label><br>
							<input type="email" name="email" class="email" placeholder="email@gmail.com">
					</p>
					<p>
						<label>PASSWORD</label><br>
							<input type="Password" name="password" class="password" placeholder="Password">
					</p>
					<p>
						<label>IMMAGINE PROFILO</label><br>
							<input type="file" name="image" class="image" placeholder="Inserisci immagine">
					</p>
        <button class="btn btn-info btn-lg btn-block" type="submit"style="width:200px; height:30px;margin:auto;">Registrati</button><br><br>			
         <input type="hidden" id="tipo" name="tipo" value="<c:out value="${tipo}" />">
        
        </form>
			
			<% String tipo=(String)request.getAttribute("tipo");
   if(("utente").equals(tipo)) {%>
<form action="login.jsp">
  <button type="submit" class="btn btn-secondary btn-lg btn-block" style="width:100px; height:30px;margin:auto;" >Indietro</button>  
  </form>
 <%}else{ %>
 <form action="controllo" method="post">
  <button type="submit"  class="btn btn-secondary btn-lg btn-block" name="azione" value="4" style="width:100px; height:30px;margin:auto;" >Indietro</button>
 </form>
  <%} %>
			
		</div>

</body>
</html>    
