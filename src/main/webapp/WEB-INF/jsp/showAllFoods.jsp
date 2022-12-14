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
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
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
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
    
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>Ingredients Manage</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="col-lg-9" style="height:calc(100vh);margin:auto;padding-top:30px;margin-left:300px">

<h3>????????????</h3>
<!-- <label >????????????:</label> -->

<!-- <input id="foodsName" placeholder="?????????????????????" /> -->

<!-- <label >????????????:</label> -->
<!-- <select id="foosTypeSelelct" onchange="searchFoodsByfoodsType()"> -->
<!-- 	<c:forEach items="${option}" var="f"> -->
<!-- 		<option>${f}</option> -->
<!-- 	</c:forEach> -->
<table id="foodTable" class="table table-striped">
<thead>
    <tr>
    <th></th>
	  <th scope="col">????????????</th>
      <th scope="col">????????????</th>
      <th scope="col">?????????</th>
      <th></th><th></th>
	</tr>
  </thead>
<tbody id="foodbody" >
		<c:forEach items="${foods}" var="f">	
<!-- 		<form class="form" method="post" action="${contextRoot}/editFoods"> -->
		<tr id="foodTr">	
		 <td>${f.foodsId}</td>
		 <td><input type="hidden" id="foodsName${f.foodsId}"  name="foodsName" value="${f.foodsName}"/><label>${f.foodsName}</label></td>
		 <td><input type="hidden" id="foodsType${f.foodsId}" name="foodsType" value="${f.foodsType}" /><label>${f.foodsType}</label></td>
		 <td><input type="hidden" id="calorie${f.foodsId}" name="calorie" value="${f.calorie}" /><label>${f.calorie}</label></td>
		 <td>
		    <button id="changeBtn" type="button" class="btn-fill changeBtn btn-danger">??????</button>
		    <button onclick="sendfromUpdateData(${f.foodsId})" id="formButton" type="button" class="btn-fill btn-danger" style="display:none">??????</button>
		 </td>
		 <td><button  type="button" class="btn-fill  btn-danger" onclick="deleteFood(${f.foodsId})">??????</button></td>						
		</tr>
<!-- 		</form>	 -->
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
		</div></div></div>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- Jquery Js -->
<!-- 	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script> -->
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
$(document).ready( function () {
	 table();
} );

$(".changeBtn").click(function(e){
	$(e.target).siblings("button").show();
	$(e.target).hide();
	$(e.target).parents("tr").find("input").attr("type","text");
	$(e.target).parents("tr").find("label").hide();
});

function table(){
	$('#foodTable').DataTable({
	"ordering": false,
	"searching": true,
	language: {
        "lengthMenu": "?????? _MENU_ ?????????",
        "sProcessing": "?????????...",
        "sZeroRecords": "??????????????????",
        "sInfo": "????????? _MAX_ ?????????",
        "sInfoEmpty": "???????????? 0 ?????????",
        "sInfoFiltered": " ",
        "sInfoPostFix": "",
        "sSearch": "??????:",
        "sUrl": "",
        "sEmptyTable": "???????????????????????????",
        "sLoadingRecords": "???????????????...",
        "sInfoThousands": ",",
        "oPaginate": {
            "sFirst": "??????",
            "sPrevious": "?????????",
            "sNext": "?????????",
            "sLast": "??????"
        },
        "order": [[0, "desc"]],
        "oAria": {
            "sSortAscending": ": ?????????????????????",
            "sSortDescending": ": ?????????????????????"
        }
    },
});
}


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
					'<td><button id="formButton" onclick="sendfromUpdateData('+item.foodsId+')"  class="w3-button w3-red w3-hover-black">??????</button></A></td>'+
					'<td><button  type="button" class="w3-button w3-red w3-hover-black" onclick="deleteFood('+item.foodsId+')">??????</button></td>'+	
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
					'<td><button id="formButton" onclick="sendfromUpdateData('+item.foodsId+')"  class="w3-button w3-red w3-hover-black">??????</button></A></td>'+
					'<td><button  type="button" class="w3-button w3-red w3-hover-black" onclick="deleteFood('+item.foodsId+')">??????</button></td>'+						
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


     // ??????????????????
        function deleteFood(foodId){
			Swal.fire({
	        title: '??????',
	    	text: "???????????????????????????",
	    	icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '??????',
	    	cancelButtonText: '??????',
	    }).then((result) => {
	         if (result.isConfirmed) {
	             Swal.fire({
	                title: '??????',
	    	    	text: "??????????????????",
	    	    	icon: 'success',
	    	    	confirmButtonText: '??????????????????'
	            }).then((success) => {
	    	    	 if (success.isConfirmed) {
	    		    	 window.location.href = "${contextRoot}/deleteFood/"+foodId;
	    	    	 }
	    		 })
	          }
	      })
	    }
</script>
</body>

</html>