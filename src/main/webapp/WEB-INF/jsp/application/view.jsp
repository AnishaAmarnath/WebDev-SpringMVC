<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
    .setfield{
            margin:0px;
            border:1px solid #000000;
            margin-left:25%; 
            margin-right:20%;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="<c:url value="/resources/breadcrumb.css"/>" rel="stylesheet">
<title>CS Jobs - Application</title>
</head>
<body>
	<h2 align="center">CS Jobs</h2>
	<h3 align="center">${application.job.title}</h3><br/><br/>

	<p align="center"><b>Applicant:</b> ${application.applicant.firstName}
		${application.applicant.lastName}</p>
	<p align="center">
		<b>Submitted:</b>
		<fmt:formatDate value="${application.submitDate}" pattern="M/d/yyyy" />
	</p>
	<p align="center"><b>Current Position:</b> ${application.currentJobTitle} at
		${application.currentJobInstitution} since
		${application.currentJobYear}</p><br/><br/>
<div class="CSSTableGenerator">
	<table border="1">
		<tr>
			<th>Degree</th>
			<th>School</th>
			<th>Year</th>
		</tr>
		<c:forEach items="${application.degrees}" var="degree">
			<tr>
				<td>${degree.name}</td>
				<td>${degree.school}</td>
				<td>${degree.year}</td>
			</tr>
		</c:forEach>
	</table></div><br/><br/>
	
	
	<fieldset class="setfield" style="width: 500px">
	<legend>Files</legend>
		<c:if test="${NULL!=application.cv.id}">
			<label>CV:</label>
			<a href="../download.html?fileid=${application.cv.id}">Download CV</a>
			<br />
		</c:if>

		<c:if test="${NULL!=application.researchStatement.id}">
			<label>Research Statement</label>
			<a href="../download.html?fileid=${application.researchStatement.id}">Download Research
				Statement</a>
			<br />
		</c:if>
		<c:if test="${NULL!=application.teachingStatement.id}">
			<label>Teaching Statement</label>
			<a href="../download.html?fileid=${application.teachingStatement.id}">Download Teaching
				Statement</a>
			<br />
		</c:if>
	</fieldset>
</body>
</html>
