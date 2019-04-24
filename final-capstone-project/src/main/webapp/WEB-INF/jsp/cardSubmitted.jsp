
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<body>
	<header> You Submitted a Card! </header>

	<c:url value="/card" var="cardURL" />
	<a href="${cardURL}">Make Another Card</a>
	<c:url value="/deckCreate" var="deckURL" />
	<a href="${deckURL}">Make Another Deck</a>
	
	
	<c:forEach var="card" items="${cardById}">
		<div class="oneCard">
			<c:out value="${card.question}" />
		</div>
	</c:forEach>

</body>
</html>