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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="<c:url value="/resources/breadcrumb.css"/>"
	rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>CS Jobs - Apply</title>
</head>
<body>

<h2 align="center">CS Jobs</h2>
<h3 align="center">${application.job.title}</h3>
<p><b>Applicant:</b> ${application.applicant.firstName} ${application.applicant.lastName}</p>

<form:form action="apply.html?${_csrf.parameterName}=${_csrf.token}"

        modelAttribute="application" enctype="multipart/form-data">
<p><b>Current Job Details:</b></p>
<div class="form-group">
  <label><b>Title:</b></label>
  <form:input path="currentJobTitle" class="form-control" style="width: 300px;" required="true"/><br/>
  <label><b>Institution or Company:</b></label>
  <form:input path="currentJobInstitution" class="form-control" style="width: 300px;" required="true"/><br/>
<label><b>Starting Year:</b></label>
  <form:input path="currentJobYear" class="form-control" style="width: 300px;" required="true"/><br/>
<label><b>CV:</b></label>
<input type="file" name="file0"/><br/>
<label><b>Research Statement:</b></label>
<input type="file" name="file1"/><br/>
<label><b>Teaching Statement:</b></label>
<input type="file" name="file2"/><br/>
<input type="submit" name="next" value="Next" class="btn btn-info" />
</div>
</form:form>
</body>
</html>
