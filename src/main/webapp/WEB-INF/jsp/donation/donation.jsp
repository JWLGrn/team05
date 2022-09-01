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
<title>Donation</title>
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
<style type="text/css">
    	.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/donation.jpg");
    		background-position: center;
            background-size: cover;
		}
</style>
</head>
<body>
<!-- <body onload="Favorite();report()" > -->
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
							<h1>Donation To ISpoon ${loginUser.userName}</h1>
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
		<!-- Inne Page Banner Area End Here -->
        <!-- Recipe With Sidebar Area Start Here -->

<!-- 		-------------------------------------------------------------------------------- -->
<section class="login-page-wrap padding-top-80 padding-bottom-50">
			<div class="container">
				<div class="row gutters-60">
				<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="login-box-layout1">
							<div class="section-heading heading-dark">
								<h2 class="item-heading">DONATION</h2>
								<p>依據衛生福利部最新公布，2021年各縣市最低生活費標準，也就是俗稱的「貧窮線」，6都除了台中市、桃園市沒調整，台北市、新北市、高雄市和台南市都調高。但依據全球貧窮率報告指出，台灣法定貧窮人口比率為1.5%，而韓國貧窮人口率 14.61%，日本 16.1%，香港 19.6%，美國 15.1 %，台灣不到這些國家的 1/10。如與經濟情況、貧富差距和台灣相似的韓國貧窮人口相較，台灣真實貧窮人口應是現在法定貧窮人口的10倍，差距達320萬人，是應受政府補助的，也是我們所謂的「社福邊緣戶」！
                                   為了救助生活在最底層的經濟弱勢家庭，基督教救助協會除原有已執行之「重大災難救助」、「急難家庭救助」、
                                  「弱勢家庭兒童課後陪讀」等服務外，再推出「1919食物銀行」。定期提供經濟弱勢家庭基本民生必需品，以減少其日常生活開支，進而將有限的金錢，
                                   運用在孩童教育、醫療等方面，改善生活品質。2010年12月第一次試辦物資發放，2011年4月正式於高雄、屏東、台東等「八八災區」開始展開服務，
                                   至今救助範團已遍及全台，每個月幫助近5000個家庭。
								</p>
							</div>
							<form action="${contextRoot}/ecpay" method="post" class="login-form">
								<div class="row">
									<div class="col-md-6">
<%-- 									<input type="hidden"    name="${loginUser.userId}"  id="${loginUser.userId}" class="main-input-box"><br />  --%>
									<label class="mb-3">Name</label> 
										<input type="text"  required="required"  name="user_name"  id="user_name" class="main-input-box"placeholder="請輸入名字"><br /> 
									<label class="mb-3">Phone</label> 
										<input type="text"  required="required"  name="phone"  id="phone" class="main-input-box"placeholder="請輸入電話"><br /> 
										<label class="mb-3">Address</label> 
										<input type="text"  required="required"  name="address"  id="address" class="main-input-box"placeholder="請輸入地址"><br /> 
										
										<label class="mb-3">Donation</label> 
										<input type="text"  required="required"  name="price"  id="price" class="main-input-box"placeholder="請輸入金額"><br /> 
										<label class="mb-3">Email</label> 
										<input type="email" name="email" id="email"class="main-input-box" placeholder="請輸入信箱"><span id="msg"></span><br />
										<input type="hidden" name="user_id"><br /> 
										<input type=hidden name="permission" value="1" placeholder="1" id="permission">
										<!-- 			<i class="fa fa-check" -->
										<!-- 			aria-hidden="true"></i> -->
										<div class="btn-area">
											<button type="submit" class="btn-fill btn-primary" onclick="window.open('${contextRoot}')">
												送出<i class="flaticon-next"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Recipe Without Sidebar Area End Here -->
        <!-- Footer Area Start Here -->
        <jsp:include page="../layout/footer.jsp"/>
        <!-- Footer Area End Here -->
		
<!-- 		-------------------------------------------------------------------- -->
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

</body>
</html>