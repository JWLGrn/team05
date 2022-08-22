<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢追蹤使用者</title>
</head>
<body>
<div>查詢追蹤使用者</div>
<c:forEach items="${follow}" var="f">
<span>${f.track} </span>


</c:forEach>
</body>
</html>