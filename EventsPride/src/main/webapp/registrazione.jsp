<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="static/perPeppe.css">

<head>
<style >
.bg {
  /* The image used */
  background-color: black;
  

  /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}
input[type="file"] {
    display: none;
}
.custom-file-upload {
    border: 2px solid white;
    display: inline-block;
    padding: 8px 16px;
    cursor: pointer;
    color: white;
    
}

</style>
<meta charset="ISO-8859-1">
<title>Registrazione</title>
</head>
<body class="bg text-center" >
<br>
<div class="container">
<div class="row">
<div class="col align-self-center">

      <h4 class="mb-3"><p class="text-md text-white">Registrazione</p></h4>
      <form class="needs-validation" action="registrazione" method="post"enctype="multipart/form-data">
        
       <br>
            <label for="nome"><p class="text-md text-white">Nome</p></label>
            <input type="text" class="form-control" id="nome" name="nome" placeholder="" value="" required>
           
          <br>
          
            <label for="cognome"><p class="text-md text-white">Cognome</p></label>
            <input type="text" class="form-control" id="cognome" name="cognome" placeholder="" value="" required>
           
         
          <br>
            <label for="user"><p class="text-md text-white">Username</p></label>
            <input type="text" class="form-control" id="user" name="user" placeholder="" value="" required>
           
        
         <br>
            <label for="password"><p class="text-md text-white">Password</p></label>
            <input type="password" class="form-control" id="password" name="password" placeholder="" value="" required>
           
     
        <br>
        
          <label for="email"><p class="text-md text-white">Email</p></label>
          <input type="email" class="form-control" id="email" name="email"placeholder="you@example.com">
     <br><br>
        <label for="file-upload" class="custom-file-upload">
								Carica Immagine </label>
        <input type="file"  name="image" id="file-upload">
           <input type="hidden" id="tipo" name="tipo" value="<c:out value = "${tipo}"/>">
                
        <br>
        <br>        
        <button class="btn btn-info btn-lg btn-block" type="submit"style="width:500px; height:50px;margin:auto;">Registrati</button><br>
     </form>
             
<% String tipo=(String)request.getAttribute("tipo");
   if(("utente").equals(tipo)) {%>
<form action="login.jsp">
  <button type="submit" class="btn btn-secondary btn-lg btn-block" style="width:500px; height:50px;margin:auto;" >Indietro</button>  
  </form>
 <%}else{ %>
 <form action="controllo" method="post">
  <button type="submit" class="btn btn-secondary btn-lg btn-block" name="azione" value="4" style="width:500px; height:50px;margin:auto;" >Indietro</button>
 </form>
  <%} %>
  
  
  </div>
 </div>
 </div>
 
</body>


</html>