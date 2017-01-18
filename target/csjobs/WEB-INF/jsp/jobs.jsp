<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/themes/css/breadcrumb.css"/>" rel="stylesheet">
<title>Jobs</title>
</head>
<body>
<div class="CSSTableGenerator" >
	<table border=2 align="center" class="table table-hover">
		<tr>
			<!-- <th>ID</th> -->
			<th>Job Title</th>

		</tr>
		<c:forEach items="${jobs}" var="jobs">
			<tr>
				
				<td><a href="jobView.html?id=${jobs.id}">${jobs.title}</a></td>
				
			</tr>
		</c:forEach>
	</table></div><br/><br/>
	<h3 align="center"><i><a href="register.html">Register as a New User</a></i></h3><br/>
	<p align="center"><i>Already have an account?</i></p>
	<h3 align="center"><a href="login.html">Login</a></h3>
</body>
</html>