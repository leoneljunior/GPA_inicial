<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<%@ taglib prefix="gpa" tagdir="/WEB-INF/tags"%>

<html lang="en">

<head>
<jsp:include page="../fragments/headTag.jsp" />

<script src="<c:url value="/resources/js/npi.js" />"></script>
</head>

<body>

	<div class="container">
		<jsp:include page="../fragments/bodyHeader.jsp" />

		<c:url value="/resources/js/npi.js" />

		<br><br>
		<h2>Contatos</h2>

		<!-- Button trigger modal -->
		<button id="btnAdicionar" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Adicionar Contato</button>

		<datatables:table id="contatos" data="${selections}" cdn="true"
			row="contato" theme="bootstrap2" cssClass="table table-striped"
			paginate="false" info="false" export="pdf">
			<datatables:column title="Nome" cssStyle="width: 150px;"
				display="html">
				<spring:url value="/contatos/{contatoId}.html" var="contatoUrl">
					<spring:param name="contatoId" value="${contato.id}" />
				</spring:url>
				<a href="${fn:escapeXml(contatoUrl)}"><c:out
						value="${contato.nome} ${contato.sobreNome}" /></a>
			</datatables:column>
			<datatables:column title="Nome" display="pdf">
				<c:out value="${contato.nome} ${contato.sobreNome}" />
			</datatables:column>
			<datatables:column title="Endere�o" property="endereco"
				cssStyle="width: 200px;" />
			<datatables:column title="Cidade" property="cidade" />
			<datatables:column title="Telefone" property="fone" />
			<datatables:column title="Editar">
				<button id="btnEditar" class="btn btn-primary editarContato" data-toggle="modal"
					data-target="#myModal"
					onclick="povoaForm('<c:url value="/contatos/${contato.id}" />', '#add-contato-form');">Editar
					</button>
			</datatables:column>
			<datatables:column title="Excluir">
					<button id="btnExcluir" class="btn btn-primary"
					onclick="excluir('<c:url value="/contatos/${contato.id}" />');">Excluir
					</button>
			</datatables:column>


		</datatables:table>

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					</div>
					<div class="modal-body">
						
						<c:set var="idContato"/>
						
						<c:choose>
							<c:when test="${contato['id']  == NULL }">
							
								<c:set var="method" value="post"/>
							</c:when>
							<c:otherwise>
								<c:set var="method" value="put"/>
							</c:otherwise>
						</c:choose>

						<h2>
							<c:if test="${contato['id']  != NULL }">Novo </c:if>
							Contato
							<c:out value="${contato['id']}"></c:out>
						</h2>
						<form:form modelAttribute="contato" method="${method}"
							class="form-horizontal" id="add-contato-form">

							<input type="hidden" name="id" id="id" />
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="nome">Nome</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="Nome"
										name="nome" id="nome" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="sobreNome">SobreNome</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										placeholder="Sobre Nome" name="sobreNome" id="sobreNome" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="email">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" name="email" id="email"
										placeholder="Email">
								</div>
							</div>


							<div class="form-group">
								<label class="col-sm-2 control-label" for="endereco">Endere�o</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="Endere�o"
										name="endereco" id="endereco" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="cidade">Cidade</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="Cidade"
										name="cidade" id="cidade" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label" for="fone">Telefone</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" placeholder="Telefone"
										name="fone" id="fone" />
								</div>
							</div>

							<div class="form-actions">
								<c:choose>
									<c:when test="${contato['id']  == NULL }">
										<button class="btn btn-primary" type="submit">Adicionar contato</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary" type="submit">Atualizar contato</button>
									</c:otherwise>
								</c:choose>
							</div>
						</form:form>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="../fragments/footer.jsp" />

	</div>
</body>

</html>
