<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/themes/css/breadcrumb.css"/>"
	rel="stylesheet">
<title>Application Details</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="span6">
				<ol class="breadcrumb">
					<li><a href="jobs.html"><b>CSJobs</b></a></li>
					<li><a href="appliedJobs.html?email=${param.email}"><b>Jobs
								available</b></a>
					<li><a href="">Applicant Details</a></li>
				</ol>
			</div>
		</div>
	</div>
	<form action="applicationDetails" method="post">
		<div class="CSSTableGenerator">
			<table border=1>
				<tr>
					<th>Application Id</th>
					<th>Current Employer</th>
					<th>Current Job Description</th>
					<th>Applied Date</th>
				<tr>
					<td>${applicationdetails.id}</td>
					<td>${applicationdetails.currentJobInstitution}</td>
					<td>${applicationdetails.currentJobTitle}</td>
					<td>${applicationdetails.submitDate}</td>
			</table>
		</div><br/><br/><br/>
		<div class="CSSTableGenerator">
			<table border=2>
				<tr>
					<th colspan="3">Education</th>
				</tr>
				<tr>
						<th>Degree</th>
						<th>University</th>
						<th>Year</th>
					</tr>
				<c:forEach items="${applicationdetails.degrees}" var="items">
					
					<tr>
						<td>${items.name}</td>
						<td>${items.school}</td>
						<td>${items.year}</td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</form>
</body>
</html>