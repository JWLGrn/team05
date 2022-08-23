<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding"
		style="z-index: 3; width: 200px; font-weight: bold;" id="mySidebar">
		<br> <a href="javascript:void(0)"
			class="w3-button w3-hide-large w3-display-topleft"
			style="width: 100%; font-size: 22px">Close Menu</a>
		<div class="w3-container">
			<h3 class="w3-padding-64">
				<b>系統管理</b>
			</h3>
		</div>
		<div class="w3-bar-block">
			<a href="${contextRoot}/admInindex" class="w3-bar-item w3-button w3-hover-white">系統管理首頁</a>
			<a href="${contextRoot}/addfoods" class="w3-bar-item w3-button w3-hover-white">新增食材</a>
			<a href="${contextRoot}/showAllFoods123" class="w3-bar-item w3-button w3-hover-white">管理食材</a>
			<a href="${contextRoot}/showAllUsers" class="w3-bar-item w3-button w3-hover-white">管理使用者</a>
			<a href="#packages" class="w3-bar-item w3-button w3-hover-white">管理活動</a>
			<a href="#contact" class="w3-bar-item w3-button w3-hover-white">回覆使用者</a>
		</div>
	</nav>
</body>
</html>