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
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
.wrongMessage{
			margin-left:30px;
			color:red;
		}
</style>
<title>Insert Type</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="col-lg-9" style="height:calc(100vh);margin:auto;padding-top:30px;margin-left:300px">
<h3>新增食譜類別</h3>


<form action="${contextRoot}/addkeyword" method="post" enctype="multipart/form-data" class="login-form needs-validation" novalidate>
 	<table  class="table table-striped">
 	<tr><td>類別名稱:</td></tr>
 	<tr><td><input type="text" name="keyword" id="word" required/><span id="titlecheck" 	class="check"></span></td></tr>
 	<tr><td>類別圖示:</td></tr>
 	<tr><td><label><img id="imgfile" src="http://localhost:8090/cookblog/recipe/upload.png"/>
      			<input type="file" id="keyword" name="keywordphoto" onchange="photochange(event,imgfile)" accept=".png, .jpg, .jpeg" style="display:none;" />
      		</label></td></tr>
			<tr><td><button id="submit" class="btn-fill btn-danger">加入</button><span id="wrongMessage"></span></td></tr>
</table>
	<div class="btn-area">
		<button type="button" class="btn-fill btn-danger" onclick="keyin()">
			下午茶<i class="flaticon-next"></i>
		</button>
	</div>
</form>

</div>
</div>
</div>

<script>
$("#word").blur(function(){
	console.log($("#word").val());
	let keywordValue = $('#word').val();
	let urlStr = "${contextRoot}/keyword/checkkeywordBykeyword?keyword=" + keywordValue;
	$.ajax({
		url: urlStr ,
		type : 'post',
		datatype: 'text',
		success:function(data){
			console.log(data);
			if(data == 1){
				alert("類別已存在，請重新輸入");
				$("#word").val("");
			}
		}
	});
});

//檔案發生改變
function photochange(event,imgid){
	//預覽圖
	
	var img=document.getElementById(imgid.id);
	var reader = new FileReader();
	img.src = URL.createObjectURL(event.target.files[0]);
	img.onload = function() {
      URL.revokeObjectURL(img.src) // free memory
    }
}

function keyin() {
	document.getElementById("word").value = "下午茶";
}


//驗證
(function() {
	  'use strict';
	  window.addEventListener('load', function() {
	    var forms = document.getElementsByClassName('needs-validation');
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      // 送出時驗證
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	          $("#wrongMessage").html("").append("<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>資料輸入不完全！")
			  $("#wrongMessage").removeClass("currectMessage").addClass("wrongMessage")
	        }
	        form.classList.add('was-validated');
	      }, false);
	      
	      // 驗證是否填寫完成
	      form.addEventListener('change', function(event) {
	        if (form.checkValidity() === true) {
	          $("#wrongMessage").html("").append("<span class='typcn typcn-tick-outline' style='font-size:25px;'></span>")
			  $("#wrongMessage").removeClass("wrongMessage").addClass("currectMessage")
	        }
	      }, false);
	    });
	  }, false);
	})();
</script>

</body>
</html>