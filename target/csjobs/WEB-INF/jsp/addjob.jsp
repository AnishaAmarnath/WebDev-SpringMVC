<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="<c:url value="/resources/breadcrumb.css"/>" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Create New Job</title>
</head>
<body>

<form:form modelAttribute="newjobs">
<div class="form-group">
<label><b>Job Title:</b></label><form:input path="title" required="true" class="form-control" style="width: 300px;" /><br/>
<label><b>Job Description:</b></label><form:input path="description" required="true" class="form-control" style="width: 300px;"/><br/>
 <label><b>Publish Date:</b></label><form:input path="publishDate"  placeholder="Enter in format M/dd/YYYY" class="form-control" style="width: 300px;" /><br/>
<label><b>Close Date:</b></label><form:input path="closeDate"  placeholder="Enter in format M/dd/YYYY" class="form-control" style="width: 300px;" /><br/> 
<label>Committee Chair:</label><br/>
<select name="chair">
<c:forEach items="${reviewers}" var="item">
			<option value="${item.id}"> ${item.firstName}</option><br />
</c:forEach>
</select><br/><br/>
<label>Committee Members:</label><br/>
<c:forEach items="${reviewers}" var="item">
			<input type="checkbox" name="Mem" value="${item.id}" /> ${item.firstName}<br />
</c:forEach><br/><br/>
<input type="submit" value="submit" name="submit" class="btn btn-success"/>
</div>
</form:form>
</body>
</html>