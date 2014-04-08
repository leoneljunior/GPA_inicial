<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<%@ taglib prefix="gpa" tagdir="/WEB-INF/tags" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp" />

<body>
	<div class="container">
		<jsp:include page="../fragments/bodyHeader.jsp" />
		<h2>Contatos</h2>
		
		<!-- Button trigger modal -->
		<button class="btn btn-primary" data-toggle="modal"
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
			<datatables:column title="Endereço" property="endereco"
				cssStyle="width: 200px;" />
			<datatables:column title="Cidade" property="cidade" />
			<datatables:column title="Telefone" property="fone" />
			<datatables:column title="Editar">
				<button class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Editar Contato</button>
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

						<c:choose>
							<c:when test="${contato['id']  == NULL }">
								<c:set var="method" value="post" />
							</c:when>
							<c:otherwise>
								<c:set var="method" value="post" />
							</c:otherwise>
						</c:choose>

						<h2>
							<c:if test="${contato['id']  == NULL }">New </c:if>
							Contato
						</h2>
						<form:form modelAttribute="contato" method="${method}" class="form-horizontal" id="add-contato-form">
							<input type="hidden" name="id" value="${contato['id']}" />
							<gpa:inputField label="First Name" name="nome" />
							<gpa:inputField label="Last Name" name="sobreNome" />
							<gpa:inputField label="Address" name="endereco" />
							<gpa:inputField label="City" name="cidade" />
							<gpa:inputField label="Telephone" name="fone" />

							<div class="form-actions">
								<c:choose>
									<c:when test="${contato['id']  == NULL }">
										<button type="submit">Add Owner</button>
									</c:when>
									<c:otherwise>
										<button type="submit">Update Owner</button>
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
