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
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/microns/microns.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>

<style>
.error {
	color: red;
	margin-top:2px;
}

.success {
	color: #00EC00;
}
		.wrongMessage{
			margin-left:30px;
			color:red;
		}
		.currectMessage{
			margin-left:30px;
			color:green;
		}
</style>
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
							<h1>Welcome to I Cook</h1>
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
		<!-- -------------------------------------------------------------------------------------------------- -->
		<section class="login-page-wrap padding-top-80 padding-bottom-50">
			<div class="container">
				<div class="row gutters-60">
				<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="login-box-layout1">
							<div class="section-heading heading-dark">
								<h2 class="item-heading">REGISTER</h2>
							</div>
							<form action="${contextRoot}/insertUser" method="post"
								enctype="multipart/form-data" class="login-form needs-validation" novalidate>
								<div class="row">
									<div class="col-md-6">
										<label class="mb-3">暱稱</label> 
										<input type="text"  required="required"  name="user_name"  id="user_name" class="main-input-box"placeholder="請輸入姓名" required="required"><br /> 
										<label class="mb-3">電子信箱</label> 
										<input type="email" name="email" id="email"class="main-input-box" placeholder="請輸入信箱" required><span id="msg" ></span><br />
										<label class="mb-3">密碼</label>
										<input type="password" name="password" id="password" class="main-input-box" placeholder="請輸入密碼" required="required"><br /> 
<!-- 										<label class="mb-3">大頭貼</label> -->
<!-- 										<input type="file" name="user_photo" class="main-input-box" placeholder="請上傳照片"> -->
										
										<!-- 			<i class="fa fa-check" -->
										<!-- 			aria-hidden="true"></i> -->
										<div class="btn-area">
											<button type="submit" class="btn-fill btn-primary">
												送出<i class="flaticon-next"></i>
											</button><span id="wrongMessage"></span>
											<div class="btn-area">
												<div class="btn-area">
													<button type="button" class="btn-fill btn-primary" onclick="keyin1()">
														Eason會員<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin2()">
														sf管理者<i class="flaticon-next"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-6">
									    <label class="mb-3" id="fileload">大頭貼<br /> <img src="${contextRoot}/image/recipe/upload.png" id="imgView"/>
   										<input type="file"  name="user_photo" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br />
										<input type="hidden" name="user_id"><br /> 
										<input type=hidden name="permission" value="1" placeholder="1" id="permission">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		

		<!--  ------------------------------------------------------------------ -->
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
		
			$("#email").blur(function() {
								//取得使用者輸入的mail
								let emailValue = $('#email').val();
								if (emailValue != "") {
									let urlStr = "${contextRoot}/users/checkmail?email="+ emailValue;
									$.ajax({
												url : urlStr,
												type : 'POST',
												dataType : 'text',
												success : function(data) {
													if (data == 1) {
														$("#msg").text("用戶已存在,請輸入其他帳號");
														$("#msg").prepend("<span class='icon mu txt-24 mu-fail'></span>")
														$("#msg").attr("class","error");
														$("#email").val("");
														console.log($("#email")
																.val())
														// alert("用戶已存在,請輸入其他帳號");
													} else {
														$("#msg").text("帳號可以使用");
														$("#msg").prepend("<span class='icon mu txt-24 mu-pass'></span>")
														$("#msg").attr("class","success");
													}
												}
											});
								} else {
									$("#msg").text("請輸入email");
									$("#msg").attr("class", "error");
								}
							});
			function focus() {
				var account = document.getElementById("user_name");
			}
			function loginVerify() {
				var account = document.getElementById("user_name").value;
				var password = document.getElementById("password").value;
				if (account.length == '') {
					alert('帳號不能為空');
					return;
				}
				if (password.length == '') {
					alert('密碼不能為空');
					return;
				}
				document.getElementById("form").submit();
			}
			function keyin1() {
				document.getElementById("user_name").value = "Eason";
				document.getElementById("email").value = "Eason@gmail.com";
				document.getElementById("password").value = "qaz123";
				document.getElementById("permission").value = "1";

			}
			function keyin2() {
				document.getElementById("user_name").value = "sf";
				document.getElementById("email").value = "sf@gmail.com";
				document.getElementById("password").value = "qaz456";
				document.getElementById("permission").value = "2";
			}
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
			
			// 驗證
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