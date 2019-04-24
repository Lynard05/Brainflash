<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<%@include file="common/header.jsp" %>

<html>
<body>




	<c:url var = "completedSession" value = "/completedSession"/>

<c:url value="/css/site.css" var="cssHref" />
	<link rel="stylesheet" href="${cssHref}">
	
	<header>TEST 
	
	</header>
<div id="finalScore">


</div>

<script src = "js/studySession.js"></script>
<script src = "/js/studySession.js"></script>
</body>
</html>
