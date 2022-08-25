<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
    
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>管理食材</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>
<jsp:include page="adminMenu.jsp"></jsp:include>


<div class="w3-main" style="margin-left:220px;"> 

<h3>管理食材</h3>
<label >食材名稱:</label>

<input id="foodsName" placeholder="請輸入食材名稱" />

<label >食材類別:</label>
<select id="foosTypeSelelct" onchange="searchFoodsByfoodsType()">
	<c:forEach items="${option}" var="f">
		<option>${f}</option>
	</c:forEach>
</select>
<table id="foodTable" class="table table-striped">
<thead>
    <tr>
	<th></th>
	  <th scope="col">食材名稱</th>
      <th scope="col">食材類別</th>
      <th scope="col">卡路里</th>
	</tr>
  </thead>
<tbody id="foodbody" >
		<c:forEach items="${page.content}" var="f">	
		<tr id="foodTr">	
		<form class="form" method="post" action="${contextRoot}/editFoods">
		<td><input  type="hidden" name="foodsId" value="${f.foodsId}"/></td>
		<td><input  name="foodsName" value="${f.foodsName}" /></td>
		<td><input  name="foodsType" value="${f.foodsType}" /></td>
		<td><input  name="calorie" value="${f.calorie}" /></td>
		<td><button id="formButton" type="submit" class="w3-button w3-red w3-hover-black">送出</button><td>
		</form>	
		<td><a href="${contextRoot}/deleteFood/${f.foodsId}"><button  type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>						
		</tr>	
		</c:forEach>

</tbody>

</table>
</div>

<div class="row justify-content-center w3-main" style="margin-left:220px;">

			<div class="col-8">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:choose>
					<c:when  test="${page.number != pageNumber -1}">
					<a href="${contextRoot}/showAllFoods?p=${pageNumber}">
							${pageNumber} </a>
					</c:when>
					<c:otherwise>
				       ${pageNumber}
				    </c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script> -->
<script>
$("#foodsName").keyup(function(){
	let foodsnameValue = $('#foodsName').val();
	let urlStr = "${contextRoot}/find/searchFoods/" + foodsnameValue;
	$.ajax({
		url: urlStr ,
		type : 'Get',
		datatype: 'text',
		success:function(data){
			var append1 ;
			 $('#foodbody').empty();
			 for (var i = 0; i < data.length; i++) {
				  const item = data[i];
				  console.log(i, item);
				var text=	'<tr id="foodTr">'+	
					'<form  id="formFood"  class="form" method="post" action="${contextRoot}/editFoods">'
					+'<td><input  type="hidden" name="foodsId'+item.foodsId+'" value="'+item.foodsId+'"/></td>'+
					'<td><input  id="foodsName'+item.foodsId+'" name="foodsName" value="'+item.foodsName+'" /></td>'+
					'<td><input  id="foodsType'+item.foodsId+'"name="foodsType" value="'+item.foodsType+'" /></td>'+
					'<td><input  id="calorie'+item.foodsId+'" =name="calorie" value="'+item.calorie+'" /></td>'+
					'<td><button id="formButton" onclick="sendfromUpdateData('+item.foodsId+')"  class="w3-button w3-red w3-hover-black">送出</button></A></td>'+
					'<td><a href="${contextRoot}/deleteFood/'+item.foodsId+'"><button  type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>'+						
					'</form>'+	
					'</tr>'
					console.log("text",text);
					$("#foodbody").append(text);				
			}
			console.log("data",data);
		}
	});
});
function searchFoodsByfoodsType(){
	let foodsnameValue = $('#foosTypeSelelct').val();
	let urlStr = "${contextRoot}/find/searchFoodsByfoodsType/" + foodsnameValue;
	$.ajax({
		url: urlStr ,
		type : 'Get',
		datatype: 'text',
		success:function(data){
			var append1 ;
			 $('#foodbody').empty();
			 for (var i = 0; i < data.length; i++) {
				  const item = data[i];
				  console.log(i, item);
				var text=	'<tr id="foodTr">'+	
					'<form  id="formFood"  class="form" method="post" action="${contextRoot}/editFoods">'
					+'<td><input  type="hidden" name="foodsId'+item.foodsId+'" value="'+item.foodsId+'"/></td>'+
					'<td><input  id="foodsName'+item.foodsId+'" name="foodsName" value="'+item.foodsName+'" /></td>'+
					'<td><input  id="foodsType'+item.foodsId+'"name="foodsType" value="'+item.foodsType+'" /></td>'+
					'<td><input  id="calorie'+item.foodsId+'" =name="calorie" value="'+item.calorie+'" /></td>'+
					'<td><button id="formButton" onclick="sendfromUpdateData('+item.foodsId+')"  class="w3-button w3-red w3-hover-black">送出</button></A></td>'+
					'<td><a href="${contextRoot}/deleteFood/'+item.foodsId+'"><button  type="button" class="w3-button w3-red w3-hover-black">刪除</button></a></td>'+						
					'</form>'+	
					'</tr>'
					console.log("text",text);
					$("#foodbody").append(text);	
			}
			console.log("data",data);
		}
	});


}

function sendfromUpdateData(foodsId){	
	console.log(foodsId)
	console.log($("#foodsName"+foodsId).val())
	console.log($("#foodsType"+foodsId).val())
	console.log($("#calorie"+foodsId).val())
	const url="${contextRoot}/editFoods/"+foodsId+"/"+$("#foodsName"+foodsId).val()+"/"+$("#foodsType"+foodsId).val()+"/"+$("#calorie"+foodsId).val(); 
	window.location.href = url;
}
//	$(document).ready(function() {
//	$('#foodTable').DataTable();
//});
</script>
</body>

</html>