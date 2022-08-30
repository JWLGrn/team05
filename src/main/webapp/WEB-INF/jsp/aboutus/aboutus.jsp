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
							<h1>Welcome to I Cook ${loginUser.userName}</h1>
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
<!-- 		------------------------------------------------------ -->
<section class="all-recipes-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="about-box">
                            <div class="about-figure">
                                <img src="${contextRoot}/image/aboutus.jpg" alt="About">
                            </div>
                            <h2 class="about-title title-bar bar-center">I Cook</h2>
                            <div><p class="item-description">每個家裡都有廚房，當爐子的火一開、炊煙一起，家也就溫暖了起來。在許多人的成長經驗中，餐桌上的飯菜香充滿了家的幸福溫度，長大後，回想起媽媽做的菜，是既熟悉又難以忘懷的味道。
但隨著時代演進，現代很多媽媽都不煮飯了。主婦聯盟董事王南琦在三八婦女節應邀演講，她問現場聽眾「媽媽的味道是什麼？媽媽的拿手菜有哪些？」很多30、40歲以上的女性邊分享媽媽的拿手菜時邊流淚，
沒說出口的是對媽媽的思念；但年輕一點、20多歲以下的聽眾幾乎都說不出媽媽的味道是什麼。有趣的是，近來趨勢又漸漸走回頭路。食安問題嚴重、加上愈來愈多家庭意識到，全家一起晚餐、假日共食的重要性，家中爐火一個個重新開張。為服務忙碌現代雙薪家庭的各式便利餐食服務也開始進入市場，
簡化家庭煮食的作業。再加上家庭各個成員共同參與「一起吃飯」的準備工作，讓全家有機會再次回到自家的餐桌上。這也是我們的宗旨，希望可以提供大家互相交流的平台。</p></div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </section>
        
<!--         ---------------------------------------------------------------------------------- -->


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