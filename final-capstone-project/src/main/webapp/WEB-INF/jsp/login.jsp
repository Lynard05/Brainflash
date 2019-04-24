<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<%@include file="common/header.jsp"%>
<c:url var="login" value="/login" />

<daiv class="loginBox"> <c:url var="formAction" value="/login" />
<form method="POST" action="${formAction}">
	<input type="hidden" name="destination" value="${param.destination}" />
	<div class="form-group">
		<label for="userName" style="font-size: 30px;">Email: </label> <input
			type="text" id="userName" name="userName" placeHolder="Email"
			class="form-control" />
	</div>
	<div class="form-group">
		<label for="password" style="font-size: 30px;">Password: </label> <input
			type="password" id="password" name="password" placeHolder="Password"
			class="form-control" />
	</div>
	<input name="userName" type="hidden" value="${currentuser}" />
	<button type="submit" class="btn btn-primary">Login</button>
	<span class="loginRegisterButton">
		<button>
			<a href="/capstone/users/new" class="btn btn-primary">Register</a>
		</button>
	</span>
</form>
</div>


<%@include file="common/footer.jsp"%>