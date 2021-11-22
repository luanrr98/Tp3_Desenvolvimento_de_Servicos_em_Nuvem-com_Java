<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <meta charset="ISO-8859-1">
  <title>Cadastro</title>
</head>
<body>
<div class="container">

  <h4>Listagem de usuários cadastrados</h4>

  <table class="table table-striped">
    <thead>
    <tr>
      <th>Nome</th>
      <th>Email</th>
    </tr>
    </thead>
      <c:forEach items="${usuarios}" var="usuario" >
        <tbody>
        <tr>
          <td>${usuario.nome}</td>
          <td>${usuario.email}</td>
          <td>
            <form method="GET" action="/usuario/resgatardados">
              <input type="hidden" value="${usuario.email}" name="email">
              <input type="submit" value="Alterar Usuário">
            </form>
          </td>
          <td>
            <form method="GET" action="/usuario/perfil">
              <input type="hidden" value="${usuario.email}" name="email">
              <input type="submit" value="Visualizar Perfil">
            </form>
          </td>


        </tr>
        </tbody>
      </c:forEach>


  </table>
  <div>
    <form method="GET" action="/">
      <input type="submit" value="Voltar para Home">
    </form>
  </div>

</div>

</body>
</html>