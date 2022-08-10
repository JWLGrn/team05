<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<h3>會員登入</h3>
</header>
<main>
	<form:form action="login.controller" method="Post" modelAttribute="login">
		<form:label path="email" type="email">會員帳號:</form:label>
		<form:input path="email" placeholder="請輸入Email" />
		<form:label path="password" >會員密碼:</form:label>
		<form:input path="password" placeholder="請輸入密碼"/>
			<div style="color:red">${msg.loginfail}</div>	
		<form:button type="submit">登入</form:button>
		<form:button type="button">註冊</form:button>
			
	</form:form>


</main>
</body>
</html>