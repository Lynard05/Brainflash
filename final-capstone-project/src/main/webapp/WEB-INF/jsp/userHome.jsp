<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common/userHeader.jsp" %>

<html>
	<head>
		<title>Welcome to BrainFlash </title>
	</head>
	
	<body class="userHome">

<img class="mySlides" src="img/slideshow.jpg">
<img class="mySlides" src="img/slideshow2.jpg"> 
<img class="mySlides" src="img/slideshow3.jpg"> 

<script>
var slideIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
  }
  slideIndex++;
  if (slideIndex > x.length) {slideIndex = 1} 
  x[slideIndex-1].style.display = "block"; 
  setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
=======
	<c:out value="${userName}"></c:out>
	<c:out value="${userId}"></c:out>

	<c:url var="loginUrl" value="/deckCreate"/>
	<a href="${loginUrl}" style="color: white; text-shadow: -2px 0 black, 0 2px black, 2px 0 black, 0 -2px black;">
		
		<h2 class="homeText">This is Brain Flash.</h2>
		<h3 class="homeTextSansTopPadding">Click to begin.</h3> 

		 </a> 
=======
		 </a>
	<input name="userName" type="hidden" value="${currentuser}"/>	 
	</body>
</html>
<%@include file="common/footer.jsp" %>