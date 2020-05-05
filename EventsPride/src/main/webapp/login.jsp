<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
</head>
<body class="text-center">
<%  String messaggio = (String) request.getAttribute("messaggio"); 
	if (messaggio != null ){
		%>
		<h2><%=messaggio%></h2>
		<%}%>
<form class="form-signin" action="login" method="post">

    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  


  <div class="form-label-group">
    <input type="text" style="width:250px; height:50px;margin: auto" id="user" name ="user" class="form-control" placeholder="Username" required autofocus>
    <label for="text"></label>
  </div>

  <div class="form-label-group">
    <input type="password" style="width:250px; height:50px;margin: auto" id="password" name ="password" class="form-control" placeholder="Password" required>
    <label for="password"></label>
  </div>

  <button class="btn btn-lg btn-primary btn-block" type="submit" style="width:150px; height:50px;margin: auto">Sign In</button>
</form>
<br>
<form action="controllo" method="post">
 <input type="hidden" id="tipo" name="tipo" value="utente">

<button class="btn btn-lg btn-primary btn-block" type="submit" name="azione" value="0"style="width:150px; height:50px;margin: auto">Register</button>

  <p class="mt-5 mb-3 text-muted text-center">&copy; 2017-2020</p>
</form>
</body>
</html>