<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>新增食材</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>新增食材</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<h3>新增食材</h3>

<main>
<div class="w3-main" style="margin-left:220px;"> 
	<form:form action="addfoods" method="Post" modelAttribute="addfoodsAttribute">
		<form:label path="foodsName" >食材名稱:</form:label>
		<form:input path="foodsName" placeholder="請輸入食材名稱" /></br>
		<form:label path="foodsType" >食材類別:</form:label>
		<form:input path="foodsType" placeholder="請輸入食材類別"/></br>
		<form:label path="calorie" >卡路里　:</form:label>
		<form:input path="calorie" placeholder="請輸入卡路里"/></br>
			<div style="color:red">${msg.loginfail}</div>	
		<form:button type="submit">加入</form:button>
		<form:button type="reset">取消</form:button>		
	</form:form>
</div>
</main>
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:200px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container">
    <h3 class="w3-padding-64"><b>系統管理</b></h3>
  </div>
  <div class="w3-bar-block">
    <a href="#admin" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">系統管理首頁</a> 
    <a href="${contextRoot}/showAllUsers" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">管理使用者</a> 
    <a href="${contextRoot}/addfoods" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">新增食材</a> 
    <a href="${contextRoot}/showAllFoods123" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">管理食材</a> 
    <a href="#packages" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Packages</a> 
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Contact</a>
  </div>
</nav>

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