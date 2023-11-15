<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Tour de France</title>
</head>
<body>

<h2>Equipes</h2>
<ul>
    <c:forEach var="equipe" items="${equipes}">
        <li><a href="${pageContext.request.contextPath}/equipe?id=${equipe.idEquipe}">${equipe.nomEquipe}</a></li>
    </c:forEach>
</ul>

<c:if test="${!pret}">
    <form action="${pageContext.request.contextPath}/creerequipe">
        <button type="submit">Nouvelle Equipe</button>
    </form>
</c:if>

<h2>Etapes</h2>

<ul>
    <c:forEach var="etape" items="${etapes}">
        <li>

            <a href="${pageContext.request.contextPath}/etape?idEtape=${etape.idEtape}"><!-- TODO : on affiche dans le lien : ville départ - ville arrivée (date)  --></a>
        </li>
    </c:forEach>
</ul>

<c:if test="${!pret}">
    <form action="${pageContext.request.contextPath}/etape">
        <button type="submit">Nouvelle Etape</button>
    </form>
</c:if>


<c:if test="${!pret}">
    <h2> Préparer les classements</h2>
    <p>En cliquant sur ce bouton vous reliez tous les coureurs à toutes les étapes.</p>
    <form action="${pageContext.request.contextPath}/preparerclassements">
        <button type="submit">Préparer</button>
    </form>
</c:if>

<c:if test="${pret}">
    <h2>Classement général</h2>

    <c:if test="${general==null}">
        La course n'est pas finie
    </c:if>
    <c:if test="${general!=null}">
        <ul>
            <!-- TODO les coureurs triés par temps décroissant -->
            <c:forEach items="${general}" var="coureur">
                <li><!-- TODO : on affiche ici : prénom + nom coureur (temps total en secondes)  --></li>
            </c:forEach>
        </ul>
    </c:if>
</c:if>

</body>
</html>
