<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
.lnkbtn {
    display: block;
    width: 100px;
    background-color: #B76666;
    border: 1px solid black;
    text-align: center;
    font-family: sans-serif;
    text-decoration: none;
    padding: 5px 0px 5px 0px;
}

.lnkbtn:hover {
    background-color: #aaa;
}

.lnkbtn:visited {
    color: black;
}

.lnkbtn:active {
    border: 1px solid red;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/breadcrumb.css"/>" rel="stylesheet">
<title>CS Jobs - Admin</title>

</head>

<body>
<c:url var="logoutUrl" value="/logout" />
	<form action="${logoutUrl}" method="post">
		<input type="submit" value="Logout"/> <input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<h2 align="center">
		<U>CS Jobs - Admin</U>
	</h2>

	<h3 align="center">Admin Home</h3>
	<p>
		<b><a class='lnkbtn' href="<c:url value='/addjob.html' />">Create
				New Job</a></b>
	</p>
	<div class="CSSTableGenerator">
		<table border="1">
			<tr>
				<th>Job Name</th>
				<th>Publish Date</th>
				<th>Close Date</th>
				<th>Operations</th>
				<th>Applications</th>
			</tr>
			<c:forEach items="${jobsdisplay}" var="item">
				<tr>
					<td><a
						href="<c:url value='/job/viewjob.html?jobid=${item.id}'/>">${item.title}</a></td>
					<td><fmt:formatDate value="${item.publishDate}"
							pattern="M/d/yyyy" /></td>
					<td><fmt:formatDate value="${item.closeDate}"
							pattern="M/d/yyyy" /></td>
					<td><a href="editjob.html?jobid=${item.id}">Edit</a></td>
					<td><a href="viewApplicants.html?jobid=${item.id}">View
							Applicants</a></td>
				</tr>
				<%-- <input type="checkbox" name="committeeChair" value="${item.firstName}" /> ${item.firstName}<br /> --%>
			</c:forEach>
		</table>
	</div>
	</body>
</html>
