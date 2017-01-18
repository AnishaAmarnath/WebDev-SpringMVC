<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<link href="<c:url value="/resources/themes/css/breadcrumb.css"/>" rel="stylesheet">
<title>Applied and Applicable Jobs</title>
</head>
<body>
<form action="applicant.html" method="post">
<p align="right" ><b><h3><a href="jobs.html">Logout</a></b></h3><br/><br/></p>
<div class="CSSTableGenerator" >
<table border=1>
<tr>
<th>Job Title</th>
<th>Job Description</th>
</tr>
<c:forEach items="${jobapplied}" var="jobs">
			<tr>
				<td><a href="applicationDetails.html?jobid=${jobs.id}&email=${param.email}">${jobs.title}</a></td>
				<td>${jobs.description}</td>
			</tr>
</c:forEach>			
</table></div><br/><br/>
<div class="CSSTableGenerator" >
<table border=1>
<tr>
<th>Job Title</th>
<th>Job Description</th>
<th>   </th>
</tr>
<c:forEach items="${jobapplicable}" var="jobs1">
			<tr>
				<td><a href="applicationDetails.html?id=${jobs1.id}">${jobs1.title}</a></td>
				<td>${jobs1.description}</td>
				<td><a class='lnkbtn' href="NewApplicant.html?jobid=${jobs1.id}&email=${param.email}">Apply to Job</a></td>
			</tr>
		</c:forEach>		
		
</table></div>
</form>
</body>
</html>