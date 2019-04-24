<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<div>
<meta charset="UTF-8">
<title>BrainFlash</title>
<c:url value="/css/site.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
</head>
<c:url var="index" value="/" />
<c:url var="createDeck" value="/deckCreate" />
<c:url var="myDecks" value="/myDecks" />
<c:url var="login" value="/login" />
<c:url var="register" value="/users/new" />

<c:url var="index" value="/" />
<body>
	<nav>
	<div class="navbar">
	<div class="header">
 	 <a href="${index}" class="logo">Brain Flash</a>
  <div class="header-right">
    <a class="active" href="${index}">Home</a>
    <a href="${createDeck}">Create a Deck</a>
    <a href="${myDecks}">My Decks</a>
    <a href="${login}">Login</a>
  <a href="${register}" style="padding-right:40px;">Register</a>
  </div>
</div>
</div>
	

	</nav>

