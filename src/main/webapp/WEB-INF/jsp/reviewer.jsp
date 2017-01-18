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
<title>CS Jobs - Reviewer</title>
</head>
<body>
<h2>CS Jobs - Reviewer</h2>
 <h3>Reviewer Home</h3>
<p>You are logged in as reviewer.</p>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="Logout" />
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
 <div class="CSSTableGenerator">
		<table border="1">
			<tr>
				<th>Job Name</th>
				<th>Publish Date</th>
				<th>Close Date</th>
				<th>Applications</th>
			</tr>
			<c:forEach items="${jobsdisplay}" var="item">
				<tr>
					<td>${item.title}</td>
					<td><fmt:formatDate value="${item.publishDate}"
							pattern="M/d/yyyy" /></td>
					<td><fmt:formatDate value="${item.closeDate}"
							pattern="M/d/yyyy" /></td>
						<%-- <td>${item.committeeChair.email}</td> --%>
					<td>	
					<c:forEach items="${item.committeeMembers}" var="comm">
					<security:authorize access="hasRole('ROLE_REVIEWER') and principal.username == '${comm.email}'">
					<a href="viewApplicants.html?jobid=${item.id}">View Applicants</a>
					</security:authorize>					
					</c:forEach></td>
					</tr>
					</c:forEach>
		</table>
	</div>
	
 

</body>
</html>
