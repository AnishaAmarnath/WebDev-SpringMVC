<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    .setfield{
            margin:0px;
            border:1px solid #000000;
            margin-left:25%; 
            margin-right:20%;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value="/resources/breadcrumb.css"/>"
	rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>CS Jobs - Applicant</title>
</head>
<body>
<h2 align="center">CS Jobs</h2>


<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
<p align="right"><input type="submit" value="Logout" class="btn btn-danger"/></p>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h3 align="center">Job Positions Applied</h3>
<fieldset class="setfield">
<c:if test="${user.applications.size() > 0}">
<ul>
  <c:forEach items="${user.applications}" var="application">
  <li><a href="<c:url value='/job/view.html?jobid=${application.job.id}' />">${application.job.title}</a>
    [<a href="<c:url value='/application/view.html?jobid=${application.id}' />">Application</a>]
  </li>
  </c:forEach>
</ul>
</c:if>
</fieldset>

<h3 align="center">Job Positions Available</h3>
<fieldset class="setfield">
<c:if test="${availableJobs.size() > 0}">
<ul>
  <c:forEach items="${availableJobs}" var="job">
  <li><a href="<c:url value='/job/view.html?jobid=${job.id}' />">${job.title}</a>
    [<a href="<c:url value='/application/apply.html?jobId=${job.id}' />">Apply</a>]
  </li>
  </c:forEach>
</ul>
</c:if></fieldset>
</body>
</html>
