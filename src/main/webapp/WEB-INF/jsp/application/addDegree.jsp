<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="<c:url value="/resources/breadcrumb.css"/>"
	rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>CS Jobs - Add Degree</title>
</head>
<body>
<h2 align="center">CS Jobs</h2>
<h3 align="center">${application.job.title}</h3>

<p><b>Applicant:</b> ${application.applicant.firstName} ${application.applicant.lastName}</p>
<form:form modelAttribute="degree">
<div class="form-group">
<div id="dynamicAdd">
			<table>
				<tr>
					<th>Degree</th>
					<th>University</th>
					<th>Year of Passing</th>
				</tr>
				<!-- <div class="form-group"> -->
				
				<tr>
					<td><input type="text" name="name"
						placeholder ="Degree Name" required="true" class="form-control" style="width: 300px;"/><br></td>
					<td><input type="text" name="school"
						placeholder ="University Name" required="true" class="form-control" style="width: 300px;"/><br></td>
					<td><input type="text" type="number" name="year"
						placeholder="Year of passing" required="true" class="form-control" style="width: 300px;"/><br /></td>
				</div>
				</tr>
			</table>
			</div>
			</div>
		<br />
		<br />
		 <input type="button" class="btn btn-info" value="Add Degree"
			onClick="addInput('dynamicAdd');">
		<script Language="JavaScript">
			function addInput(divName) {
				var newdiv = document.createElement('div');
				newdiv.innerHTML = "<table><tr>"
						+ "<th>Degree</th>"
						+ "<th>University</th>"
						+ "<th>Year of Passing</th>"
						+ "</tr>"
						+ "<div class='form-group'>"
						+ "<tr>"
						+ "<td>"
						+ "<input type='text' name='name' placeholder='Degree Name' required='true' class='form-control' style='width: 300px;''/>"
						+ "<br></td>"
						+ "<td><input type='text' name='school' placeholder='University Name' required='true' class='form-control' style='width: 300px;'/><br></td>"
						+ "<td><input type='text' type='number' name='year' placeholder='Year of passing' required='true' class='form-control' style='width: 300px;'/><br/></td>"
						+ "</tr></div></table>";
				document.getElementById(divName).appendChild(newdiv);
			}
		</script>
		<input type="submit" name="submit" value="submit" class="btn btn-success"/>
		</p>
</form:form>
</body>
</html>


