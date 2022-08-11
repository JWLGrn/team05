<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增食材</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<header>
<h3>新增食材</h3>
</header>
<main>

	<form:form action="foods.controller" method="Post" modelAttribute="foods">
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
$("#foodsname").blur(function(){
	let foodsnameValue = $('#foodname').val();
	let urlStr = "${contextRoot}/foodname/checkFoodsByName?foodname=" + foodsnameValue;
	$.ajax({
		url: urlStr ,
		type : 'text',
		sucess:function(data){
			if(data == 1){
				alter("食材已存在，請重新輸入");
			}
		}
	});
});

</script>

</body>
</html>