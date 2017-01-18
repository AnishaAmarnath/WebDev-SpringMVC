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
<link href="<c:url value="/resources/breadcrumb.css"/>"
	rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<marquee><h2>CS Jobs</h2></marquee>
<h3 align="center"><U>${job.title}</U></h3>
<p><b>Posted on:</b> <fmt:formatDate value="${job.publishDate}" pattern="M/d/yyyy" /></p>
<p><b>Close on:</b>  <fmt:formatDate value="${job.closeDate}" pattern="M/d/yyyy" /></p>
<p><b>Job Description:</b></p>
<p>${job.description}</p>
<p><b>Committee Chair is</b></p><p>${job.committeeChair.lastName} , ${job.committeeChair.firstName}</p>
<p><b>Committee Members</b></p>
<c:forEach items="${job.committeeMembers}" var="names">
<p>${names.lastName} , ${names.firstName}</p> 
</c:forEach>
</body>
</html>