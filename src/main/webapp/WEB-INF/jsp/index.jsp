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
<title>Ranna | Submit Recipes</title>
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
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
    
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/microns/microns.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style type="text/css">
    	.imgcut{
			height:500px;
			object-fit: cover;
		}

        .obfit{
            object-fit: cover;
            width: 300px;
            height: 200px;
            vertical-align: middle;
        }
        .obfit2{
            object-fit: cover;
            width: 350px;
            height: 250px;
            vertical-align: middle;
        }
        .flaticon-back{
        	font-size:30px
        }
        .flaticon-next{
        	font-size:30px
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
        <div style="background-color:#F0F0F0;padding-top:25px;">
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

        <!-- 最多人收藏 -->
        <section class="padding-bottom-45" id="cllectScrollRecipe" style="display:none;">
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
        <!-- 最多人收藏 -->
        <!-- 最多人收藏 -->
        <section class="padding-bottom-45" id="favorScrollRecipe" style="display:none;">
            <div class="container">
                <div class="ranna-box-style">
                    <div class="section-heading heading-dark">
                        <h2 class="item-heading">最多人喜歡的食譜</h2>
                    </div>
                    <div class="row gutters-40" id="mostFavor">
					<!--  --------------重複的結構-------------- -->
                    <!--  --------------重複的結構-------------- --> 
                    </div>
                </div>
            </div>
        </section>
        <!-- 最多人收藏 -->
        <!-- 隨機推播 -->
        <section class="padding-bottom-45" id="randomScrollRecipe" style="display:none;">
        
            <div class="container">
            <div class="section-heading heading-dark">
                        <h2 class="item-heading">食譜隨選</h2>
                    </div>
                <div class="row gutters-40" id="randomRecipe">
                    
                </div>
            </div>
        </section>
        <!-- 隨機推播 -->
        </div>
        <!-- Popular Recipe Start Here -->
        <!-- Footer Area Start Here -->
        <jsp:include page="layout/footer.jsp"/>
        <!-- Footer Area End Here -->
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
    	$(document).scroll(function() {
    	  	var y = $(this).scrollTop();
    	  	if (y > 150) {
    	  		$('#cllectScrollRecipe').fadeIn(900);
    	  	} else {
    	    	$('#cllectScrollRecipe').fadeOut(900);
    	  	}
    	  	if (y > 625) {
    	  		$('#favorScrollRecipe').fadeIn(900);
    	  	} else {
    	    	$('#favorScrollRecipe').fadeOut(900);
    	  	}
    	  	if (y > 1200) {
    	  		$('#randomScrollRecipe').fadeIn(900);
    	  	} else {
    	    	$('#randomScrollRecipe').fadeOut(900);
    	  	}
    	});
    
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
                    +'<li><a href="#"><i class="fas fa-heart"></i><span>'+response[i].favorite.length+'</span> 人喜歡</a></li>'
                    +'<li><a href="#"><i><span class="typcn typcn-flag" style="font-size:22px; color: #ff4a52"></span></i><span>'+response[i].collect.length+'</span> 人收藏</a></li></ul></div></div>'
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
                navText: ['<span class="flaticon-back typcn typcn-chevron-left" aria-hidden="true"></span>', '<span class="flaticon-next typcn typcn-chevron-right" aria-hidden="true"></span>'],
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
            "url": "http://localhost:8090/cookblog/recipe/find/random/6",
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
                +'<li><a href="#"><i><span class="typcn typcn-flag" style="font-size:22px; color: #ff4a52"></span></i><span>'+response[i].collect.length+'</span> 人收藏</a></li></ul></div></div></div>'
                $("#mostCollect").html("").append(figure);
            }
		});
        
		// 最多人按讚
        var settings = {
  			"url": "http://localhost:8090/cookblog/find/favorrank/3",
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
                +'<li><a href="#"><i class="fas fa-heart"></i><span>'+response[i].favorite.length+'</span> 人喜歡</a></li></ul></div></div></div>'
                $("#mostFavor").html("").append(figure);
            }
		});
    </script>
    
</body>
</html>