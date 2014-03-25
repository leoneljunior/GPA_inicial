<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>

    <h2>Informações do Contato</h2>

    <table class="table table-striped" style="width:600px;">
        <tr>
            <th>Nome</th>
            <td><b><c:out value="${contato.Nome} ${contato.sobreNome}"/></b></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><c:out value="${contato.endereco}"/></td>
        </tr>
        <tr>
            <th>City</th>
            <td><c:out value="${contato.cidade}"/></td>
        </tr>
        <tr>
            <th>Telephone</th>
            <td><c:out value="${contato.telefone}"/></td>
        </tr>
         <tr>
            <td> 
            	<spring:url value="{contatoId}/edit.html" var="editUrl">
                    <spring:param name="contatoId" value="${contato.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(editUrl)}" class="btn btn-info">Edite Contato</a></td>
            <td>
            	<spring:url value="{ownerId}/pets/new.html" var="addUrl">
                    <spring:param name="contatoId" value="${contato.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(addUrl)}"  class="btn btn-success">Add New Pet</a></td>
        </tr>
    </table>

    <jsp:include page="../fragments/footer.jsp"/>

</div>

</body>

</html>
