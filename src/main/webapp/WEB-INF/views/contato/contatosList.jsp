<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>
    <h2>Contatos</h2>
    
    <datatables:table id="contatos" data="${selections}" cdn="true" row="contato" theme="bootstrap2" 
                      cssClass="table table-striped" paginate="false" info="false" export="pdf">
        <datatables:column title="Nome" cssStyle="width: 150px;" display="html">
            <spring:url value="/contatos/{contatoId}.html" var="contatoUrl">
                <spring:param name="contatoId" value="${contato.id}"/>
            </spring:url>
            <a href="${fn:escapeXml(contatoUrl)}"><c:out value="${contato.nome} ${contato.sobreNome}"/></a>
        </datatables:column>
        <datatables:column title="Nome" display="pdf">
            <c:out value="${contato.nome} ${contato.sobreNome}"/>
        </datatables:column>
        <datatables:column title="Endereço" property="endereco" cssStyle="width: 200px;"/>
        <datatables:column title="Cidade" property="cidade"/>
        <datatables:column title="Telefone" property="fone"/>
   
       
    </datatables:table>
    
    <jsp:include page="../fragments/footer.jsp"/>

</div>
</body>

</html>
