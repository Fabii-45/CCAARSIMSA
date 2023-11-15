<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Nouvelle Equipe</title>
</head>
<body>

<form  method="post" action="${pageContext.request.contextPath}/creerequipe">
Nom d'équipe :<input type="text" name="nomEquipe"> <button type="submit">Créer</button>
</form>
<form action="${pageContext.request.contextPath}">
    <button type="submit">Annuler</button>
</form>

</body>
</html>
