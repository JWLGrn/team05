<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ranna | Submit Recipes</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    <link rel="icon" href="${contextRoot}/css/favicon.png">
    
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
</head>
<body onload="stoplogin()">
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <!-- ScrollUp Start Here -->
    <a href="#wrapper" data-type="section-switch" class="scrollup">
        <i class="fas fa-angle-double-up"></i>
    </a>
    <!-- ScrollUp End Here -->
    <div id="wrapper" class="wrapper">
        <!-- Header Area Start Here -->
        <jsp:include page="../layout/navbar.jsp"/>
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        <section class="inner-page-banner bg-common" data-bg-image="/img/figure/inner-page-banner1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>Welcome to I Cook</h1>
                            <ul>
                                <li>
                                    <a href="${contextRoot}">Home</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
<!--         <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50"> -->
<!--             <div class="container"> -->
<!-- 	----------------------------- -->
 <section class="login-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="login-box-layout1">
                            <div class="section-heading heading-dark">
                                <h2 class="item-heading">LOGIN FORM</h2>
                            </div>
                            <form:form action="login.controller" method="Post" modelAttribute="login" class="login-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="mb-3">Email Address</label>
                                        <form:input id="email" type="email" required="required" class="main-input-box" path="email" placeholder="請輸入Email" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="mb-3">Password</label>
                                        <form:input id="password" type="password" required="required"  class="main-input-box" path="password" placeholder="請輸入密碼" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="checkbox checkbox-primary">
                                            <input id="checkbox1" type="checkbox">
                                            <label for="checkbox1">Remember Me</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="lost-password"><a href="${contextRoot}/setGmail">Lost your password?</a></label>
                                    </div>
                                </div>
                                <div class="btn-area">
                                    <form:button class="btn-fill btn-primary" type="submit" value="Login">登入<i class="flaticon-next"></i></form:button>
                                    <a href="${contextRoot}/Users" style="color:white;"><form:button class="btn-fill btn-primary" type="button">註冊<i class="flaticon-next"></i></form:button></a>
                                </div>
                                <div class="btn-area">
												<div class="btn-area">
													<button type="button" class="btn-fill btn-primary" onclick="keyin1()">
														蒙其·D·魯夫<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin2()">
														joy<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin3()">
														eason<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin4()">
														yang<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin5()">
														sf<i class="flaticon-next"></i>
													</button>
													<button type="button" class="btn-fill btn-primary" onclick="keyin6()">
														green<i class="flaticon-next"></i>
													</button>
												</div>
											</div>
                            </form:form>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">ABOUT US</h3>
                            </div>
                            <div class="widget-about">
                                <figure class="author-figure"><img src="${contextRoot}/image/homephoto.jpg" alt="about"></figure>
                                <p>Welcome, please come in!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<!-- --------------------------- -->
	  <!-- Submit Recipe Area End Here -->
        <!-- Footer Area Start Here -->
        <jsp:include page="../layout/footer.jsp"/>
        <!-- Footer Area End Here -->
    </div>
    <!-- Search Box Start Here -->
    <div id="search" class="search-wrap">
        <button type="button" class="close">�</button>
        <form class="search-form">
            <input type="search" value="" placeholder="Type here........" />
            <button type="submit" class="search-btn"><i class="flaticon-search"></i></button>
        </form>
    </div>

    
    <script type="text/javascript">
    
    function stoplogin(){
     if(${loginUser.permission ==0}){
    	 
     }
    }
    
    function keyin1() {
		document.getElementById("email").value = "Luffy@gmail.com";
		document.getElementById("password").value = "qaz123";
	}
	function keyin2() {
		document.getElementById("email").value = "joy@gmail.com";
		document.getElementById("password").value = "1234";
	}
	function keyin3() {
		document.getElementById("email").value = "eason@gmail.com";
		document.getElementById("password").value = "1234";
	}
	function keyin4() {
		document.getElementById("email").value = "yang@gmail.com";
		document.getElementById("password").value = "1234";
	}
	function keyin5() {
		document.getElementById("email").value = "sf@gmail.com";
		document.getElementById("password").value = "1234";
	}
	function keyin6() {
		document.getElementById("email").value = "green@gmail.com";
		document.getElementById("password").value = "1234";
	}
// 	function userDetail(){
		
	
	
// 	var xhr = new XMLHttpRequest();
// 	xhr.withCredentials = true;

// 	xhr.addEventListener("readystatechange", function() {
// 	  if(this.readyState === 4) {
// 		  var content ='';
//           var users=JSON.parse(xhr.responseText);
//           for(var i =0;i<users.length;i++){
//          	 content+= '<a href="' + "${contextRoot}/favorite?recipe_id="+recipe[i].recipeId+"&&user_id=${loginUser.userId }" + '">'
//          	 +'<img src="break.jpg" width="40">'+ 
//          	 recipe[i].cookTitle + '</a>';
//          	 console.log(recipe[i].recipeId);
//           }
//           document.getElementById("myDiv").innerHTML=content;
// 	  }
// 	});

// 	xhr.open("GET", "http://localhost:8090/cookblog/findUsers");

// 	xhr.send();
// 	}
	
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