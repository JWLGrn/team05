<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有食材</title>
</head>
<body>
<table>
<c:forEach items="${allFoods}" var="f">
<tr><td>ID：</td><td>${f.foodsId}</td></tr>
<tr><td>食材名稱：</td><td>${f.foodsName}</td></tr>
<tr><td>食材類別：</td><td>${f.foodsType}</td></tr>
<tr><td>卡路里：</td><td>${f.calorie}</td></tr>
</c:forEach>
</table>
</body>
</html>