<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<div>
<meta charset="UTF-8">
<title>BrainFlash</title> 
<c:out value="${currentUser.userName}"/>
<c:url value="/css/site.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
</head>
<c:url var="userHome" value="/userHome" />
<c:url var="createDeck" value="/deckCreate" />
<c:url var="myDecks" value="/myDecks" />
<c:url var="logout" value="/logout" />


<c:url var="home" value="/userHome" />
<body>
<nav>

	<div class="navbar">
	<div class="header">
 	 <a href="${userHome}" class="logo">Brain Flash</a>
  <div class="header-right">
    <a href="${userHome}">Home</a>
    <a href="${createDeck}">Create a Deck</a>
    <a href="${myDecks}">My Decks</a>
    <a href="${logout}">Logout</a>
  </div>
</div>
</div>
	
</nav>

