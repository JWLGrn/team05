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
.userimg {
	width: 100px;
	height: 100px;
}</style>

<title>管理使用者</title>
</head>
<body>
	<jsp:include page="layout/navbar.jsp" />
	<jsp:include page="adminMenu.jsp"></jsp:include>
	<div class="w3-main" style="margin-left: 220px;">
		<h3>管理使用者</h3>
		<label>使用者帳號:</label> <input id="userName" placeholder="請輸入使用者帳號" />
		<table id="userTable" class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th scope="col">使用者照片</th>
					<th scope="col">使用者帳號</th>
					<th scope="col">使用者密碼</th>
					<th scope="col">使用者名稱</th>
					<th scope="col">使用者權限</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody id="userbody">

				<c:forEach items="${allUsers}" var="u">
					
						<form class="form" method="post" action="${contextRoot}/editAdminUsers">
						<tr>
							<td><input type="hidden" name="userId" value="${u.userId}" /></td>
							<td><img class="userimg" alt="" src="${contextRoot}/users/${u.userPhoto}"></td>
							<td><input name="email" value="${u.email}" /></td>
							<td><input name="password" value="${u.password}" /></td>
							<td><input name="userName" value="${u.userName}" /></td>
							<td><input name="permission" value="${u.permission}" /></td>
							<td><button type="submit"
									class="w3-button w3-red w3-hover-black">更新</button></td>
							<td><a href="${contextRoot}/deleteUser/${u.userId}"><button
										type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>
						</tr>
						</form>
					
				</c:forEach>

			</tbody>
		</table>
	</div>
	<!-- Jquery Js -->
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextRoot}/js/popper.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<!-- Plugins Js -->
	<script src="${contextRoot}/js/plugins.js"></script>
	<!-- Owl Carousel Js -->
	<script src="${contextRoot}/js/owl.carousel.min.js"></script>
	<!-- Summernote JS -->
	<script src="${contextRoot}/js/summernote.min.js"></script>
	<!-- Select 2 Js -->
	<script src="${contextRoot}/js/select2.full.min.js"></script>
	<!-- Smoothscroll Js -->
	<script src="${contextRoot}/js/smoothscroll.min.js"></script>
	<!-- Custom Js -->
	<script src="${contextRoot}/js/main.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script> -->
 	<script>
		$("#userName")
				.keyup(
						function() {
							let usernameValue = $('#userName').val();
							console.log(usernameValue)
							let urlStr = "${contextRoot}/find/searchUser/"
									+ usernameValue;
							$
									.ajax({
										url : urlStr,
										type : 'Get',
										datatype : 'text',
										success : function(data) {
											var append1;
											$('#userbody').empty();
											for (var i = 0; i < data.length; i++) {
												const item = data[i];
												console.log(i, item);
<<<<<<< HEAD:src/main/webapp/WEB-INF/jsp/test/showAllUsers.jsp
												
												
												// 下拉式選單
												var per = item.permission;
												var selectList = '<select name="permission" id="permission'+item.userId+'">'
												var selectArray = ["","管理員","一般會員"]
												for(let j=1;j<=2;j++){
													if(j == per){
														selectList += '<option value=' + j + ' selected>' + selectArray[j] + '</option>'
													}else{
														selectList += '<option value=' + j + '>' + selectArray[j] + '</option>'
													}
												}
												selectList += '</select>'
												
												
												var text = '<tr id="userTr">'
														+ '<form  id="formUser"  class="form" method="post" action="${contextRoot}/editAdminUsers">'
=======
												var text = '<tr id="userTr">'+
														 '<form  id="formUser"  class="form" method="post" action="${contextRoot}/editAdminUsers">'
>>>>>>> c7b55c48b6cec8ab6ca2d325f46d0698e5a82f21:src/main/webapp/WEB-INF/jsp/showAllUsers.jsp
														+ '<td><input  type="hidden" name="userId'+item.userId+'" value="'+item.userId+'"/></td>'
														+ '<td><img class="userimg" alt="" src="${contextRoot}/users/'+item.userPhoto+'"></td>'
														+ '<td><input  id="email'+item.userId+'"name="email" value="'+item.email+'" /></td>'
														+ '<td><input  id="password'+item.userId+'" =name="password" value="'+item.password+'" /></td>'
														+ '<td><input  id="userName'+item.userId+'" =name="userName" value="'+item.userName+'" /></td>'
														+ '<td>'+selectList+'</td>'
														+ '<td><button id="formButton" onclick="sendfromUpdateData('
														+ item.userId
														+ ')"  class="w3-button w3-red w3-hover-black">更新</button></A></td>'
														+ '<td><a href="${contextRoot}/deleteUser/'+item.userId+'"><button  type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>'
														+ '</form>' + '</tr>'
												console.log("text", text);
												$("#userbody").append(text);
											}
											console.log("data", data);
										}
									});
						});
		function sendfromUpdateData(userId) {
			console.log(userId)
			console.log($("#userPhoto" + userId).val())
			console.log($("#email" + userId).val())
			console.log($("#password" + userId).val())
			console.log($("#userName" + userId).val())
			console.log($("#permission" + userId).val())
			const url = "${contextRoot}/editAdminUsers/" + userId + "/"
					+ $("#userName" + userId).val() + "/"
					+ $("#email" + userId).val() + "/"
					+ $("#password" + userId).val() + "/"
					+ $("#permission" + userId).val()
					//+ $("#userPhoto" + userId).val() + "/";
			window.location.href = url;
<<<<<<< HEAD:src/main/webapp/WEB-INF/jsp/test/showAllUsers.jsp
<<<<<<< HEAD
=======
</tbody>
</table>
</div>
    <!-- Jquery Js -->
    <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="${contextRoot}/js/popper.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
    <!-- Plugins Js -->
    <script src="${contextRoot}/js/plugins.js"></script>
    <!-- Owl Carousel Js -->
    <script src="${contextRoot}/js/owl.carousel.min.js"></script>
    <!-- Summernote JS -->
    <script src="${contextRoot}/js/summernote.min.js"></script>
    <!-- Select 2 Js -->
    <script src="${contextRoot}/js/select2.full.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
<script>
$("#userName").keyup(function(){
	let usernameValue = $('#userName').val();
	console.log(usernameValue)
	let urlStr = "${contextRoot}/find/searchUser/"+ usernameValue;
	$.ajax({
		url: urlStr ,
		type : 'Get',
		datatype: 'text',
		success:function(data){
			var append1 ;
			 $('#userbody').empty();
			 for (var i = 0; i < data.length; i++) {
				  const item = data[i];
				  console.log(i,item);
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
					$("#userbody").append(text);				
			}
			console.log("data",data);
=======
>>>>>>> 6993d3947379654d8fbbf57d8d9744c2534ad297
=======
>>>>>>> c7b55c48b6cec8ab6ca2d325f46d0698e5a82f21:src/main/webapp/WEB-INF/jsp/showAllUsers.jsp
		}
// 		$(document).ready(function() {
// 			$('#userTable').DataTable();
// 		});
	</script>
</body>
</html>