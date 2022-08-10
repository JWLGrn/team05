<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${loginUser.getUser_name() }

<a href="${pageContext.request.contextPath }/users/logout"><input type="button" value="登出" ></a>

</body>
</html>