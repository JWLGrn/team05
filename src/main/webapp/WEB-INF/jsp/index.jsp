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
        <!-- Slider Area Start Here -->
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
        <!-- Slider Area End Here -->
        <!-- Random Recipe Start Here -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="row gutters-40">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="product-box-layout4">
                            <div class="item-figure">
                                <img src="img/product/product1.jpg" alt="Product">
                                <a href="single-recipe1.html" class="item-dot">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                            <div class="item-content">
                                <span class="sub-title">BREAKFAST</span>
                                <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie and
                                        Chanterelles</a></h3>
                                <ul class="item-rating">
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-empty"><i class="fas fa-star"></i></li>
                                    <li><span>9<span> / 10</span></span> </li>
                                </ul>
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="product-box-layout4">
                            <div class="item-figure">
                                <img src="img/product/product2.jpg" alt="Product">
                                <a href="single-recipe1.html" class="item-dot">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                            <div class="item-content">
                                <span class="sub-title">DESERT</span>
                                <h3 class="item-title"><a href="single-recipe1.html">Pumpkin Cheesecake With
                                        GingersnapCrust</a></h3>
                                <ul class="item-rating">
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-empty"><i class="fas fa-star"></i></li>
                                    <li><span>9<span> / 10</span></span> </li>
                                </ul>
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 d-block d-md-none d-lg-block col-sm-12">
                        <div class="product-box-layout4">
                            <div class="item-figure">
                                <img src="img/product/product3.jpg" alt="Product">
                                <a href="single-recipe1.html" class="item-dot">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                            <div class="item-content">
                                <span class="sub-title">JUICE</span>
                                <h3 class="item-title"><a href="single-recipe1.html">Blueberry Juice with Lemon Crema</a></h3>
                                <ul class="item-rating">
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-fill"><i class="fas fa-star"></i></li>
                                    <li class="star-empty"><i class="fas fa-star"></i></li>
                                    <li><span>9<span> / 10</span></span> </li>
                                </ul>
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Random Recipe End Here -->
        <!-- Trending Recipe Start Here -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="row gutters-40">
                    <div class="col-lg-8">
                        <div class="row gutters-40">
                            <div class="col-12">
                                <div class="product-box-layout4">
                                    <div class="section-heading heading-dark">
                                        <h2 class="item-heading">TRENDING RECIPES</h2>
                                    </div>
                                    <div class="item-figure">
                                        <img src="img/product/product4.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">PASTA</span>
                                        <h2 class="item-title"><a href="single-recipe1.html">Chanterelle and Porcini
                                                Mushroom Recipes</a></h2>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <p>More off this less hello salamander lied porpoise much over tightly circa
                                            horse taped so innocuously side crud mightily rigorous plot life. New homes
                                            in particular are subject.</p>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product20.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">CHICKEN</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product21.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">SALAD</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product22.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">DINNER</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product23.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">JUICE</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product24.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">BREAKFAST</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-12">
                                <div class="product-box-layout4">
                                    <div class="item-figure">
                                        <img src="img/product/product25.jpg" alt="Product">
                                        <a href="single-recipe1.html" class="item-dot">
                                            <span></span>
                                            <span></span>
                                            <span></span>
                                        </a>
                                    </div>
                                    <div class="item-content">
                                        <span class="sub-title">DINNER</span>
                                        <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie
                                                and Chanterelles</a></h3>
                                        <ul class="item-rating">
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-fill"><i class="fas fa-star"></i></li>
                                            <li class="star-empty"><i class="fas fa-star"></i></li>
                                            <li><span>9<span> / 10</span></span> </li>
                                        </ul>
                                        <ul class="entry-meta">
                                            <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                            <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                            <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget ranna-box-padding">
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
                        <div class="widget ranna-box-padding">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">SUBSCRIBE &amp; FOLLOW</h3>
                            </div>
                            <div class="widget-follow-us">
                                <ul>
                                    <li class="single-item"><a href="#"><i class="fab fa-facebook-f"></i>LIKE ME ON</a></li>
                                    <li class="single-item"><a href="#"><i class="fab fa-twitter"></i>LIKE ME</a></li>
                                    <li class="single-item"><a href="#"><i class="fab fa-linkedin-in"></i>LIKE ME</a></li>
                                    <li class="single-item"><a href="#"><i class="fab fa-pinterest-p"></i>LIKE ME</a></li>
                                    <li class="single-item"><a href="#"><i class="fab fa-instagram"></i>LIKE ME</a></li>
                                    <li class="single-item"><a href="#"><i class="fab fa-youtube"></i>Subscribe</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="widget ranna-box-padding">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">LATEST RECIPES</h3>
                            </div>
                            <div class="widget-latest">
                                <ul class="block-list remove-5th-child-lg">
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="img/product/latest1.jpg" alt="Post"></a>
                                            <div class="count-number">1</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="img/product/latest2.jpg" alt="Post"></a>
                                            <div class="count-number">2</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="img/product/latest3.jpg" alt="Post"></a>
                                            <div class="count-number">3</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="img/product/latest4.jpg" alt="Post"></a>
                                            <div class="count-number">4</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                    <li class="single-item">
                                        <div class="item-img">
                                            <a href="#"><img src="img/product/latest2.jpg" alt="Post"></a>
                                            <div class="count-number">3</div>
                                        </div>
                                        <div class="item-content">
                                            <div class="item-ctg">DESERT</div>
                                            <h4 class="item-title"><a href="#">Salami Oven Roasted are
                                                    Mozzarella Oelette</a></h4>
                                            <div class="item-post-by"><a href="single-blog.html"><i class="fas fa-user"></i><span>by</span>
                                                    John Martin</a></div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="widget ranna-box-padding">
                            <div class="widget-ad">
                                <a href="#"><img src="img/figure/figure3.jpg" alt="Ad" class="img-fluid"></a>
                            </div>
                        </div>
                        <div class="widget ranna-box-padding">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">CATEGORIES</h3>
                            </div>
                            <div class="widget-categories">
                                <ul>
                                    <li>
                                        <a href="#">BreakFast
                                            <span>25</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Lunch
                                            <span>15</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Pasta
                                            <span>22</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dinner
                                            <span>18</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Dessert
                                            <span>36</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Drinks
                                            <span>12</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">Fruits
                                            <span>05</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Trending Recipe End Here -->
        <!-- Editor’s Choice Start Here -->
        <section class="padding-bottom-45">
            <div class="container">
                <div class="ranna-box-style">
                    <div class="section-heading heading-dark">
                        <h2 class="item-heading">EDITOR'S CHOICE</h2>
                    </div>
                    <div class="row gutters-40">
                        <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                            <div class="product-box-layout5">
                                <div class="item-figure">
                                    <img src="img/product/product26.jpg" alt="Product">
                                    <a href="single-recipe1.html" class="item-dot">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </a>
                                </div>
                                <div class="item-content">
                                    <span class="sub-title">BREAKFAST</span>
                                    <h3 class="item-title"><a href="single-recipe1.html">Old School Pancakes So
                                            Good They Don’t</a></h3>
                                    <ul class="item-rating">
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-empty"><i class="fas fa-star"></i></li>
                                        <li><span>9<span> / 10</span></span> </li>
                                    </ul>
                                    <ul class="entry-meta">
                                        <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                        <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-12">
                            <div class="product-box-layout5">
                                <div class="item-figure">
                                    <img src="img/product/product27.jpg" alt="Product">
                                    <a href="single-recipe1.html" class="item-dot">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </a>
                                </div>
                                <div class="item-content">
                                    <span class="sub-title">BREAKFAST</span>
                                    <h3 class="item-title"><a href="single-recipe1.html">Old School Pancakes So
                                            Good They Don’t</a></h3>
                                    <ul class="item-rating">
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-empty"><i class="fas fa-star"></i></li>
                                        <li><span>9<span> / 10</span></span> </li>
                                    </ul>
                                    <ul class="entry-meta">
                                        <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
                                        <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 col-12 d-block d-md-none d-lg-block">
                            <div class="product-box-layout5">
                                <div class="item-figure">
                                    <img src="img/product/product28.jpg" alt="Product">
                                    <a href="single-recipe1.html" class="item-dot">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </a>
                                </div>
                                <div class="item-content">
                                    <span class="sub-title">BREAKFAST</span>
                                    <h3 class="item-title"><a href="single-recipe1.html">Old School Pancakes So
                                            Good They Don’t</a></h3>
                                    <ul class="item-rating">
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-fill"><i class="fas fa-star"></i></li>
                                        <li class="star-empty"><i class="fas fa-star"></i></li>
                                        <li><span>9<span> / 10</span></span> </li>
                                    </ul>
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
                            <div class="widget-newsletter-subscribe">
                                <h3>GET LATEST UPDATES</h3>
                                <p>Newsletter Subscribe</p>
                                <form class="newsletter-subscribe-form">
                                    <div class="form-group">
                                        <input type="text" placeholder="your e-mail address" class="form-control" name="email"
                                            data-error="E-mail field is required" required>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                    <div class="form-group mb-none">
                                        <button type="submit" class="item-btn">SUBSCRIBE</button>
                                    </div>
                                </form>
                            </div>
                        </div>
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
<!--     先不要用?????? 想到再說 -->
<!--     <div class="modal fade" id="myModal" role="dialog"> -->
<!--         <div class="modal-dialog"> -->
<!--             <div class="modal-content"> -->
<!--                 <div class="modal-header"> -->
<!--                     <div class="title-default-bold mb-none" >Login</div> -->
<!-- <!--                     /user/login --> -->
<!--                     <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--                 </div> -->
<!--                 <div class="modal-body"> -->
<%--                     <form class="login-form"> --%>
<!--                         <input class="main-input-box" type="text" placeholder="User Name" /> -->
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
                figure += '<div class="ranna-slider-content-layout2">'
                    +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'"><img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" class="imgcut"></a></figure>'
                    +'<div class="item-content"><span class="sub-title">SALAD</span>'
                    +'<h2 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h2>'
                    +'<p>'+response[i].cookDescription+'</p>'
                    +'<ul class="entry-meta"><li><i class="fas fa-clock"></i>'+response[i].cookTime+' Mins</li>'
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
        
    </script>
    
</body>
</html>