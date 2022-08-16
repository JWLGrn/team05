<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有使用者</title>
</head>
<body>
<table>
<c:forEach items="${allUsers}" var="u">
<div>
<form class="form" method="post" action="${contextRoot}/editAdminUsers">
<input  type="hidden" name="userId" value="${u.userId}"/>
<input  name="email" value="${u.email}" />
<input  name="password" value="${u.password}" />
<input  name="userName" value="${u.userName}" />
<input  name="userPhoto" value="${u.userPhoto}" />
<input  name="permission" value="${u.permission}" />
<button type="submit" class="btn btn-primary">送出</button>
<a href="${contextRoot}/deleteUser/${u.userId}"><button  type="button" class="btn btn-primary btn-sm">刪除</button></a>

</form>
</div>
</c:forEach>
</table>

</body>
<script>console.log(${allUsers})</script>
</html>