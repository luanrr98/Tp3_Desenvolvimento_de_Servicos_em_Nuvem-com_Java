<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Home</title>
</head>
<body>
    <div class="container">
        <div>
            <form action="/usuario/cep" method="get">
                <input type="submit" value="Cadastrar" class="btn-primary">
            </form>
        </div>
        <hr>
        <div>
            <form action="/usuario/listar" method="get">
                <input type="submit" value="Listar Todos" class="btn-primary">
            </form>
        </div>
        <hr>
        <div class="">
            <form action="/usuario/pesquisar" method="get">
                    <input type="email" name="email" class="form-control" required>
                <input type="submit" value="Buscar Por Email" class="btn-primary">
            </form>
        </div>
    </div>
</body>
</html>