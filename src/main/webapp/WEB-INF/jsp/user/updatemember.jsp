<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Ranna | Submit Recipes</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
</head>
<body>
	<!-- Preloader Start Here -->
	<div id="preloader"></div>
	<!-- Preloader End Here -->
	<!-- ScrollUp Start Here -->
	<a href="#wrapper" data-type="section-switch" class="scrollup"> <i
		class="fas fa-angle-double-up"></i>
	</a>
	<!-- ScrollUp End Here -->
	<div id="wrapper" class="wrapper">
		<!-- Header Area Start Here -->
		<jsp:include page="../layout/navbar.jsp" />
		<!-- Header Area End Here -->
		<!-- Inne Page Banner Area Start Here -->
		<section class="inner-page-banner bg-common"
			data-bg-image="/img/figure/inner-page-banner1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="breadcrumbs-area">
							<h1>Hello ${loginUser.userName }</h1>
							<ul>
								<li><a href="${contextRoot}">Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- Inne Page Banner Area End Here -->
	<!-- Submit Recipe Area Start Here -->
	<!--         <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50"> -->
	<!--             <div class="container"> -->
	<!-- ------------------------------------------------------------------------------------------- -->
	<section class="login-page-wrap padding-top-80 padding-bottom-50">
		<div class="container">
			<div class="row gutters-60">
				<div class="col-lg-8">
					<div class="login-box-layout1">
						<div class="section-heading heading-dark">
							<h2 class="item-heading">UPDATE MEMBER</h2>
						</div>
						<form action="${contextRoot}/users/updateMember02" method="post"
							enctype="multipart/form-data" class="login-form">
							<input type="hidden" value="${loginUser.userId }" name="user_id">

							<div class="row">
								<div class="col-md-6">
									<label class="mb-3">Mmeber Name</label> <input
										placeholder="請輸入姓名" type="text" value="${loginUser.userName }"
										name="user_name" class="main-input-box"><br /> <label
										class="mb-3">Email Address</label> 信箱:<input type="email"
										value="${loginUser.email }" name="email" id="email"
										class="main-input-box" placeholder="請輸入信箱"><br /> <label
										class="mb-3">Password</label> <input type="password"
										value="${loginUser.password }" name="password"
										class="main-input-box" placeholder="請輸入密碼"><br /> <label class="mb-3" id="fileload">大頭貼<br /> <img src="${contextRoot}/image/users/${loginUser.userPhoto}" id="imgView"/>
   										<input type="file" name="user_photo" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br/>
									<input type=hidden name="permission" value="1" placeholder="1" id="permission">
										
										 <label
										class="mb-3">Member Photo</label> <input type="file"
										name="user_photo" id="photo" class="main-input-box" placeholder="請上傳照片"><br />
									<label class="mb-3">Mmeber Name</label> 
									<input placeholder="請輸入姓名" type="text" value="${loginUser.userName }"name="user_name" class="main-input-box"><br /> 
									
									<label class="mb-3">Email Address</label> 信箱:
									<input type="email"value="${loginUser.email }" name="email" id="email" class="main-input-box" placeholder="請輸入信箱"><br /> 
									
									<label class="mb-3">Password</label> 
									<input type="password" value="${loginUser.password }" name="password" class="main-input-box" placeholder="請輸入密碼"><br /> 
									
									<label class="mb-3" id="fileload">大頭貼<br /> <img src="${contextRoot}/image/users/${loginUser.userPhoto}" id="imgView"/>
   									<input type="file" name="user_photo" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br />
									<input type=hidden name="permission" value="1" placeholder="1"
										id="permission">
									<!-- 			<i class="fa fa-check" -->
									<!-- 			aria-hidden="true"></i> -->
									<div class="btn-area">
										<button type="submit" class="btn-fill btn-primary">
											Update<i class="flaticon-next"></i>
										</button>
										<div class="btn-area">
											<div class="btn-area"></div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 		------------------------------------------------------------ -->
		
	<!-- ------------------------------------------------- -->
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
    function imgview(event,imgid){   
		   const fr = new FileReader();
		   //抓url
		   let fPhoto=document.getElementById("eventPhoto").files;
		   if(fPhoto.length>0){//有圖
		    let fileToLoad=fPhoto[0];//取得檔案詳細資料
		    fr.onload = function (e) {
		         fileDataURL=e.target.result
		      $('#'+imgid.id+'').attr('src', fileDataURL);//img預覽
		   };
		    fr.readAsDataURL(event.target.files[0]);//img預覽
		  }
		}	
</script>
</body>
</html>