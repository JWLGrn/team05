<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><td>ID：</td><td>${recipe.recipeId}</td> <td></td> </tr>
<tr><td>作者：</td><td>${recipe.users.userId}</td><td></td></tr>
<tr><td>名稱：</td><td>${recipe.cookTitle}</td><td></td></tr>
<tr><td>描述：</td><td>${recipe.cookDescription}</td><td></td></tr>
<tr><td>份數(人)：</td><td>${recipe.cookServe}</td><td></td></tr>
<tr><td>製作時間：</td><td>${recipe.cookTime}</td><td></td></tr>
<tr><td>發表日期：</td><td><fmt:formatDate pattern="yyyy/MM/dd EEEE" value="${recipe.date}" /></td><td></td></tr>
<tr><td>總卡路里：</td><td>${recipe.totalCal}</td><td></td></tr>
<c:forEach items="${recipe.recipeFoods}" var="rf">
<tr><td>食材：</td><td>${rf.foods.foodsName}</td><td>${rf.gram}克</td></tr>
</c:forEach>
</table>
<a href="${contextRoot}/updatePageTest?id=${recipe.recipeId}"><button>修改</button></a>
</body>
</html>