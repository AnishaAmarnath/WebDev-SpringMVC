<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="<c:url value="/resources/themes/css/breadcrumb.css"/>" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="CSSTableGenerator" >
	<table border=2 align="center">
		<tr>
			<!-- <th>ID</th> -->
			<th>Job Title</th>
			<th>Description</th>
			<th>Close Date</th>
			<th>Publish Date</th>
		</tr>

		<tr>
			<%-- <td>${jobView.id}</td> --%>
			<td>${jobView.title}</td>
			<td>${jobView.description}</td>
			<td>${jobView.closeDate}</td>
			<td>${jobView.publishDate}</td>

		</tr>

	</table>
</div>
</body>
</html>