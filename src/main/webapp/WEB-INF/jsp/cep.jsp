<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Cadastro</title>
</head>
<body>
<div class="container">

    <form action="/usuario/cep" method="post">
        <div class="form-group">
            <label>CEP:</label>
            <input class="form-control" name="cep" placeholder="Infome seu CEP" required type="text">
        </div>
        <input class="btn btn-primary" type="submit" value="Cadastrar">
    </form>
</div>
</body>
</html>

