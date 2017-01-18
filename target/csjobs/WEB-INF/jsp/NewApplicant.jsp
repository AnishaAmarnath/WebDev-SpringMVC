<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value="/resources/themes/css/breadcrumb.css"/>" rel="stylesheet">
<title>New Application</title>
<style>
    .lnkbtn{
        display: block;
        width: 100px;
        background-color: lightgrey;
        border: 1px solid black;
        text-align: center;
        text-decoration: none;
        padding: 5px 0px 5px 0px;
    }

    .lnkbtn:hover{
        background-color: #aaa;
    }

    .lnkbtn:visited{
        color: blue;
    }

    .lnkbtn:active{
        border: 1px solid red;
    }

</style>
</head>
<body>
	<form:form modelAttribute="newapplication">
		<h1 align="center">
			<b> Applicant Details</b>
		</h1>
		<h3 align="center">
			<b>(Please be specific about your details)</b>
		</h3>
		<div class="form-group">
			<b>Current Job Description:</b><form:input path="currentJobTitle" required="true" class="form-control"
				placeholder="Enter Current Job Details"
				style="width: 300px"  />
		</div>
		<br /> 
		<div class="form-group">
			<b>Current Job Institution:</b><form:input path="currentJobInstitution" required="true" class="form-control"
				placeholder="Enter Current Employer"
				style="width: 300px"  />
		</div>		
		<br />
		<div class="form-group">
			<b>Year:</b><form:input path="currentJobYear" type="number" class="form-control"
				placeholder="Enter the year of joining"
				style="width: 300px" required="true" />
		</div>	 <br />
		
			<legend>Education:</legend>
			<div id="dynamicAdd">
			<table>
				<tr>
					<th>Degree</th>
					<th>University</th>
					<th>Year of Passing</th>
				</tr>
				<div class="form-group">
				<tr>
					<td><input type="text" class="form-control" name="name"
						placeholder="Degree Name" required="true"/><br></td>
					<td><input type="text" class="form-control" name="school"
						placeholder="University Name" required="true"/><br></td>
					<td><input type="text" type="number" class="form-control" name="year"
						placeholder="Year of passing" required="true"/><br /></td>
				</tr>
				</div>
			</table>
			</div>
		<br />
		<br /> <input type="button" class="btn btn-default" value="Add Degree"
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
						+ "<input type='text' class='form-control' name='name' placeholder='Degree Name' required='true'/>"
						+ "<br></td>"
						+ "<td><input type='text' class='form-control' name='school' placeholder='University Name' required='true'/><br></td>"
						+ "<td><input type='text' type='number' class='form-control' name='year' placeholder='Year of passing' required='true'/><br/></td>"
						+ "</tr></div></table>";
				document.getElementById(divName).appendChild(newdiv);
			}
		</script>

		<input type="submit" />
	</form:form>

</body>
</html>