<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<img  src="${pageContext.request.contextPath}/users/${loginUser.getUserPhoto()}" width="300">${loginUser.getUserName() }
<a href="${pageContext.request.contextPath}/recipe.personal.controller"><input type="button" name="recipe" id="recipe" value="查詢個人食譜頁面"><br>
<a href="${pageContext.request.contextPath}/follow.persional.controller"><input type="button" name="follow" id="follow" value="查詢追蹤使用者頁面"><br>
<a href="${pageContext.request.contextPath}/collect.personal.controller"><input type="button" name="collect" id="collect" value="查詢收藏食譜頁面"><br>




<a href="${pageContext.request.contextPath}/users/logout"><input type="button" value="登出" ></a>

</body>
</html>