<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url value="/css/site.css" var="cssHref" />
<%@include file="common/userHeader.jsp" %>
<!DOCTYPE html>

<html>
<body>
 <c:url var="deckCreate" value="/deckCreate" />

<c:url value="/css/site.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">




<div class = "createDeckContainer">

 <div class = "deckCreateCenterBox">

	<div class="createDeckHeading">
	
		<h1>Create a New Flash Card Set!</h1>
	
	</div>

	<div class = "createDeckTextContainer">
	
	<form method="post" action="${deckCreate}">
		
		<div class = "titleDesc">
	
			<div class="deckName">
				<div>
					<label for="name"class = "required" style="font-size: 30px;">Set Title</label>
				</div>
				<input class= "createDeckPage" placeholder="Enter Your Deck Name." name="name" id="name" style="font-size: 20px;"/>
			</div>
		
			<div class="deckDesc">
				<div>
					<label for="description"class = "required" style="font-size: 28px;">Set Description</label>
				</div>
				<input class= "createDeckPage" placeholder="Description" name="description" id="description" style="font-size: 20px;"/>
			</div>
	
		</div>
			
	</div>
		
		<div class="userID">
			<input type = hidden placeholder="Enter Your User Id" name="userId" id="userId" style="font-size: 20px;" value = "1" />
		</div>
		
	<div class="create-set submit">
				<input class="create-set submit button" type="submit" value="Submit" />
	</div>
	
	</form>
	</div>
	</div>

</body>
</html>


<%-- </form:form>  --%>