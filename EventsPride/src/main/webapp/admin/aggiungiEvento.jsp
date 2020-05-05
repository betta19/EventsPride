<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
<link href='https://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.css' rel='stylesheet' type='text/css'>

<head>
<meta charset="ISO-8859-1">
<title>aggiungi evento</title>
<style>
{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
}

body {
  font: 14px/1 'Roboto', sans-serif;
  color: #fff;
  background: url('https://codepen.io/images/classy_fabric.png') #333;
  -webkit-font-smoothing: antialiased;
}

button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  vertical-align: baseline;
  border: 0;
  outline: 0;
  color: #fff;
}

button::-moz-focus-inner,
input::-moz-focus-inner {
  border: 0;
  padding: 0;
}

textarea {
  overflow: auto;
  vertical-align: top;
  resize: none;
}

[placeholder]::-webkit-input-placeholder { color: rgba(255,255,255,.8); }
[placeholder]:hover::-webkit-input-placeholder { color: rgba(255,255,255,.4); }
[placeholder]:focus::-webkit-input-placeholder { color: transparent; }

[placeholder]::-moz-placeholder { color: rgba(255,255,255,.8); }
[placeholder]:hover::-moz-placeholder { color: rgba(255,255,255,.4); }
[placeholder]:focus::-moz-placeholder { color: transparent; }

[placeholder]:-ms-input-placeholder { color: rgba(255,255,255,.8); }
[placeholder]:hover:-ms-input-placeholder { color: rgba(255,255,255,.4); }
[placeholder]:focus:-ms-input-placeholder { color: transparent; }

form {
  width: 400px;
  margin: 50px auto;
}

input[type="text"] {
  display: block;
  width: 400px;
  margin: 0 0 20px;
  padding: 8px 12px 10px 12px;
  border: 1px solid rgba(0,0,0,.5);
  background: rgba(0,0,0,.25);
}

textarea {
  display: block;
  width: 400px;
  height: 150px;
  margin: 0 0 20px;
  padding: 8px 12px 10px 12px;
  border: 1px solid rgba(0,0,0,.5);
  background: rgba(0,0,0,.25);
}

.radio {
  position: relative;
  display: inline-block;
  margin: 0 20px 20px 0;
}

.radio input[type="radio"] {
  vertical-align: middle;
  opacity: 0;
}

.radio label {
  vertical-align: middle;
  cursor: pointer;
}

.radio input[type="radio"] + label:before {
  content: '';
  display: inline-block;
  width: 20px;
  height: 20px;
  margin: -3px 5px 0 -15px;
  vertical-align: middle;
  font-size: 14px;
  font-family: fontawesome;
  line-height: 19px;
  text-align: center;
  border: 1px solid rgba(0,0,0,.5);
  background: rgba(0,0,0,.25);
}

.radio input[type="radio"] + label:before {
  border-radius: 50%;
}

.radio input[type="radio"]:hover + label:before {
  content: '\f111';
  font-size: 9px;
  color: rgba(255,255,255,.4);
}

.radio input[type="radio"]:checked + label:before {
  content: '\f111';
  font-size: 9px;
  color: rgba(255,255,255,.8);
}

.radio .sex {
  font: 20px fontawesome;
}

input[type="submit"] {
  display: block;
  width: 150px;
  margin: 0 0 20px;
  padding: 8px 0 10px 0;
  text-align: center;
  border: 1px solid rgba(0,0,0,.5);
  background: rgba(0,0,0,.25);
}
</style>
</head>
<body>
<div class="login" >
<form action="aggiungiEvento" method="post" enctype="multipart/form-data">
 <label for="nome">Nome evento </label> <br> <br>
          <input type="text" class="login" id="nome" name="nome"placeholder="Nome evento">
           <input type="file" name="image" id="image" placeholder="Inserisci l'immagine dell'evento">
           <br> <br>
           <input type= "submit" class="animated" value="Aggiungi"> 
           </form>
           <form action ="<%= request.getContextPath() %>/admin/menuAdmin.jsp" method="post">
           <input type= "submit" class="animated" value="Indietro"> 
           </form>
</div>
</body>
</html>