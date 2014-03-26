<!DOCTYPE html>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="exemplo-jpa-spring-mvc" tagdir="/WEB-INF/tags"%>




<html lang="en">

<jsp:include page="../fragments/headTag.jsp" />

<body>
	<div class="container">
		<jsp:include page="../fragments/bodyHeader.jsp" />
		<c:choose>
			<c:when test="${contato['new']}">
				<c:set var="method" value="post" />
			</c:when>
			<c:otherwise>
				<c:set var="method" value="put" />
			</c:otherwise>
		</c:choose>

		<h2>
			<c:if test="${contato['new']}">Novo </c:if>
			Contato
		</h2>
		<form:form modelAttribute="contato" method="${method}"
			class="form-horizontal" id="add-contato-form">
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="Nome" name="Nome" />
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="SobreNome" name="sobreNome" />
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="Endereço" name="endereco" />
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="Cidade" name="cidade" />
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="Telefone" name="fone" />
			<exemplo-jpa-spring-mvc-bootstrap:inputField label="E-mail" name="email" />

			<div class="form-actions">
				<c:choose>
					<c:when test="${contato['new']}">
						<button type="submit">Adicionar Contato</button>
					</c:when>
					<c:otherwise>
						<button type="submit">Atualizar Contato</button>
					</c:otherwise>
				</c:choose>
			</div>
		</form:form>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
</body>

</html>
