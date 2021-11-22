<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <meta charset="UTF-8">
  <title>Pagina do perfil</title>
</head>
<body>
<div class="container">
  <c:if test="${not empty imagem}">
  <div>
    <img src="data:image/png;base64, ${imagem}"  />
  </div>
  </c:if>
  <div >
    <h3>Nome: ${usuario.nome}</h3>
  </div>
  <div >
    <h3>Email: ${usuario.email}</h3>
  </div >

    <div >
      <h3>Telefone: ${usuario.telefone}</h3>
    </div>
  <div >
    <h3>Endereco: ${usuario.endereco.logradouro}, nº${usuario.endereco.numero}, ${usuario.endereco.complemento}, ${usuario.endereco.bairro},
      <br>${usuario.endereco.localidade}, ${usuario.endereco.cep} </h3>
  </div>
  </div>
  <div>
    <form method="GET" action="/">
      <input type="submit" value="Voltar para Home">
    </form>
  </div>
</body>
</html>