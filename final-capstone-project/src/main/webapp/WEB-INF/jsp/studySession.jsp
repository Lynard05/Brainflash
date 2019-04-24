<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%@include file="common/userHeader.jsp" %>

<html>
<body>


<script>
function goBack() {
  window.history.back();
}
</script>


	<c:url var = "studySession" value = "/studySession"/>

<c:url value="/css/site.css" var="cssHref" />
	<link rel="stylesheet" href="${cssHref}">

 <c:url var="cardForm" value="/editDeck" />
 
 
 <header>
 
 <div class="titleDescriptionBox padTop">
	
	<div class="deckName">
		
		<h2>${deck.name}</h2>
		
	</div>
		
		<div class="deckDescription">
		
			<h4>${deck.description}</h4>
		
		</div>
	
	</div>
	
</header>

<div class="allBoxes">

	
	
	<c:forEach var="cards" items="${cards}">
	<div class="cardElement" style="font-size: 20px">
	
		<label class="container" style="font-family: Verdana, Geneva, sans-serif; font-size: 18px;">Correct
		<input type="checkbox" name="checkbox" />  <span class="checkmark"></span>
		</label>
		<br />

			
		<div class="flip-card">
		
		  	<div class="flip-card-inner">
		  	
			    <div class="flip-card-front">
			     	<p class="questionAnswer questionAnswerInSession">${cards.question}</p>
			    </div>
			    
			    <div class="flip-card-back">
			     	<p class="questionAnswer questionAnswerInSession">${cards.answer}</p>
			    </div>
			    
		    </div>
		  
		</div>
	</div>
	</c:forEach>
	
	

	</div>
			
<div class="stickyBar">
<!-- <h1 class="titleDescriptionBox">Your Progress</h1>
 -->
<div id="myProgress">
  <div id="myBar">0%</div>
</div>
</div>
<c:url var = "completedSessionUrl" value = "/studySession"/>
<div class="">
	
	</div>
	<div class="">
	<button class="button " onclick="showFinal();">Show Score</button>
<button  class="button"  onclick="goBack()">Return to Deck</button>
<button  class="button"  onclick="resetCards()">Clear</button>
</div>
<script src = "js/studySession.js"></script>
<script src = "/js/studySession.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>


