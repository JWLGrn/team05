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
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ranna | Submit Recipes</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style type="text/css">
    .descript{
            overflow: hidden;
            display: -webkit-box;
            text-overflow: ellipsis;
            -webkit-line-clamp: 4; /*行數*/
            -webkit-box-orient: vertical;
            white-space: normal;
        }
    .imgcut{
		height:300px;
		overflow:hidden;
		}
		.replyobfit{
     		object-fit: cover;
            width: 130px;
            height: 90px;
       }
       .img-fluid{
            object-fit: cover;
            width: 350px;
            height: 300px;
        }
        .inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/findallposts.jpg");
    		background-position: center;
            background-size: cover;
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
    <div id="wrapper" class="wrapper">
        <!-- Header Area Start Here -->
		<jsp:include page="layout/navbar.jsp"/>
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        <section class="inner-page-banner bg-common">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>List Blog Page</h1>
                            <ul>
                                <li>
                                    <a href="http://localhost:8090/cookblog">Home</a>
                                </li>
                                <li>Blog</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Blog List Area Start Here -->
        <section class="blog-list-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
					<!-- ----------------------章列表重複結構---------------------- -->
					<c:forEach items="${postsPage.content}" var="post">
                        <div class="blog-box-layout1">
                            <div class="item-figure imgcut">
                                <a href="${contextRoot}/posts/find/${post.postsId}"><img src="${contextRoot}/posts/${post.postphoto}" alt="Blog"></a>
                            </div>
                            <div class="item-content">
                                <ul class="entry-meta">
                                    <li><a><i class="fas fa-clock"></i><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE" value="${post.time}"/></a></li>
                                    <li><a href="${contextRoot}/user/find/${post.users.userId}"><i class="fas fa-user"></i>by <span>${post.users.userName}</span></a></li>
                                    <li><a><i class="fas fa-comments"></i>Comments <span>(${fn:length(post.reply)})</span></a></li>
                                </ul>
                                <h3 class="item-title"><a href="${contextRoot}/posts/find/${post.postsId}">${post.title}</a></h3>
                                <p>${post.outline}</p>
                                <a href="${contextRoot}/posts/find/${post.postsId}" class="item-btn">繼續閱讀→<i class="flaticon-next"></i></a>
                            </div>
                        </div>
                        </c:forEach>
                     <!-- ----------------------章列表重複結構---------------------- -->
                     <ul class="pagination-layout1">
                     <c:forEach begin="1" end="${postsPage.totalPages}" var="pageNumber">
					<c:choose>
						<c:when test="${pageNumber-1 == postsPage.number}">
							<li class="active">
								<a>${pageNumber}</a>
							</li>	
						</c:when>
						<c:otherwise>
							<li><a href="${contextRoot}/posts/find/all?p=${pageNumber}">
								${pageNumber} </a>
							</li>	
						</c:otherwise>

					</c:choose>
				</c:forEach>
                        </ul>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">最新文章</h3>
                            </div>
                            <div class="widget-blog-post">
                                <ul class="block-list" id="latestPost">
							<!-- ------------------重複的結構------------------ -->
                             <!-- ------------------重複的結構------------------ -->
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">文章隨選</h3>
                            </div>
                            <div class="widget-featured-feed">
                                <div class="rc-carousel nav-control-layout1" data-loop="true" data-items="3"
                                    data-margin="5" data-autoplay="true" data-autoplay-timeout="5000" data-smart-speed="700"
                                    data-dots="false" data-nav="true" data-nav-speed="false" data-r-x-small="1"
                                    data-r-x-small-nav="true" data-r-x-small-dots="false" data-r-x-medium="1"
                                    data-r-x-medium-nav="true" data-r-x-medium-dots="false" data-r-small="1"
                                    data-r-small-nav="true" data-r-small-dots="false" data-r-medium="1"
                                    data-r-medium-nav="true" data-r-medium-dots="false" data-r-large="1"
                                    data-r-large-nav="true" data-r-large-dots="false" data-r-extra-large="1"
                                    data-r-extra-large-nav="true" data-r-extra-large-dots="false" id="randomPosts">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- Blog List Area End Here -->
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
</body>
<script type="text/javascript">
		// 最新文章
		var settings = {
		  "url": "http://localhost:8090/cookblog/posts/find/lastest",
		  "method": "GET",
		  "timeout": 0,
		};

		$.ajax(settings).done(function (response) {
			var latestPost = '';
            for(let i in response){
            	latestPost +='<li class="single-item">'
            	+'<div class="item-img">'
            	+'<a href="${contextRoot}/posts/find/'+response[i].postsId+'"><img src="${contextRoot}/posts/'+response[i].postphoto+'" alt="Post" class="replyobfit"></a>'
            	+'</div><div class="item-content">'
            	+'<div class="item-post-date"><a><i class="fas fa-clock"></i>'+response[i].time+'</a></div>'
            	+'<h4 class="item-title"><a href="${contextRoot}/posts/find/'+response[i].postsId+'">'+response[i].title+'</a></h4>'
            	+'<div class="item-post-by"><a href="${contextRoot}/user/find/'+response[i].userId+'"><i class="fas fa-user"></i><span>by </span>'
            	+response[i].userName+'</a></div></div></li>'
            }
            $("#latestPost").html("").append(latestPost);
		});
		
		// 右方隨機推播
		var randomsettings = {
		     "url": "${contextRoot}/posts/find/random/6",
		     "method": "GET",
		      "timeout": 0
		};

		    $.ajax(randomsettings).done(function (response) {
		        var figure = '';
		        for(let i in response){
		            figure +='<div class="featured-box-layout1">'
		                   +'<div class="item-img">'
		                   +'<img src="${contextRoot}/posts/'+response[i].postphoto+'" alt="Brand" class="img-fluid"></div>'
		            	   +'<div class="item-content">'
		        		   +'<h4 class="item-title"><a href="${contextRoot}/posts/find/'+response[i].postsId+'">'+response[i].title+'</a></h4>'
		        		   +'<p class="descript">'+response[i].outline+'</p></div></div>'
		        }
		        $("#randomPosts").html("").append(figure);
		        $("#randomPosts").each(function () {
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

</script>
</html>