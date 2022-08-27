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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<!-- Favicon -->
<link rel="shortcut icon" href="favicon.png">
<!-- Normalize Css -->
<link rel="stylesheet" href="${contextRoot}/css/normalize.css">
<!-- Main Css -->
<link rel="stylesheet" href="${contextRoot}/css/main.css">
<!-- Bootstrap Css -->
<link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="${contextRoot}/css/animate.min.css">
<!-- Fontawesome CSS -->
<link rel="stylesheet" href="${contextRoot}/css/fontawesome-all.min.css">
<!-- Flaticon CSS -->
<link rel="stylesheet" href="${contextRoot}/css/flaticon.css">
<!-- Summernote CSS -->
<link rel="stylesheet" href="${contextRoot}/css/summernote.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>

<!-- //CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"> -->

<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
</style>
<style type="text/css">
.keywordimg {
object-fit:cover;
	width: 100px;
	height: 100px;
}

</style>

<title>管理使用者</title>
</head>
<body>
	<jsp:include page="layout/navbar.jsp" />
	<jsp:include page="adminMenu.jsp"></jsp:include>
	<div class="w3-main" style="margin-left: 220px;">
		<h3>管理食譜類別</h3>
		<table id="keywordsTable" class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th scope="col">食譜類別名稱</th>
					<th scope="col">食譜類別照片</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="keywordbody">

				<c:forEach items="${allKeywords}" var="k">
					<form class="form" method="post" action="${contextRoot}/editKeyword">
					<tr>
							<td><input type="hidden" name="keywordId" value="${k.keywordId}" /></td>
							<td><input name="keyword" value="${k.keyword}" /></td>
							<td><img class="keywordimg" alt="" src="${contextRoot}/category/${k.keywordPhoto}"></td>
							<td><button type="submit"
									class="w3-button w3-red w3-hover-black">送出</button></td>
							<td><a href="${contextRoot}/deleteKeyword/${k.keywordId}"><button
										type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>
					</tr>
					</form>
				</c:forEach>

			</tbody>
		</table>
		</div>
</body>
</html>