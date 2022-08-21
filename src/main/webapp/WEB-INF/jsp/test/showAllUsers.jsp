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
  <tbody>

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
</body>
</html>