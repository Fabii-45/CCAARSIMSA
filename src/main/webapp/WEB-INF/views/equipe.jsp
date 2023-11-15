<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Détails de l'équipe ${equipe.nomEquipe}</title>
</head>
<body>

<h2>Désignation</h2>
<form method="post" action="${pageContext.request.contextPath}/renommerequipe">
    <input type="hidden" name="idEquipe" value="${equipe.idEquipe}">
    <input type="text" name="nomEquipe" value="${equipe.nomEquipe}">
    <button type="submit">Modifier</button>
</form>

<h2>Membres</h2>


<form method="post" action="${pageContext.request.contextPath}/definirleader">
    <input type="hidden" name="idNouveauLeader" id="idNouveauLeader">
    <input type="hidden" name="idEquipe" value="${equipe.idEquipe}">
    <ul>
        <c:forEach var="coureur" items="${equipe.membres}">
            <li>
                    ${coureur.prenomCoureur} ${coureur.nomCoureur}
                <c:if test="${coureur.equals(equipe.leader)}">
                    (Leader)
                </c:if>
                <c:if test="${!coureur.equals(equipe.leader)}">
                    <button type="submit"
                            onclick="document.getElementById('idNouveauLeader').value=${coureur.idCoureur};">Définir
                        comme leader
                    </button>
                </c:if>
            </li>
        </c:forEach>
    </ul>
</form>

<c:if test="${!pret}">

    <h2>Ajout d'un coureur</h2>
    <form method="post" action="${pageContext.request.contextPath}/ajoutercoureur">
        <input type="hidden" name="idEquipe" value="${equipe.idEquipe}">
        Prenom : <input type="text" name="prenomCoureur">
        Nom : <input type="text" name="nomCoureur">
        <button type="submit">Ajouter</button>
    </form>

</c:if>

<form action="${pageContext.request.contextPath}">
    <button type="submit">Retour à l'accueil</button>
</form>
</body>
</html>
