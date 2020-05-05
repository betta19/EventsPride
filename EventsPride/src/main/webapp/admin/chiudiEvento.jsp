<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<head>
<style>
table, th, td {
  border: 1px solid black;

</style>
<meta charset="ISO-8859-1">
<title>Lista eventi</title>
</head>
<body class="bg-light">
<br>
<br>
<table class="table table-dark">
  <tr>
    <th>Nome</th>
    <th>Data</th>
    <th>Esito</th>
     <th>Partecipanti</th>
     <th>Immagine</th>
  </tr>

  <c:forEach items="${listaEventi}" var="evento">

  <tr>
    <td>
            <c:out value = "${evento.getNome()}"/>
    </td> 

    <td>
            <c:out value = "${evento.getDataApertura()}"/>
    </td> 
    <td>
            <c:out value = "${evento.getEsito()}"/>
    </td>
    <td>
            <c:out value = "${evento.getListaUtenti().size()}"/>
    </td>
    <td>
           <img alt="immagine" src="data:image/jpg;base64, <c:out value = "${evento.getFoto()}"/>"style="width:45px; height:45px; margin: auto">
    </td> 

    <td>
    <form action="chiudiEvento" method="post">
    <button type="submit" class="btn btn-warning" name="idEvento" value=<c:out value = "${evento.getId()}"/>> Chiudi evento </button>
    </form>
    

    </td>
  </tr>

  </c:forEach>

</table>
	<form action="controllo" method="post">
		<button type="submit" class="btn btn-primary btn-lg btn-block"
			name="azione" value="4" style="width: 500px; height: 50px;">Indietro</button>
	</form>
</body>
</html>