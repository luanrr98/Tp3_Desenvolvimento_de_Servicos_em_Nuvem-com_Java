<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Cadastro</title>
</head>
<body>
<div class="container">

  <form action="/usuario/cadastrar" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>Nome:</label>
      <input class="form-control" name="nome" placeholder="Informe seu nome" required type="text">
    </div>

    <div class="form-group">
      <label>Email:</label>
      <input class="form-control" name="email" placeholder="Infome seu email" required type="email">
    </div>

    <div class="form-group">
      <label>Telefone:</label>
      <input class="form-control" name="telefone" placeholder="Infome seu telefone" required type="text">
    </div>

    <c:if test="${not empty endereco.logradouro}">
      <div class="form-group">
        <label>Logradouro</label>
        <input class="form-control" name="logradouro" value="${endereco.logradouro}" required type="text"  readonly>
      </div>
    </c:if>
    <c:if test="${empty endereco.logradouro}">
      <div class="form-group">
        <label>Logradouro</label>
        <input class="form-control" name="logradouro" placeholder="Informe seu logradouro" required type="text"  >
      </div>
    </c:if>

    <div class="form-group">
      <label>Número da Residência:</label>
      <input class="form-control" name="numero" placeholder="Infome seu número" required type="text">
    </div>
    <div class="form-group">
      <label>Complemento</label>
      <input class="form-control" name="complemento" placeholder="Infome um complemento" required type="text">
    </div>
    <c:if test="${not empty endereco.bairro}">
      <div class="form-group">
        <label>Bairro</label>
        <input class="form-control" name="bairro" value="${endereco.bairro}" required type="text" readonly >
      </div>
    </c:if>
    <c:if test="${empty endereco.bairro}">
      <div class="form-group">
        <label>Bairro</label>
        <input class="form-control" name="bairro" placeholder="Informe seu bairro" required type="text">
      </div>
    </c:if>

    <c:if test="${not empty endereco.localidade}">
      <div class="form-group">
        <label>Localidade</label>
        <input class="form-control" name="localidade" value="${endereco.localidade}" required type="text" readonly >
      </div>
    </c:if>
    <c:if test="${empty endereco.localidade}">
      <div class="form-group">
        <label>Localidade</label>
        <input class="form-control" name="localidade" placeholder="Informe sua localidade" required type="text">
      </div>
    </c:if>

    <c:if test="${not empty endereco.uf}">
      <div class="form-group">
        <label>UF</label>
        <input class="form-control" name="uf" value="${endereco.uf}" required type="text" readonly >
      </div>
    </c:if>
    <c:if test="${empty endereco.uf}">
      <div class="form-group">
        <label>UF</label>
        <input class="form-control" name="uf" placeholder="Informe sua UF" required type="text">
      </div>
    </c:if>
    <c:if test="${not empty endereco.cep}">
      <div class="form-group">
        <label>CEP</label>
        <input class="form-control" name="cep" value="${endereco.cep}" required type="text" readonly >
      </div>
    </c:if>
      <c:if test="${empty endereco.cep}">
        <div class="form-group">
          <label>CEP</label>
          <input class="form-control" name="cep" placeholder="Informe seu CEP" required type="text">
        </div>
      </c:if>
    <div class="form-group">
      <label>Imagem</label>
      <input class="form-control" name="imagem" required type="file">
    </div>
    <input class="btn btn-primary" type="submit" value="Cadastrar">
  </form>
</div>
</body>
</html>
