<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<img  src="${pageContext.request.contextPath}/users/${loginUser.getUserPhoto()}" width="300">${loginUser.getUserName() }<a href="${pageContext.request.contextPath}/follow.controller"><input type="button" name="follow" id="follow" value="追蹤"><br>

<a href="${pageContext.request.contextPath}/users/logout"><input type="button" value="登出" ></a>

</body>
</html>