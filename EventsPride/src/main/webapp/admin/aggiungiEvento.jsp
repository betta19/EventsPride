<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html lang="en">
<title>AggiungiEvento</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
input[type=text],[type=number],[type=datetime-local],select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc; 
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color:gray;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: teal;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
.w3-bar,h1,button {font-family: "Montserrat", sans-serif}
.fa-anchor,.fa-coffee {font-size:200px}
</style>
<body>
<!-- Header -->
<header class="w3-container w3-black w3-center" style="padding:32px 16px">
  <h1 class="w3-margin w3-jumbo">Aggiungi un Evento</h1>
  <p class="w3-xlarge">Inserisci i dati richiesti per continuare oppure torna indietro</p>
	
</header>

<!-- First Grid -->
<div class="w3-row-padding w3-container" style="padding-top: 64px; padding-bottom: 64px;">
  <div class="w3-content">
    <div class="w3-twothird">
      <h1>Inserisci i seguenti dati per creare un nuovo evento:</h1>
		<form action="aggiungiEvento" method="post" enctype="multipart/form-data">
			<input name="nome" id="nome" type="text" placeholder="Nome Evento" required="required">
			<label for="image">Inserisci l'immagine dell'evento : </label><br>
			<input name="image" id="image" type="file"  placeholder="Foto evento" required="required">

			<input type="submit" value="Aggiungi">
		</form>
		<form action="<%=request.getContextPath()%>/admin/controlloAdmin" method="post">
    <button class="w3-button w3-teal w3-padding-large w3-large w3-margin-top" name="azione" value="4">Torna Indietro</button>
	</form>
    </div>

    <div class="w3-third w3-center">
      <img style="width: 380px;" alt="imageCod" src="https://image.winudf.com/v2/image/Y29tLkZpcmV3b3Jrc0xpdmVXYWxscGFwZXJfc2NyZWVuXzJfMTUzODQ3NTc1Ml8wNjE/screen-2.jpg?fakeurl=1&type=.jpg">
    </div>
  </div>
</div>
<!-- Footer -->
<footer class="w3-container w3-padding-35 w3-center w3-black">  
 <p>Powered by <a href="https://www.instagram.com/thefinalplayer_psn/" target="_blank">thefinalplayer_psn</a></p>
</footer>
</body>
</html>

