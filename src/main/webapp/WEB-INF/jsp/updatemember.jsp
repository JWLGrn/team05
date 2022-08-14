<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員修改</title>
</head>
<body>
	<form action="${contextRoot}/users/updateMember02" method="post"
		enctype="multipart/form-data">
		<input type="hidden" value="${GetOneUser.userId }" name="user_id" > 
		會員名稱:<input	type="text" value="${GetOneUser.userName }" name="user_name"><br />
		信箱:<input type="email" value="${GetOneUser.email }" name="email"
			id="email"><br /> 密碼:<input type="password"
			value="${GetOneUser.password }" name="password"><br /> 會員照片:<input
			type="file" name="user_photo"><br /> <input type=hidden
			name="permission" value="1" placeholder="1"><br /> <input
			type="submit" value="修改">
	</form>

	${GetOneUser }
	<br>
</body>
</html>