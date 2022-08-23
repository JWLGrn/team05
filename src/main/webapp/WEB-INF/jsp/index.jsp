<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>I~~~~Cook</title>
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
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
    
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style type="text/css">
    	.imgcut{
			height:500px;
			overflow:hidden;
		}

        .obfit{
            object-fit: contain;
            width: 300px;
            height: 200px;
        }
        .obfit2{
            object-fit: contain;
            width: 350px;
            height: 250px;
        }
    </style>
</head>
<body>
    <!-- Add your site or application content here -->
    <!-- Preloader Start Here -->
    <div id="preloader"></div>
    <!-- Preloader End Here -->
    <!-- ScrollUp Start Here -->
    <a href="#wrapper" data-type="section-switch" class="scrollup">
        <i class="fas fa-angle-double-up"></i>
    </a>
    <!-- ScrollUp End Here -->
    <div id="wrapper" class="wrapper parallaxie repeat-y bg-size-auto" data-bg-image="img/figure/page-bg.jpg">
        <!-- Header Area Start Here -->
        <jsp:include page="layout/navbar.jsp"/>
        <!-- Header Area End Here -->
        <!-- 首頁輪播 -->
        <section class="ranna-slider-area">
            <div class="container">      
                <div class="rc-carousel nav-control-layout2" id="figureList" data-loop="true" data-items="30" data-margin="5"
                    data-autoplay="true" data-autoplay-timeout="5000" data-smart-speed="700" data-dots="false"
                    data-nav="true" data-nav-speed="false" data-r-x-small="1" data-r-x-small-nav="true"
                    data-r-x-small-dots="false" data-r-x-medium="1" data-r-x-medium-nav="true" data-r-x-medium-dots="false"
                    data-r-small="1" data-r-small-nav="true" data-r-small-dots="false" data-r-medium="1"
                    data-r-medium-nav="true" data-r-medium-dots="false" data-r-large="1" data-r-large-nav="true"
                    data-r-large-dots="false" data-r-extra-large="1" data-r-extra-large-nav="true"
                    data-r-extra-large-dots="false">

                </div>
            </div>
        </section>
        <!-- 首頁輪播 -->
        <!-- 隨機推播 -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="row gutters-40" id="randomRecipe">
                    
                </div>
            </div>
        </section>
        <!-- 隨機推播 -->
        <!-- Editor’s Choice Start Here -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="ranna-box-style">
                    <div class="section-heading heading-dark">
                        <h2 class="item-heading">最多人收藏的食譜</h2>
                    </div>
                    <div class="row gutters-40" id="mostCollect">
					<!--  --------------重複的結構-------------- -->
                    <!--  --------------重複的結構-------------- --> 
                    </div>
                </div>
            </div>
        </section>
        <!-- Editor’s Choice End Here -->
        <!-- Popular Recipe Start Here -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="row gutters-40">
                    <div class="col-lg-8">
                        <div class="ranna-box-style">
                            <div class="section-heading heading-dark">
                                <h2 class="item-heading">POPULAR RECIPES</h2>
                            </div>
                            <div class="row gutters-40">
                                <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="product-box-layout6">
                                        <div class="item-figure">
                                            <img src="img/product/product14.jpg" alt="Product">
                                            <a href="single-recipe1.html" class="item-dot">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </a>
                                        </div>
                                        <div class="item-content">
                                            <span class="sub-title">BREAKFAST</span>
                                            <h3 class="item-title"><a href="single-recipe1.html">Asian Chicken Noodles</a></h3>
                                            <ul class="item-rating">
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-empty"><i class="fas fa-star"></i></li>
                                                <li><span>9<span> / 10</span></span> </li>
                                            </ul>
                                            <p>Pro sint falli definitiones noel ei verear civibus
                                                consequat efficiantue.Vestibulum ante ipsum primis in fau
                                                cibus.</p>
                                            <ul class="entry-meta remove-3rd-child-lg">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="product-box-layout6">
                                        <div class="item-figure">
                                            <img src="img/product/product15.jpg" alt="Product">
                                            <a href="single-recipe1.html" class="item-dot">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </a>
                                        </div>
                                        <div class="item-content">
                                            <span class="sub-title">SEA FOOD</span>
                                            <h3 class="item-title"><a href="single-recipe1.html">Italiano Salad Mixed</a></h3>
                                            <ul class="item-rating">
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-empty"><i class="fas fa-star"></i></li>
                                                <li><span>9<span> / 10</span></span> </li>
                                            </ul>
                                            <p>Pro sint falli definitiones noel ei verear civibus
                                                consequat efficiantue.Vestibulum ante ipsum primis in fau
                                                cibus.</p>
                                            <ul class="entry-meta remove-3rd-child-lg">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="product-box-layout6">
                                        <div class="item-figure">
                                            <img src="img/product/product16.jpg" alt="Product">
                                            <a href="single-recipe1.html" class="item-dot">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </a>
                                        </div>
                                        <div class="item-content">
                                            <span class="sub-title">SALAD</span>
                                            <h3 class="item-title"><a href="single-recipe1.html">Maxican Dessert</a></h3>
                                            <ul class="item-rating">
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-empty"><i class="fas fa-star"></i></li>
                                                <li><span>9<span> / 10</span></span> </li>
                                            </ul>
                                            <p>Pro sint falli definitiones noel ei verear civibus
                                                consequat efficiantue.Vestibulum ante ipsum primis in fau
                                                cibus.</p>
                                            <ul class="entry-meta remove-3rd-child-lg">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-lg-block d-xl-none col-lg-6 col-md-6 col-sm-6 col-12">
                                    <div class="product-box-layout6">
                                        <div class="item-figure">
                                            <img src="img/product/product14.jpg" alt="Product">
                                            <a href="single-recipe1.html" class="item-dot">
                                                <span></span>
                                                <span></span>
                                                <span></span>
                                            </a>
                                        </div>
                                        <div class="item-content">
                                            <span class="sub-title">BREAKFAST</span>
                                            <h3 class="item-title"><a href="single-recipe1.html">Asian Chicken Noodles</a></h3>
                                            <ul class="item-rating">
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-fill"><i class="fas fa-star"></i></li>
                                                <li class="star-empty"><i class="fas fa-star"></i></li>
                                                <li><span>9<span> / 10</span></span> </li>
                                            </ul>
                                            <p>Pro sint falli definitiones noel ei verear civibus
                                                consequat efficiantue.Vestibulum ante ipsum primis in fau
                                                cibus.</p>
                                            <ul class="entry-meta remove-3rd-child-lg">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget ranna-box-padding">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">FEATURED ARTICLE</h3>
                            </div>
                            <div class="widget-featured-feed2">
                                <div class="rc-carousel nav-control-layout1" data-loop="true" data-items="3"
                                    data-margin="5" data-autoplay="false" data-autoplay-timeout="5000" data-smart-speed="700"
                                    data-dots="false" data-nav="true" data-nav-speed="false" data-r-x-small="1"
                                    data-r-x-small-nav="true" data-r-x-small-dots="false" data-r-x-medium="1"
                                    data-r-x-medium-nav="true" data-r-x-medium-dots="false" data-r-small="1"
                                    data-r-small-nav="true" data-r-small-dots="false" data-r-medium="1"
                                    data-r-medium-nav="true" data-r-medium-dots="false" data-r-large="1"
                                    data-r-large-nav="true" data-r-large-dots="false" data-r-extra-large="1"
                                    data-r-extra-large-nav="true" data-r-extra-large-dots="false">
                                    <div class="featured-box-layout2">
                                        <div class="item-img">
                                            <img src="img/product/product17.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">BREAKFAST</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund.</p>
                                            <ul class="entry-meta">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="featured-box-layout2">
                                        <div class="item-img">
                                            <img src="img/product/product18.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">DINNER</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund.</p>
                                            <ul class="entry-meta">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="featured-box-layout2">
                                        <div class="item-img">
                                            <img src="img/product/product19.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">SALAD</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund.</p>
                                            <ul class="entry-meta">
                                                <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                                <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Popular Recipe End Here -->
        <!-- Instagram Start Here -->
        <section class="instagram-feed-wrap">
            <div class="instagram-feed-title"><a href="#"><i class="fab fa-instagram"></i>Follow On Instagram</a></div>
            <ul class="instagram-feed-figure">
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure1.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure2.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure3.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure4.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure5.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure6.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure7.jpg" alt="Social"></a>
                </li>
                <li>
                    <a href="single-recipe1.html"><img src="img/social-figure/social-figure8.jpg" alt="Social"></a>
                </li>
            </ul>
        </section>
        <!-- Instagram End Here -->
        <!-- Footer Area Start Here -->
        <jsp:include page="layout/footer.jsp"/>
        <!-- Footer Area End Here -->
    </div>
    <!-- Search Box Start Here -->
    <div id="search" class="search-wrap">
        <button type="button" class="close">×</button>
        <form class="search-form">
            <input type="search" value="" placeholder="Type here........" />
            <button type="submit" class="search-btn"><i class="flaticon-search"></i></button>
        </form>
    </div>
    <!-- Search Box End Here -->
    <!-- Modal Start-->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="title-default-bold mb-none">Login</div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form class="login-form">
                        <input class="main-input-box" type="text" placeholder="User Name" />
                        <input class="main-input-box" type="password" placeholder="Password" />
                        <div class="inline-box mb-5 mt-4">
                            <div class="checkbox checkbox-primary">
                                <input id="modal-checkbox" type="checkbox">
                                <label for="modal-checkbox">Remember Me</label>
                            </div>
                            <label class="lost-password"><a href="#">Lost your password?</a></label>
                        </div>
                        <div class="inline-box mb-5 mt-4">
                            <button class="btn-fill" type="submit" value="Login">Login</button>
                            <a href="#" class="btn-register"><i class="fas fa-user"></i>Register Here!</a>
                        </div>
                    </form>
                    <label>Login connect with your Social Network</label>
                    <div class="login-box-social">
                        <ul>
                            <li><a href="#" class="facebook"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#" class="twitter"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#" class="linkedin"><i class="fab fa-linkedin-in"></i></a></li>
                            <li><a href="#" class="google"><i class="fab fa-google-plus-g"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
    <!-- Select 2 Js -->
    <script src="${contextRoot}/js/select2.full.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <script>
    
       // 首頁橫幅，按讚前五名
        var settings = {
            "url": "http://localhost:8090/cookblog/find/favorrank/5",
            "method": "GET",
            "timeout": 0
            };

        $.ajax(settings).done(function (response) {
            var figure = '';
            for(let i in response){
                let keywords = "";
                let kWord = response[i].recipeKeyword;
                for(let j in kWord){
                    keywords += kWord[j].keywords+" "
                }
                figure += '<div class="ranna-slider-content-layout2">'
                    +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'"><img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" class="imgcut"></a></figure>'
                    +'<div class="item-content"><span class="sub-title">'+keywords.trim()+'</span>'
                    +'<h2 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h2>'
                    +'<p>'+response[i].cookDescription+'</p>'
                    +'<ul class="entry-meta"><li><a><i class="fas fa-clock"></i>'+response[i].cookTime+' Mins</a></li>'
                    +'<li><a href="#"><i class="fas fa-user"></i>by <span>'+response[i].userName+'</span></a></li>'
                    +'<li><a href="#"><i class="fas fa-heart"></i><span>'+response[i].favorite.length+'</span> Likes</a></li></ul></div></div>'
            }
            $("#figureList").html("").append(figure);
            $("#figureList").each(function () {
            var carousel = $(this),
                loop = carousel.data('loop'),
                items = carousel.data('items'),
                margin = carousel.data('margin'),
                stagePadding = carousel.data('stage-padding'),
                autoplay = carousel.data('autoplay'),
                autoplayTimeout = carousel.data('autoplay-timeout'),
                smartSpeed = carousel.data('smart-speed'),
                dots = carousel.data('dots'),
                nav = carousel.data('nav'),
                navSpeed = carousel.data('nav-speed'),
                rXsmall = carousel.data('r-x-small'),
                rXsmallNav = carousel.data('r-x-small-nav'),
                rXsmallDots = carousel.data('r-x-small-dots'),
                rXmedium = carousel.data('r-x-medium'),
                rXmediumNav = carousel.data('r-x-medium-nav'),
                rXmediumDots = carousel.data('r-x-medium-dots'),
                rSmall = carousel.data('r-small'),
                rSmallNav = carousel.data('r-small-nav'),
                rSmallDots = carousel.data('r-small-dots'),
                rMedium = carousel.data('r-medium'),
                rMediumNav = carousel.data('r-medium-nav'),
                rMediumDots = carousel.data('r-medium-dots'),
                rLarge = carousel.data('r-large'),
                rLargeNav = carousel.data('r-large-nav'),
                rLargeDots = carousel.data('r-large-dots'),
                rExtraLarge = carousel.data('r-extra-large'),
                rExtraLargeNav = carousel.data('r-extra-large-nav'),
                rExtraLargeDots = carousel.data('r-extra-large-dots'),
                center = carousel.data('center'),
                custom_nav = carousel.data('custom-nav') || '';
            carousel.addClass('owl-carousel');
            var owl = carousel.owlCarousel({
                loop: (loop ? true : false),
                items: (items ? items : 4),
                lazyLoad: true,
                margin: (margin ? margin : 0),
                autoplay: (autoplay ? true : false),
                autoplayTimeout: (autoplayTimeout ? autoplayTimeout : 1000),
                smartSpeed: (smartSpeed ? smartSpeed : 250),
                dots: (dots ? true : false),
                nav: (nav ? true : false),
                navText: ['<i class="flaticon-back" aria-hidden="true"></i>', '<i class="flaticon-next" aria-hidden="true"></i>'],
                navSpeed: (navSpeed ? true : false),
                center: (center ? true : false),
                responsiveClass: true,
                responsive: {
                    0: {
                        items: (rXsmall ? rXsmall : 1),
                        nav: (rXsmallNav ? true : false),
                        dots: (rXsmallDots ? true : false)
                    },
                    576: {
                        items: (rXmedium ? rXmedium : 2),
                        nav: (rXmediumNav ? true : false),
                        dots: (rXmediumDots ? true : false)
                    },
                    768: {
                        items: (rSmall ? rSmall : 3),
                        nav: (rSmallNav ? true : false),
                        dots: (rSmallDots ? true : false)
                    },
                    992: {
                        items: (rMedium ? rMedium : 4),
                        nav: (rMediumNav ? true : false),
                        dots: (rMediumDots ? true : false)
                    },
                    1200: {
                        items: (rLarge ? rLarge : 5),
                        nav: (rLargeNav ? true : false),
                        dots: (rLargeDots ? true : false)
                    },
                    1400: {
                        items: (rExtraLarge ? rExtraLarge : 6),
                        nav: (rExtraLargeNav ? true : false),
                        dots: (rExtraLargeDots ? true : false)
                    }
                }
            });
            if (custom_nav) {
                var nav = $(custom_nav),
                    nav_next = $('.rt-next', nav),
                    nav_prev = $('.rt-prev', nav);

                nav_next.on('click', function (e) {
                    e.preventDefault();
                    owl.trigger('next.owl.carousel');
                    return false;
                });

                nav_prev.on('click', function (e) {
                    e.preventDefault();
                    owl.trigger('prev.owl.carousel');
                    return false;
                });
            }
        });
        });

        // 首頁隨機推播
        var settings = {
            "url": "http://localhost:8090/cookblog/recipe/find/random/3",
            "method": "GET",
            "timeout": 0
        };

        $.ajax(settings).done(function (response) {
            var figure = '';
            for(let i in response){
                let keywords = "";
                let kWord = response[i].recipeKeyword;
                for(let j in kWord){
                    keywords += kWord[j].keywords+" "
                }
                figure += '<div class="col-lg-4 col-md-6 col-sm-12">'
                        +'<div class="product-box-layout4"><div class="item-figure">'
                        +'<img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" alt="Product" class="obfit"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'" class="item-dot">'
                        +'<span></span><span></span><span></span></a></div>'
                        +'<div class="item-content"><span class="sub-title">'+keywords.trim()+'</span>'
                        +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h3>'
                        +'<ul class="entry-meta">'
                        +'<li><a href="#"><i class="fas fa-clock"></i>'+response[i].cookTime+' Mins</a></li>'
                        +'<li><a href="#"><i class="fas fa-user"></i>by <span>'+response[i].userName+'</span></a></li>'
                        +'<li><a href="#"><i class="fas fa-heart"></i><span>'+response[i].favorite.length+'</span> Likes</a></li></ul></div></div></div>'
            }
            $("#randomRecipe").html("").append(figure);
        });
        
        // 最多人收藏
        var settings = {
  			"url": "http://localhost:8090/cookblog/find/collectrank/3",
  			"method": "GET",
  			"timeout": 0,
			};

		$.ajax(settings).done(function (response) {
			var figure = '';
            for(let i in response){
                let keywords = "";
                let kWord = response[i].recipeKeyword;
                for(let j in kWord){
                    keywords += kWord[j].keywords+" "
                }
                figure += '<div class="col-lg-4 col-md-6 col-sm-12 col-12">'
                +'<div class="product-box-layout5"><div class="item-figure">'
                +'<img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" alt="Product" class="obfit2">'
                +'<a href="${contextRoot}/recipe/find/'+response[i].recipeId+'" class="item-dot"><span></span><span></span><span></span></a>'
                +'</div><div class="item-content"><span class="sub-title">'+keywords.trim()+'</span>'
                +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h3>'
                +'<ul class="entry-meta"><li><a href="#"><i class="fas fa-clock"></i>'+response[i].cookTime+' Mins</a></li>'
                +'<li><a href="#"><i class="fas fa-user"></i>by <span>'+response[i].userName+'</span></a></li>'
                +'</ul></div></div></div>'
                $("#mostCollect").html("").append(figure);
            }
		});
        
    </script>
    
</body>
</html>