<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<!-- Favicon -->
    <link rel="icon" href="${contextRoot}/css/favicon.png">
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
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>新增食材</title>
</head>
<body>

<jsp:include page="layout/navbar.jsp"/>
<jsp:include page="adminMenu.jsp"></jsp:include>

<div class="w3-main" style="margin-left:220px;">

<h3>新增食材</h3>
<table  class="table table-striped">

	<form:form action="addfoods" method="Post" modelAttribute="addfoodsAttribute">
		<tr><td><form:label path="foodsName" >食材名稱:</form:label></td></tr>
		<tr><td><form:input path="foodsName" placeholder="請輸入食材名稱" /></td></tr>
		<tr><td><form:label path="foodsType" >食材類別:</form:label></td></tr>
		<tr><td><form:input path="foodsType" placeholder="請輸入食材類別"/></td></tr>
		<tr><td><form:label path="calorie" >卡路里　:</form:label></td></tr>
		<tr><td><form:input path="calorie" placeholder="請輸入卡路里"/></td></tr>
		<tr>
		<td><form:button type="submit" class="w3-button w3-red w3-hover-black">加入</form:button>
			<form:button type="reset" class="w3-button w3-red w3-hover-black">取消</form:button>	</td>
		</tr>	
	</form:form>
	
	</table>
</div>

<script>
$("#foodsName").blur(function(){
	let foodsnameValue = $('#foodsName').val();
	let urlStr = "${contextRoot}/foodname/checkFoodsByName?foodname=" + foodsnameValue;
	$.ajax({
		url: urlStr ,
		type : 'post',
		datatype: 'text',
		success:function(data){
			if(data == 1){
				alert("食材已存在，請重新輸入");
				$("#foodsName").val("");
			}
		}
	});
});

</script>

</body>
</html>