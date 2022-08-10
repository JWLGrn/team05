<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<c:forEach items="${allUsers}" var="u">
<tr><td>ID：</td><td>${u.userId}</td></tr>
<tr><td>名稱：</td><td>${u.userName}</td></tr>
<tr><td>郵件：</td><td>${u.email}</td></tr>
<tr><td>密碼：</td><td>${u.password}</td></tr>
<tr><td>權限：</td><td>${u.permission}</td></tr>
<tr><td>照片：</td><td>${u.userPhoto}</td></tr>
</c:forEach>
</table>
</body>
</html>