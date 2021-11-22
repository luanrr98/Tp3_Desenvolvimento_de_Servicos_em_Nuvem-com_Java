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

  <form action="/usuario/alterar" method="post" enctype="multipart/form-data">
    <c:if test="${not empty usuario.nome}">
      <div class="form-group">
        <label>Nome</label>
        <input class="form-control" name="nome" value="${usuario.nome}" required type="text" y>
      </div>
    </c:if>
    <c:if test="${empty usuario.nome}">
      <div class="form-group">
        <label>Nome</label>
        <input class="form-control" name="nome" placeholder="Informe seu nome" required type="text"  >
      </div>
    </c:if>

    <c:if test="${not empty usuario.email}">
      <div class="form-group">
        <label>Email</label>
        <input class="form-control" name="email" value="${usuario.email}" required type="text" y>
      </div>
    </c:if>
    <c:if test="${empty usuario.email}">
      <div class="form-group">
        <label>Email</label>
        <input class="form-control" name="email" placeholder="Informe seu email" required type="text"  >
      </div>
    </c:if>

    <c:if test="${not empty usuario.telefone}">
      <div class="form-group">
        <label>Telefone</label>
        <input class="form-control" name="telefone" value="${usuario.telefone}" required type="text" y>
      </div>
    </c:if>
    <c:if test="${empty usuario.telefone}">
      <div class="form-group">
        <label>Telefone</label>
        <input class="form-control" name="telefone" placeholder="Informe seu telefone" required type="text"  >
      </div>
    </c:if>

    <c:if test="${not empty usuario.endereco.logradouro}">
      <div class="form-group">
        <label>Logradouro</label>
        <input class="form-control" name="logradouro" value="${usuario.endereco.logradouro}" required type="text"  >
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.logradouro}">
      <div class="form-group">
        <label>Logradouro</label>
        <input class="form-control" name="logradouro" placeholder="Informe seu logradouro" required type="text"  >
      </div>
    </c:if>

    <c:if test="${not empty usuario.endereco.numero}">
      <div class="form-group">
        <label>Número</label>
        <input class="form-control" name="numero" value="${usuario.endereco.numero}" required type="text" y>
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.numero}">
      <div class="form-group">
        <label>Número</label>
        <input class="form-control" name="numero" placeholder="Informe seu número" required type="text"  >
      </div>
    </c:if>
    <c:if test="${not empty usuario.endereco.complemento}">
      <div class="form-group">
        <label>Complemento</label>
        <input class="form-control" name="complemento" value="${usuario.endereco.complemento}" required type="text" y>
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.complemento}">
      <div class="form-group">
        <label>Complemento</label>
        <input class="form-control" name="complemento" placeholder="Informe seu complemento" required type="text"  >
      </div>
    </c:if>
    <c:if test="${not empty usuario.endereco.bairro}">
      <div class="form-group">
        <label>Bairro</label>
        <input class="form-control" name="bairro" value="${usuario.endereco.bairro}" required type="text"  >
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.bairro}">
      <div class="form-group">
        <label>Bairro</label>
        <input class="form-control" name="bairro" placeholder="Informe seu bairro" required type="text">
      </div>
    </c:if>

    <c:if test="${not empty usuario.endereco.localidade}">
      <div class="form-group">
        <label>Localidade</label>
        <input class="form-control" name="localidade" value="${usuario.endereco.localidade}" required type="text"  >
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.localidade}">
      <div class="form-group">
        <label>Localidade</label>
        <input class="form-control" name="localidade" placeholder="Informe sua localidade" required type="text">
      </div>
    </c:if>

    <c:if test="${not empty usuario.endereco.uf}">
      <div class="form-group">
        <label>UF</label>
        <input class="form-control" name="uf" value="${usuario.endereco.uf}" required type="text"  >
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.uf}">
      <div class="form-group">
        <label>UF</label>
        <input class="form-control" name="uf" placeholder="Informe sua UF" required type="text">
      </div>
    </c:if>
    <c:if test="${not empty usuario.endereco.cep}">
      <div class="form-group">
        <label>CEP</label>
        <input class="form-control" name="cep" value="${usuario.endereco.cep}" required type="text"  >
      </div>
    </c:if>
    <c:if test="${empty usuario.endereco.cep}">
      <div class="form-group">
        <label>CEP</label>
        <input class="form-control" name="cep" placeholder="Informe seu CEP" required type="text">
      </div>
    </c:if>
    <div class="form-group">
      <label>Imagem</label>
      <input class="form-control" name="imagem" required type="file">
    </div>
    <input class="form-control" name="id" value="${usuario.id}" required type="hidden" y>

    <input class="btn btn-primary" type="submit" value="Cadastrar">
  </form>
</div>
</body>
</html>
