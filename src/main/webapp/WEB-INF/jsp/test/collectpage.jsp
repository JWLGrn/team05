<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>個人收藏頁面</title>
</head>
<body>
<div>個人收藏頁面</div>
<c:forEach items="${collect}" var="c">
<span>${c.recipe.cookTitle} </span>
<span>${c.recipe.cookDescription} </span>
<span>${c.recipe.totalCal} </span>
<span>${c.recipe.recipeId} </span>


</c:forEach>
</body>
</html>