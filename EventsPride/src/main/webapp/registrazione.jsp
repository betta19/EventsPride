<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<head>
<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body class="bg-light" >
<br>
<div class="col-md-8 order-md-1">
      <h4 class="mb-3">Registrazione</h4>
      <form class="needs-validation" action="registrazione" method="post"enctype="multipart/form-data">
        
        <div class="col-md-6 mb-3">
            <label for="nome">Nome</label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="" value="" required>
           
          </div>
          <div class="col-md-6 mb-3">
            <label for="cognome">Cognome</label>
            <input type="text" class="form-control" id="cognome" name="cognome" placeholder="" value="" required>
           
          </div>
          <div class="col-md-6 mb-3">
            <label for="user">Username</label>
            <input type="text" class="form-control" id="user" name="user" placeholder="" value="" required>
           
          </div>
          <div class="col-md-6 mb-3">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
           
          </div>
        
        <div class="col-md-6 mb-3">
          <label for="email">Email </label>
          <input type="email" class="form-control" id="email" name="email"placeholder="you@example.com">
        </div>
        <input type="file" name="image" id="image" placeholder="Inserisci l'immagine del eroe">
           <input type="hidden" id="tipo" name="tipo" value="<c:out value = "${tipo}"/>">
                
        <br>
        <br>        
        <button class="btn btn-primary btn-lg btn-block" type="submit"style="width:500px; height:50px;">Registrati</button><br>
     </form>
             
<form action="login.jsp">
  <button type="submit" class="btn btn-primary btn-lg btn-block" style="width:500px; height:50px;" >Indietro</button>  
  </form>
  
  </div>
</body>


</html>