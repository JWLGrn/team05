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
<title>新增食譜類別</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>
<jsp:include page="adminMenu.jsp"></jsp:include>

<div class="w3-main" style="margin-left:220px;">

<h3>新增關鍵字</h3>
<table  class="table table-striped">

<form action="${contextRoot}/addkeyword" method="post" enctype="multipart/form-data" class="login-form">
 	類別名稱:<input type="text" name="keyword" id="word"/><span id="titlecheck" 	class="check"></span><br/>
 	類別圖示:<label><img id="keyword" src="${contextRoot}/image/keyword/file.jpg"/>
      			<input type="file" id="keyword" name="word" onchange="photochange(event,keyword)" accept=".png, .jpg, .jpeg" style="display:none;"/>
      		</label>
			<button id="submit"  onclick="submitBtn()">送出</button>
</form>
</table>
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

</script>

</body>
</html>