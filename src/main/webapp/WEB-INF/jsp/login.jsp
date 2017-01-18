<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="<c:url value="/resources/breadcrumb.css"/>" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>CS Jobs - Login</title>
</head>
<body>
<h2>CS Jobs</h2>

<form action="<c:url value='/login'/>" method="post">
<div class="form-group">
   &nbsp;&nbsp;<b>User:</b> <input type="text"
		name="username" class="form-control" style="width: 300px;" /></div>
<div class="form-group">
    &nbsp;&nbsp;<b>Password:</b> <input type="password"
		name="password" class="form-control" style="width: 300px;" /></div>
    <input type="hidden" name="_csrf" value="${_csrf.token }" />
    <input type="submit" name="submit"
		value="Login" class="btn btn-success"/>
</form>
</body>
</html>
