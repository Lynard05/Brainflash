<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<body>
 <c:url var="cardForm" value="/card" />

<c:url value="/css/site.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
<div class="centeredHeader">

<header>Create Your Card:</header>
</div>
<form method="post" action="${cardForm}">


<%--  <form:form modelAttribute="card" action="${cardForm}" method="POST"> --%>
	<div class="roundedCorners">

		<div class="deckId">
			<input placeholder="Enter Your deckId" name="deckId" id="deckId" />
		</div>
		
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
	
	<input class="forumSubmitButton" type="submit" value="Submit" />
	
</form>
</body>
</html>
<!-- <div>

<input type="radio" name="right" value="Right"> Right<br>
<input type="radio" name="wrong" value="Wrong"> Wrong<br>  
</div> -->

<%-- </form:form>  --%>