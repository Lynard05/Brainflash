<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%@include file="common/userHeader.jsp" %>

<html>
<body>

<header>EDIT NEW DECK JSP</header>

 <c:url var="deckForm" value="/editNewDeck" /> 
	<div class="titleDescriptionBox">
	
		<div class="deckName">
		
		<c:out value="${deck.name}"/>
		
		</div>
		
		<div class="deckDescription">
		
		<c:out value="${deck.description}"/>
		
		
		</div>

	</div>
	<div class="noteCards">
	
		<c:forEach var="cards" items="${cards}">
			<div>
				<c:out value="${cards.question}" />
			</div>
			<div>
				<c:out value="${cards.answer}" />
			</div>
			<div>
				<c:out value="${cards.keyword1}" />
			</div>


		</c:forEach>
	</div>
	
	<form method="post" action="${deckForm}">


<%--  <form:form modelAttribute="card" action="${cardForm}" method="POST"> --%>
	<div class="roundedCorners">
		
		<div class="question">
			<input placeholder="Enter Your Question" name="question" id="question" />
		</div>
		
		<div class="answer">
			<input placeholder="Enter Your Answer" name="answer" id="answer"  />
		</div>
		
		<div class="tags">
			<input placeholder="Tags" name="tags" id="tags"/>
		</div>
		
		<div class="keyword1">
			<input placeholder="Enter Your Keyword" name="keyword1" id="keyword1" />
		</div>
		
		<div class="keyword2">
			<input placeholder="Enter Your Keyword" name="keyword2" id="keyword2" />
		</div>
		
		<div class="keyword3">
			<input placeholder="Enter Your Keyword" name="keyword3" id="keyword3" />
		</div>
	
	</div>
		Want to Submit a Blank Deck? Just Hit the Submit Button:
	
		<input class="forumSubmitButton" type="submit" value="Submit" />
		
	</form>




</body>
</html>