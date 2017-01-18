<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/breadcrumb.css"/>" rel="stylesheet">
<title>View Applicants</title>
</head>
<body>
	<h1 align="center">CS Jobs- Admin</h1>
	<h3 align="center">View Applicants</h3><br/><br/>
	<div class="CSSTableGenerator">
	<table border="1">
		<tr>
			<th>Applicants</th>
			<th>Applications</th>
		</tr>
		<c:forEach items="${applicationView}" var="appl">
		<tr>
		<td>${appl.applicant.firstName},${appl.applicant.lastName}</td>
		<td><a
				href="application/view.html?jobid=${appl.id}">View Applications</a></td>
		</tr>
		</c:forEach>
</table>
</div>
</body>
</html>