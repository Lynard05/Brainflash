<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%@include file="common/userHeader.jsp" %>

<html>
<body >


<c:url var = "studySession" value = "/studySession">
	<c:param name="deckId">${deck.deckId}</c:param>
	</c:url>

	

<c:url value="/css/site.css" var="cssHref" />
	<link rel="stylesheet" href="${cssHref}">

 <c:url var="cardForm" value="/editDeck" />
 
<div class="allBoxesEditDeck padTop">

	<div class="titleDescriptionBox">		
	
		<div class="deckName">
			
			<h2 >${deck.name}</h2>
		
		</div>
		
		<div class="deckDescription">
		
			<h4 >${deck.description}</h4>
		
		</div>
	
	</div>
	
	
	
	<c:forEach var="cards" items="${cards}">
	
		<div class="noteCards">
			
			<div class = "noteQuestion">
			
				<p class = "questionAnswer">Question:</p>
				<p>${cards.question}</p>
				
			</div>
			
			<div class = "noteAnswer">
			
				<p class="questionAnswer"> Answer:</p>
				<p>${cards.answer}</p>
		
			</div>

		</div>

	</c:forEach>
	

	
<div id="makeNewCardPTag">

	<p class="titleDescriptionBox" style="font-size: 30px;">Make a New Card:</p>
		
</div>	
	
	<div class="QAbox">
	
		
	<form:form method="post" action="${cardForm}" modelAttribute="deckid">
		
		<div class="noteQuestion">
			<input placeholder="Enter Your Question" style="font-size: 25px;" name="question" id="question" class = "test"/>
		</div>
		
		<div class="noteAnswer">
			<input placeholder="Enter Your Answer" style="font-size: 25px;" name="answer" id="answer" class="test" />
		</div>
		
		<div class="deckId">
			<input type="hidden"    name="deckId" id="deckId" value="${deck.deckId}" />
		</div>	
	
		
		<input class="forumSubmitButton button"  type="submit" value="Submit Card" style="position: fixed; bottom: 0; right: 0;"/>
	
	</form:form>
	</div>

<div class="">
	<a href="${studySession}">
		<button class="button" style="position: fixed; bottom: 0; left: 0;">LETS STUDY!</button>
	</a>
	</div>
	</div>
</body>
</html>