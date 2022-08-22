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
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
<style type="text/css">
.eventimg{
	width: 200px; 
	height:200px;
	
}
</style>
<style>

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
		<jsp:include page="../jsp/layout/navbar.jsp" />
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
								<li><a href="index.html">Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
	<!-- Recipe Without Sidebar Area Start Here -->
	<section
		class="recipe-without-sidebar-wrap padding-top-80 padding-bottom-22">
		<div class="container">
			<div class="row" id="showevent">
<!-- 				<div class="col-lg-4 col-md-6 col-sm-6 col-12"> -->
<!-- 					<div class="product-box-layout1"> -->
<!-- 						<figure class="item-figure"> -->
<!-- 							<a href="single-recipe1.html"><img -->
<!-- 								src="img/product/product38.jpg" alt="Product"></a> -->
<!-- 						</figure> -->
<!-- 						<div class="item-content"> -->
<!-- 							<h3 class="item-title"> -->
<!-- 								<a href="single-recipe1.html">食物Title</a> -->
<!-- 							</h3> -->
<!-- 							<p>介紹</p> -->
<!-- 							<ul class="entry-meta"> -->
<!-- 								<li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li> -->
<!-- 								<li><a href="#"><i class="fas fa-user"></i>by <span>JohnMartin</span></a></li> -->
											
<!-- 								<li><a href="#"><i class="fas fa-heart"></i><span>02</span> -->
<!-- 										Likes</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
							
			</div>
		</div>
	</section>
	<!-- Recipe Without Sidebar Area End Here -->
	<!-- Footer Area Start Here -->
	<footer class="ranna-bg-dark">
		<div class="container">
			<div class="footer-logo">
				<a href="index.html"><img src="img/logo-light.png"
					class="img-fluid" alt="footer-logo"></a>
			</div>
			
		</div>
	</footer>
	
	<!-- Jquery Js -->

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
	<script type="text/javascript">
	$(document).ready(function(){
		//顯示活動
		 showAllEvent();
	});
	//顯示活動  管理員:crud,一般使用者:參加活動
	function showAllEvent(){
		var settings = {
		        "url": "http://localhost:8090/cookblog/event/showevent",
		    	"method": "GET",
		   		"timeout": 0,
		    };
	 		$.ajax(settings).done(function (response) {
	 			var replydata="";
	 			$.each(response,function(index,value){
	 				replydata+=
	 					'<div class="col-lg-4 col-md-6 col-sm-6 col-12">'
					    +'<div class="product-box-layout1">'
						+'<figure class="item-figure">'
						+'<a href="${contextRoot}/recipe/find/'+value.eventId+'">'
						+'<img src="${contextRoot}/image/event/'+value.eventPhoto+'" alt="Product" class="eventimg"></a>'
						+'</figure>'
						+'<div class="item-content">'
						+'<h3 class="item-title">'
						+'<a href="single-recipe1.html">'+value.eventTitle+'</a>'
						+'</h3>'
						+'<p>'+value.eventContext+'</p>'
						+'<p class="fas fa-clock">活動時間:'+value.timeStart+'~'+value.timeEnd+'</p>'
						+'<ul class="entry-meta">'
						+'<li><a href="#"><i class="fas fa-user"></i>by <span>JohnMartin</span></a></li>'
					if(${userId}==1){
	 	 				     replydata+='<button class="fas fa-user" onclick="updateevent('+value.eventId+')">修改</button>";
	 	 				     replydata+='<button class="fas fa-user" onclick="del('+value.eventId+')">刪除</button>";
	 				    }else{
	 				    	replydata+='<button  class="fas fa-user" onclick="participate('+value.eventId+')">參加活動</button>";  	
	 				    }
					replydata+='</ul>'
						+'</div>'
					    +'</div>'
				        +'</div>';
	 					
	 					
// 						"活動Id:"+value.eventId+"<br/>"
// 						+"活動標題:"+value.eventTitle+""
// 						+"<img src='${contextRoot}/image/event/"+value.eventPhoto+"' class='userimg'/><br/>"
// 						+"敘述:"+value.eventContext+"<br/>"
// 					    +"開始時間:"+value.timeStart+"<br/>"
// 						+"結束時間:"+value.timeEnd;
// 					if(${userId}==1){
// 	 				     replydata+="<button onclick='updateevent("+value.eventId+")'>修改</button>";
// 	 				     replydata+="<button onclick='del("+value.eventId+")'>刪除</button>";
// 				    }else{
// 				    	replydata+="<button onclick='participate("+value.eventId+")'>參加活動</button>";
				    	
// 				    }
// 					replydata+="<br/>-----------------------------------------<br/>";
	 			})

	 			$("#showevent").html(replydata);
	 		});	
	}

	</script>


</body>

</html>