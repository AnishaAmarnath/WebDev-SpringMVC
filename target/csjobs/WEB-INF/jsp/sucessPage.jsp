<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" href='<c:url value="/resources/themes/css/breadcrumb.css"/>' >

<title>Success Page</title>
</head>
<body>
<div class="container">  
<div class="row">  
<div class="span6"> 
 <ol class="breadcrumb">
    <li><a href="jobs.html"><b>CSJobs</b></a></li>
    <li><a href="appliedJobs.html?email=${param.email}"><b>Add Job</b></a>
    <li><a href="">Success</a></li>        
  </ol>
</div>
</div>
</div>
<h2><b>Bravo!<br/>
Application submitted successfully</b></h2>
</body>
</html>