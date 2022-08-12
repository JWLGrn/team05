<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="Root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I~~~~Cook</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
</head>
<body>
	<h1>我是首頁!</h1>
	<ul>
		<li><a href="${contextRoot}/loginpage">登入</a></li>
	</ul>
</body>
</html>