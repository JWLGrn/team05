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
    
    </style>
</head>
<body>
<body>
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
                                        <form:input type="email" required="required" class="main-input-box" path="email" placeholder="請輸入Email" />
                                    </div>
                                    <div class="col-md-6">
                                        <label class="mb-3">Password</label>
                                        <form:input type="password" required="required"  class="main-input-box" path="password" placeholder="請輸入密碼" />
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
                                    <form:button class="btn-fill btn-primary" type="button"><a href="${contextRoot}/Users" style="color:white;">註冊</a><i class="flaticon-next"></i></form:button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">ABOUT ME</h3>
                            </div>
                            <div class="widget-about">
                                <figure class="author-figure"><img src="img/figure/about.jpg" alt="about"></figure>
                                <figure class="author-signature"><img src="img/figure/signature.png" alt="about"></figure>
                                <p>Fusce mauris auctor ollicituder teary iner hendrerit risusey aeenean rauctor pibus
                                    doloer.</p>
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
    <!-- Search Box End Here -->
    <!-- Modal Start-->
<!--     先放著 -->
<!--     <div class="modal fade" id="myModal" role="dialog"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                     <div class="title-default-bold mb-none">Login</div> -->
<!--                     <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                 </div> -->
<!--                 <div class="modal-body"> -->
<%--                     <form class="login-form"> --%>
<!--                         <input class="main-input-box" type="text" placeholder="User Email" /> -->
<!--                         <input class="main-input-box" type="password" placeholder="Password" /> -->
<!--                         <div class="inline-box mb-5 mt-4"> -->
<!--                             <div class="checkbox checkbox-primary"> -->
<!--                                 <input id="modal-checkbox" type="checkbox"> -->
<!--                                 <label for="modal-checkbox">Remember Me</label> -->
<!--                             </div> -->
<!--                             <label class="lost-password"><a href="#">Lost your password?</a></label> -->
<!--                         </div> -->
<!--                         <div class="inline-box mb-5 mt-4"> -->
<!--                             <button class="btn-fill" type="submit" value="Login">Login</button> -->
<!--                             <a href="#" class="btn-register"><i class="fas fa-user"></i>Register Here!</a> -->
<!--                         </div> -->
<%--                     </form> --%>
<!--                     <label>Login connect with your Social Network</label> -->
<!--                     <div class="login-box-social"> -->
<!--                         <ul> -->
<!--                             <li><a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a></li> -->
<!--                             <li><a href="#" class="twitter"><i class="fab fa-twitter"></i></a></li> -->
<!--                             <li><a href="#" class="linkedin"><i class="fab fa-linkedin-in"></i></a></li> -->
<!--                             <li><a href="#" class="google"><i class="fab fa-google-plus-g"></i></a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- Modal End-->
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




</body>
</html>