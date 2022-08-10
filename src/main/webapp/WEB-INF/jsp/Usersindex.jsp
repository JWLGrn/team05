<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>會員註冊</title>
</head>
<body>
	<form action="${contextRoot}/insertUser" method="post" enctype="multipart/form-data">
		會員名稱:<input type="text" name="user_name"><br /> 
		信箱:<input type="email" name="email"><br /> 
		密碼:<input type="password" name="password"><br /> 
		會員照片:<input type="file" name="user_photo"><br /> <input type="hidden" name="user_id"><br />
		<input type=hidden name="permission" value="1" placeholder="1"><br />
		<input type="submit" value="註冊">
	</form>
	測試成功
</body>
</html>