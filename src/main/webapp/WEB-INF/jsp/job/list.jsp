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
<title>CS Jobs</title>
</head>
<body>
<h2 align="center">CS Jobs</h2>


<p align="center">
  <a class="btn btn-info" href="<c:url value='/register.html' />">Register</a> |
  <a class="btn btn-info" href="<c:url value='/login.html' />">Login</a>
</p><br/><br/><br/>
<fieldset class="setfield" style="width:750px;">
    <h3 align="center">Open Job Positions</h3>
<ul>
<c:forEach items="${openJobs}" var="job">
  <li><b><a href="<c:url value='/job/view.html?jobid=${job.id}' />">${job.title}</a></b></li>
</c:forEach>
</ul>
</fieldset><br/><br/>
<%-- <p align="right">
<a class="btn btn-danger" href="<c:url value='/logout.html' />">Logout</a></p> --%>
</body>
</html>
