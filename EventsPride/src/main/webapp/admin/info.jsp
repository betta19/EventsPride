<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  background-color: white; 
  color: black; 
  border: 4px solid #008080 ;
  width: 400px;
  height: 50px;
  margin-top: 25%;
}

.button1:hover {
  background-color: teal;
  color: white;
}
</style>
<body class="w3-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-black w3-text-white w3-card-4">
        <div class="w3-display-container">
          <img  src="data:image/png;base64,<c:out value="${evento.getFoto()}" />" style="width:100%" alt="Avatar">
        </div>
        <br>
        <div class="w3-container">
            <h2>Nome Evento: <c:out value="${evento.getNome()}" /></h2><br>	
          <p><i class="fa fa-calendar fa-fw w3-margin-right w3-large w3-text-teal"></i>Data apertura: <c:out value="${evento.getDataApertura()}" /></p>
          <p><i class="fa fa-group fa-fw w3-margin-right w3-large w3-text-teal"></i>Numero Partecipanti: <c:out value="${evento.getListaUtenti().size()}" /> </p>
          <p><i class="fa fa-trophy fa-fw w3-margin-right w3-large w3-text-teal"></i>Vincitori: <c:forEach items="${evento.getEsito().getUtentiScelti()}" var="listaVincitori"><c:out value="${listaVincitori.getUsername()}" /> <br></c:forEach></p>
		<br>
		<form action="controllo" method="post">
	      <button type="submit" class="button1" name="azione" value="4">Indietro</button>
		</form>
		<br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card w3-black w3-margin-bottom">
        <h2 class="w3-text-white w3-padding-16"><i class="fa fa-address-book-o fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Lista Partecipanti</h2>
        <div class="w3-container">
    
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
    
        </div>
        
      </div>

      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

</body>
</html>