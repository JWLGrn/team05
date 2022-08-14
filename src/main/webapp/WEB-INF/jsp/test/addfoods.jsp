<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>新增食材</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<h3>新增食材</h3>

<main>

	<form:form action="addfoods" method="Post" modelAttribute="addfoodsAttribute">
		<form:label path="foodsName" >食材名稱:</form:label>
		<form:input path="foodsName" placeholder="請輸入食材名稱" />
		<form:label path="foodsType" >食材類別:</form:label>
		<form:input path="foodsType" placeholder="請輸入食材類別"/>
		<form:label path="calorie" >卡路里:</form:label>
		<form:input path="calorie" placeholder="請輸入卡路里"/>
			<div style="color:red">${msg.loginfail}</div>	
		<form:button type="submit">加入</form:button>
		<form:button type="button">取消</form:button>		
	</form:form>

</main>
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