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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>管理使用者</title>
</head>
<body>
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="w3-main" style="margin-left:220px;">
<h3>管理使用者</h3> 
<label >使用者帳號:</label>

<input id="userName" placeholder="請輸入使用者帳號" />
<table  class="table table-striped">
<thead>
    <tr>
	  <th></th>
	  <th></th>
	  <th scope="col">使用者照片</th>
      <th scope="col">使用者帳號</th>
      <th scope="col">使用者密碼</th>
      <th scope="col">使用者名稱</th>
      <th scope="col">使用者權限</th>
	</tr>
  </thead>
  <tbody id="userbody">

<c:forEach items="${allUsers}" var="u">
<tr>
<form class="form" method="post" action="${contextRoot}/editAdminUsers">

	<td><input type="hidden" name="userId" value="${u.userId}"/></td>
	<td><img alt="" src="users/${u.userPhoto}" ></td>
	<td><input name="email" value="${u.email}" /></td>
	<td><input name="password" value="${u.password}" /></td>
	<td><input name="userName" value="${u.userName}" /></td>
	<td><input name="permission" value="${u.permission}" /></td>
	<td><button type="submit" class="btn btn-primary btn-sm">送出</button></td>
	<td><a href="${contextRoot}/deleteUser/${u.userId}"><button  type="button" class="btn btn-primary btn-sm">刪除</button></a></td>
	
</form>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<script>
$("#userName").keyup(function(){
	let usernameValue = $('#userName').val();
	console.log(usernameValue)
	let urlStr = "${contextRoot}/find/searchUser/" + usernameValue;
	$.ajax({
		url: urlStr ,
		type : 'Get',
		datatype: 'text',
		success:function(data){
			var append1 ;
			 $('#userbody').empty();
			 for (var i = 0; i < data.length; i++) {
				  const item = data[i];
				  console.log(i, item);
				var text=	'<tr id="userTr">'+	
					'<form  id="formUser"  class="form" method="post" action="${contextRoot}/editAdminUsers">'
					+'<td><input  type="hidden" name="userId'+item.userId+'" value="'+item.userId+'"/></td>'+
					'<td><input  id="userPhoto'+item.userId+'" name="userPhoto" value="'+item.userPhoto+'" /></td>'+
					'<td><input  id="email'+item.userId+'"name="email" value="'+item.email+'" /></td>'+
					'<td><input  id="password'+item.userId+'" =name="password" value="'+item.password+'" /></td>'+
					'<td><input  id="userName'+item.userId+'" =name="userName" value="'+item.userName+'" /></td>'+
					'<td><input  id="permission'+item.userId+'" =name="permission" value="'+item.permission+'" /></td>'+
					'<td><button id="formButton" onclick="sendfromUpdateData('+item.foodsId+')"  class="btn btn-primary btn-sm">送出</button></A></td>'+
					'<td><a href="${contextRoot}/deleteFood/'+item.userId+'"><button  type="button" class="btn btn-primary btn-sm">刪除</button></a></td>'+						
					'</form>'+	
					'</tr>'
					console.log("text",text);
					$("#userbody").append(text);				
			}
			console.log("data",data);
		}
	});
});
function sendfromUpdateData(userId){	
	console.log(userId)
	console.log($("#userPhoto"+userId).val())
	console.log($("#email"+userId).val())
	console.log($("#password"+userId).val())
	console.log($("#userName"+userId).val())
	console.log($("#permission"+userId).val())
	const url="${contextRoot}/editFoods/"+userId+"/"+$("#userPhoto"+userId).val()+"/"+$("#email"+userId).val()+"/"+$("#password"+userId).val()+"/"+$("#userName"+userId).val()+"/"+$("#permission"+userId).val(); 
	window.location.href = url;
}
</script>
</body>
</html>