<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%@include file="common/userHeader.jsp" %>

<html>
<body class="padTop">


 <c:url var="myDecks" value="/myDecks" />
<c:url var="logoImage" value="/img/noteCard.png" />
	<c:url value="/css/site.css" var="cssHref" />
	<link rel="stylesheet" href="${cssHref}">
	<c:url var = "createDeckUrl" value = "/deckCreate"/>
	
	
	<h2 class="titleDescriptionBox">Select a Deck:</h2>
	
	<div class="deckContainer">
	
	<c:forEach var="deck" items="${decks}">
	

	<c:url var="editDeckUrl" value="/editDeck">
	<c:param name="deckId">${deck.deckId}</c:param>
	</c:url>

	<div class="card">
		 
	 <a href="${editDeckUrl}">
	 
		<%-- <img src="${logoImage}" alt="Avatar" class="cardImage"> --%>
		
	</a>
	<a href="${editDeckUrl}">
		<div class="deckWrap">
			<h3 class ="noHyperLink">
			
			
			<c:set var="nameOfDeck" value="${deck.name}" />
			
			<c:if test = "${deck.name == ''}">
				<a href="${editDeckUrl}"> Edit Blank Deck</a>
			</c:if>
			
				${deck.name}</h3></p>
			
			
			<p class ="noHyperLink">${deck.description}</p>
		</div>
			</a>
	</div>
	
	
	</c:forEach>
	</div>
	
	<div class="">
	<a href="${createDeckUrl}">
		<button class="button">Create a New Deck!</button>
	</a>
	</div>
	
	
</body>
</html>