<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/breadcrumb.css"/>" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Create Edit Job</title>
</head>
<body>
	<form:form modelAttribute="newjobsedit">
	<div class="form-group">
		<input type="hidden" name="id" value="${newjobsedit.id}" />
<b>Job Title:</b><form:input path="title" class="form-control" required="true" style="width: 300px;"/>
		<br />
<b>Job Description:</b><form:input path="description" required="true" class="form-control" style="width: 300px;"/>
		<br />
 <b>Publish Date:</b><form:input path="publishDate"  class="form-control" style="width: 300px;" />
		<br />
<b>Close Date:</b><form:input path="closeDate" class="form-control" style="width: 300px;"/>
		<br />
		<label><b>Committee Chair:</b></label>
		<br />
		<form:select items="${reviewers}" 
				path="committeeChair"
						itemValue="id" itemLabel="firstName" />
		<br />
		<br />

		<label><b>Committee Members:</b></label>
		<br />
		<c:forEach items="${reviewers}" var="reviewer">
    <form:checkbox path="committeeMembers" value="${reviewer}"/>
    ${reviewer.firstName} <br />
    </c:forEach>
		
		<input type="submit" value="submit" name="submit" class="btn btn-success" />
		</div>
	</form:form>
</body>
</html>