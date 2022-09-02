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
<title>Report User</title>
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
<style type="text/css">
.aaa{
background-color: #ff4a52;
border-radius: 45px;
}
        .inner-page-banner:before {
		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/report.jpg");
		background-position: center;
		background-size: cover;
		}
	textarea,select {
    font-size: 17px;
    padding: 10px 20px;
    color: #000000;
    border: 1px solid #cccccc;
    background-color: white;
    border-radius: 0;
        overflow: auto;
    resize: vertical;
}
select {
	padding: 3px;
	margin-bottom:12px;
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
							<h1>Report User</h1>
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
        <!-- Author Area Start Here -->
        
<!--         -------------------------------------------------------------------- -->
<section class="login-page-wrap padding-top-80 padding-bottom-50">
		<div class="container">
			<div class="row gutters-60">
			<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div class="login-box-layout1">
						<div class="section-heading heading-dark">
							<h2 class="item-heading">REPORT MEMBER</h2>
						</div>
						<div class="form-group">
						<form action="${contextRoot}/users/reportSuccess" method="get" class="submit-recipe-form">
                        <input name="reportStatus" type="hidden" value="未受理"><br>
                        <input name="getAuthorUser" type="hidden" value="${getAuthorUser.userId }">
                        <input name="loginUser" type="hidden" value="${loginUser.userId }">
                        <input name="reportTime" type="hidden" value=" ${date }">
							<div class="row">
								<div class="col-md-6">
									<label class="mb-3">檢舉類型：</label>
						<select name="reportType" class="main-input-box">
                                      <option selected="selected" value="不實料理">不實料理</option>
                                      <option value="禁止廣告">禁止廣告</option>
                                      <option value="不雅照片">不雅照片</option>
                                </select><br>		
                                 <label class="mb-3">檢舉內容：</label> 
										<div ><textarea rows="5" cols="33" name="reportContext" class="main-input-box" placeholder="請輸入檢舉內容"  class="textarea form-control"></textarea></div><br>
									<!-- 			<i class="fa fa-check" -->
									<!-- 			aria-hidden="true"></i> -->
									<div class="btn-area">
										<button type="submit" class="btn-submit">送出<i class="flaticon-next"></i></button>
										<div class="btn-area">
											<div class="btn-area"></div>
										</div>
									</div>
								</div>
							</div>
						</form></div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- 	---------------------------------------------------- -->




<%-- 被檢舉者資料這裡:${getAuthorUser }<br> --%>

<%--  檢舉者資料Session!!!!!!!!!!!!!!!!!!!這裡喔:${loginUser }<br> --%>
 

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
		<script src="${contextRoot}/js/main.js">
</script> 
</body>
</html>