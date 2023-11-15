<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Etape du ${etape.date}</title>
</head>
<body>

<h2>Description</h2>
<form method="post" action="${pageContext.request.contextPath}/etape">
    <input type="hidden" name="idEtape" value="${etape.idEtape}">
    <p>Date: <input type="date" name="date" value="${etape.date}"></p>
    <p>Ville de départ : <input type="text" name="villeDepart" value="${etape.villeDepart}"></p>
    <p>Ville d'arrivée : <input type="text" name="villeArrivee" value="${etape.villeArrivee}"></p>
    <p>Longeur : <input type="text" name="longueur" value="${etape.longueur}"></p>
    <p>Nature :
        <select name="typeEtape">
            <c:forEach items="${typesEtape}" var="te">
                <option value="${te.idType}"
                        <c:if test="${etape.typeEtape.equals(te)}">selected</c:if>>${te.intituleType}</option>
            </c:forEach>
        </select>
    </p>
    <button type="submit">Mettre à jour la description</button>
</form>

<c:if test="${pret}">
    <h2>Classement</h2>
    <form method="post" action="${pageContext.request.contextPath}/classementetape?idEtape=${etape.idEtape}">
        <ul>
            <c:forEach var="temps" items="${etape.classement}">
                <li>
                        ${temps.coureur.prenomCoureur} ${temps.coureur.nomCoureur} temps en secondes : <input
                        type="text" name="temps_${temps.coureur.idCoureur}" value="${temps.temps}">
                </li>
            </c:forEach>
        </ul>
        <button type="submit">Enregistrer le classement</button>
    </form>
</c:if>

<form action="${pageContext.request.contextPath}">
    <button type="submit">Retour à l'accueil</button>
</form>
</body>
</html>
