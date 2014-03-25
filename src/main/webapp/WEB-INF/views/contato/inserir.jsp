<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="<c:url value="/webjars/bootstrap/3.1.1/css/bootstrap.min.css" />"
	rel="stylesheet" />
<script src="<c:url value="/webjars/jquery/2.1.0/jquery.min.js" />"></script>

<!-- jquery-ui.js file is really big so we only load what we need instead of loading everything -->
<script
	src="<c:url value="/webjars/jquery-ui/1.10.3/ui/minified/jquery.ui.core.min.js" />"></script>
<script
	src="<c:url value="/webjars/jquery-ui/1.10.3/ui/minified/jquery.ui.datepicker.min.js" />"></script>

<!-- jquery-ui.css file is not that big so we can afford to load it -->
<link
	href="<c:url value="/webjars/jquery-ui/1.10.3/themes/base/minified/jquery-ui.min.css" />"
	rel="stylesheet"></link>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contatos</title>
</head>
<body>
	<div class="jumbotron">
		<form role="form" action="inserirContato" method="post">
			<div class="form-group">
				<label for="nome">Nome:</label> <input type="text"
					class="form-control" id="nome" placeholder="Seu nome. Ex: José"
					name="nome" />
			</div>
			<div class="form-group">
				<label for="fone">SobreNome:</label> <input type="text"
					class="form-control" id="sobreNome"
					placeholder="Seu sobreNome. Ex: Vieira" name="sobreNome" />
			</div>
			
			<div class="form-group">
				<label for="fone">Telefone:</label> <input type="text"
					class="form-control" id="fone"
					placeholder="Seu telefone. Ex: (xx) xxxx-xxxx" name="fone" />
			</div>
			
			<div class="form-group">
				<label for="fone">Cidade:</label> <input type="text"
					class="form-control" id="cidade"
					placeholder="Sua cidade. Ex: Quixadá" name="cidade" />
			</div>

			<div class="form-group">
				<label for="fone">Endereço:</label> <input type="text"
					class="form-control" id="endereco"
					placeholder="Seu endereço. Ex: Rua A" name="endereco" />
			</div>

			<div class="form-group">
				<label for="email">E-mail:</label> <input type="text"
					class="form-control" id="email"
					placeholder="Seu e-mail. Ex: joao@gmail.com" name="email" />
			</div>
			<input type="submit" class="btn btn-default" value="Inserir">
		</form>

	</div>
</body>
</html>