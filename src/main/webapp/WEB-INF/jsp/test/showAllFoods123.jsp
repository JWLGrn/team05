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
<title>顯示所有食材</title>
</head>
<body>
<div class="w3-main" style="margin-left:220px;"> 
<table  class="table table-striped">
<thead>
    <tr>
	<th></th>
	  <th scope="col">食材名稱</th>
      <th scope="col">食材類別</th>
      <th scope="col">卡路里</th>
	</tr>
  </thead>
  <tbody>

<c:forEach items="${page.content}" var="f">
<tr>

<form class="form" method="post" action="${contextRoot}/editFoods">
<td><input  type="hidden" name="foodsId" value="${f.foodsId}"/></td>
<td><input  name="foodsName" value="${f.foodsName}" /></td>
<td><input  name="foodsType" value="${f.foodsType}" /></td>
<td><input  name="calorie" value="${f.calorie}" /></td>
<td><button type="submit" class="btn btn-primary">送出</button><td>
<td><a href="${contextRoot}/deleteFood/${f.foodsId}"><button  type="button" class="btn btn-primary btn-sm">刪除</button></a></td>
						
</form>

</c:forEach>
</tbody>
</table>
</div>

<div class="row justify-content-center w3-main" style="margin-left:220px;">
			<div class="col-8">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:choose>
					<c:when  test="${page.number != pageNumber -1}">
					<a href="${contextRoot}/showAllFoods123?p=${pageNumber}">
							${pageNumber} </a>
					</c:when>
					<c:otherwise>
				       ${pageNumber}
				    </c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>
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

</body>
</html>