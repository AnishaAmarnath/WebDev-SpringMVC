<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="<c:url value="/resources/breadcrumb.css"/>" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>CS Jobs - Registration</title>
</head>

<body>
<form:form modelAttribute="user">
<div class="form-group">
<b>Email:</b>
  <form:input path="email" class="form-control" style="width: 300px;" /> <b><form:errors path="email" /></b><br/>

 <b>Password:</b>>
  <form:password path="password" class="form-control" style="width: 300px;"  /> <b><form:errors path="password"/></b><br/>
<b>Password again:</b>
  <form:password path="password2" class="form-control" style="width: 300px;"  /> <b><form:errors path="password2"/></b><br/>
<b>Last Name:</b>
  <form:input path="lastName" class="form-control" style="width: 300px;"  /> <b><form:errors path="lastName"/></b><br/>
<b>First Name:</b>
<form:input path="firstName" class="form-control" style="width: 300px;"  /> <b><form:errors path="firstName"/></b><br/>
<b>Phone:</b>
<form:input path="phone" class="form-control" style="width: 300px;"  /> <b><form:errors path="phone"/></b><br/>
<b>Address:</b>
 <form:input path="address" class="form-control" style="width: 300px;"  /> <b><form:errors path="address"/></b><br/><br/>
 </div>
 <input type="submit" name="register" value="register" class="btn btn-success" />
</form:form>
</body>
</html>
