<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有食材</title>
</head>
<body>
<select>
<c:forEach items="${option}" var="f">
 <option>${f}</option>
</c:forEach>
</select>
<table>
<c:forEach items="${allFoods}" var="f">
<div>
<form class="form" method="post" action="${contextRoot}/editFoods">
<input  type="hidden" name="foodsId" value="${f.foodsId}"/>
<input  name="foodsName" value="${f.foodsName}" />
<input  name="foodsType" value="${f.foodsType}" />
<input  name="calorie" value="${f.calorie}" />
<button type="submit" class="btn btn-primary">送出</button>
</form>
</div>
</c:forEach>
</table>

</body>
<script>console.log(${allFoods})</script>
</html>