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
</head>
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
<img  src="users/${loginUser.userPhoto}" width="300"><br>
${loginUser.getUserName() }
<div ></div>
<!-- <button type="button" onclick="Favorite()" >食譜ID</button> -->
案讚測試功能:<div  id="myDiv"></div>
檢舉測試功能:<div id="findUser"></div>
 
查看User資料測試:${loginUser }<br>
檢舉資料${report }
 
<script>
function Favorite()
{
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
var content ='';
             var recipe=JSON.parse(xhr.responseText);
             for(var i =0;i<recipe.length;i++){
            	 content+= '<a href="' + "${contextRoot}/favorite?recipe_id="+recipe[i].recipeId+"&&user_id=${loginUser.userId }" + '">'
            	 +'<img src="break.jpg" width="40">'+ 
            	 recipe[i].cookTitle + '</a>';
            	 console.log(recipe[i].recipeId);
             }
             document.getElementById("myDiv").innerHTML=content;
  }
});

xhr.open("GET", "http://localhost:8090/cookblog/finder",true);

xhr.send();
}

function report(){
	var xhr = new XMLHttpRequest();
	xhr.withCredentials = true;

	xhr.addEventListener("readystatechange", function() {
	  if(this.readyState === 4) {
		  var content ='';
		  var report=JSON.parse(xhr.responseText);
		  for(var i =0;i<report.length;i++){
		  content+= '<a href="' + "${contextRoot}/users/report?user_id="+report[i].userId+"&&user_id=${loginUser.userId }" + '">'
     	 +'<img src="report.jpg" width="40">'+ 
     	report[i].userName + '</a>';
	    console.log(this.responseText);
	    content+='<a>'
	    document.getElementById("findUser").innerHTML=content;
		  }
	  }
	});

	xhr.open("GET", "http://localhost:8090/cookblog/findUsers",true);

	xhr.send();
}

</script>
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