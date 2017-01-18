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
<link href="<c:url value="/resources/breadcrumb.css"/>"
	rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>CSJobs - Job</title>
</head>
<body>
<h2 align="center">CS Jobs</h2>
<h3 align="center">${job.title}</h3><br/><br/>
<fieldset class="setfield">
<p><b>Posted on:</b> <fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></p>
<p><b>Close on:</b>  <fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></p>
<p><b>Job Description:</b></p>
<p>${job.description}</p>
</fieldset>
</body>
</html>
