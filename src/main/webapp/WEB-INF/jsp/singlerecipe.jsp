<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Ranna | Single Recipe 1</title>
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
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
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
        <section class="inner-page-banner bg-common" data-bg-image="img/figure/inner-page-banner1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>Single Recipe</h1>
                            <ul>
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li>Recipe Details</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Single Recipe With Sidebar Area Start Here -->
        <section class="single-recipe-wrap-layout1 padding-top-74 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="single-recipe-layout1">
                            <div class="ctg-name">
								<c:forEach items="${recipe.recipeKeyword}" var="rK">
								  ${rK.keyword.keyword} 
								</c:forEach>
							</div>
                            <h2 class="item-title">${recipe.cookTitle}</h2>
                            <div class="row mb-4">
                                <div class="col-xl-9 col-12">
                                    <ul class="entry-meta">
                                        <li class="single-meta"><a href="#"><i class="far fa-calendar-alt"></i><fmt:formatDate
											pattern="yyyy/MM/dd EEEE" value="${recipe.date}"/></a></li>
                                        <li class="single-meta"><a href="#"><i class="fas fa-user"></i>by <span>${recipe.users.userName}</span></a></li>
                                        <li class="single-meta"><a href="#"><i class="fas fa-heart"></i><span>${fn:length(recipe.favorite)}</span>
                                                Likes</a></li>
                                    </ul>
                                </div>
                                <div class="col-xl-3 col-12">
                                    <ul class="action-item">
                                    	<li><a href="${contextRoot}/recipe/update/${recipe.recipeId}"><button>修改</button></a></li>
                                    	<li><a href="${contextRoot}/recipe/delete/${recipe.recipeId}"><button>刪除</button></a></li>
                                        <li><button><i class="fas fa-print"></i></button></li>
                                        <li><button><i class="fas fa-expand-arrows-alt"></i></button></li>
                                        <li class="action-share-hover"><button><i class="fas fa-share-alt"></i></button>
                                            <div class="action-share-wrap">
                                                <a href="#" title="facebook"><i class="fab fa-facebook-f"></i></a>
                                                <a href="#" title="twitter"><i class="fab fa-twitter"></i></a>
                                                <a href="#" title="linkedin"><i class="fab fa-linkedin-in"></i></a>
                                                <a href="#" title="pinterest"><i class="fab fa-pinterest-p"></i></a>
                                                <a href="#" title="skype"><i class="fab fa-skype"></i></a>
                                                <a href="#" title="rss"><i class="fas fa-rss"></i></a>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-figure">
                                <img src="${contextRoot}/recipe/${recipe.cookPhoto}" alt="Product">
                            </div>
                            <div class="item-feature">
                                <ul>
                                    <li>
                                        <div class="feature-wrap">
                                            <div class="media">
                                                <div class="feature-icon">
                                                    <i class="far fa-clock"></i>
                                                </div>
                                                <div class="media-body space-sm">
                                                    <div class="feature-title">PREP TIME</div>
                                                    <div class="feature-sub-title"> Mins</div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="feature-wrap">
                                            <div class="media">
                                                <div class="feature-icon">
                                                    <i class="fas fa-utensils"></i>
                                                </div>
                                                <div class="media-body space-sm">
                                                    <div class="feature-title">COOK TIME</div>
                                                    <div class="feature-sub-title">${recipe.cookTime} Mins</div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="feature-wrap">
                                            <div class="media">
                                                <div class="feature-icon">
                                                    <i class="fas fa-users"></i>
                                                </div>
                                                <div class="media-body space-sm">
                                                    <div class="feature-title">SERVING</div>
                                                    <div class="feature-sub-title">${recipe.cookServe} People</div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="feature-wrap">
                                            <div class="media">
                                                <div class="feature-icon">
                                                    <i class="far fa-eye"></i>
                                                </div>
                                                <div class="media-body space-sm">
                                                    <div class="feature-title">VIEWS</div>
                                                    <div class="feature-sub-title"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <p class="item-description">${recipe.cookDescription}</p>
                            <div class="making-elements-wrap">
                                <div class="row">
                                    <div class="col-xl-6 col-12">
                                        <div class="ingridients-wrap">
                                            <h3 class="item-title"><i class="fas fa-list-ul"></i>食材</h3>
										<!-- ---------------重複的結構--------------- -->
										<c:forEach items="${recipe.recipeFoods}" var="rF" varStatus="rFs">
                                            <div class="checkbox checkbox-primary">
                                                <input id="checkbox${rFs.index}" type="checkbox">
                                                <label for="checkbox${rFs.index}">${rF.foods.foodsName} ${rF.gram} 克</label>
                                            </div>
                                        </c:forEach>    
                                        <!-- ---------------重複的結構--------------- -->
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-12">
                                        <div class="nutrition-wrap">
                                            <h3 class="item-title"><i class="fas fa-info"></i>營養成分</h3>
                                            <ul class="nutrition-list">
                                                <li>
                                                    <div class="nutrition-name">卡路里</div>
                                                    <div class="nutrition-value">${recipe.totalCal}</div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="direction-wrap-layout1">
                                <div class="section-heading heading-dark">
                                    <h2 class="item-heading">步驟</h2>
                                </div>
							<!-- ---------------重複的結構--------------- -->
							<c:forEach items="${recipe.recipeStep}" var="rS">
                                <div class="direction-box-layout1">
                                    <div class="item-figure">
                                        <img src="${contextRoot}/recipe/${rS.stepPhoto}" alt="DIRECTIONS" width="200" height="200">
                                    </div>
                                    <div class="item-content">
                                        <div class="serial-number">${rS.step} Step</div>
                                            ${rS.stepDescription}
                                    </div>
                                </div>
                            </c:forEach>
                             <!-- ---------------重複的結構--------------- -->
                            </div>
                            <div class="tag-share">
                                <ul>
                                    <li>
                                        <ul class="inner-tag">
                                <!-- ---------------重複的結構--------------- -->
                                <c:forEach items="${recipe.recipeKeyword}" var="rK">
								  	<li>
                                      <a href="#">${rK.keyword.keyword}</a>
                                    </li>
								</c:forEach>
                                <!-- ---------------重複的結構--------------- -->
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="inner-share">
                                            <li>
                                                <a href="#">
                                                    <i class="fab fa-facebook-f"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fab fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fab fa-linkedin-in"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fab fa-google-plus-g"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fab fa-pinterest"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>  
                            <div class="recipe-author">
                                <div class="media media-none--xs">
                                    <img src="img/blog/author9.jpg" alt="Blog Author" class="rounded-circle media-img-auto">
                                    <div class="media-body">
                                        <h4 class="author-title">Michel Jack</h4>
                                        <h5 class="author-sub-title">Written by</h5>
                                        <p>I love cooking and blogging. Using a fork, break salmon. Halve reserved 
                                                potatoes and eggs crosswise. The of something of did require met of
                                                help have someone.</p>
                                        <ul class="author-social">
                                            <li>
                                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-pinterest-p"></i></a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="fab fa-skype"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>            
                            <div class="also-like-wrap">
                                <h4 class="also-like-title">YOU MAY ALSO LIKE</h4>
                                <div class="row">
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-12">
                                        <div class="product-box-layout2">
                                            <figure class="item-figure"><img src="img/product/product11.jpg"
                                                        alt="Product"></figure>
                                            <div class="item-content">
                                                <span class="sub-title">BREAKFAST</span>
                                                <h3 class="item-title"><a href="single-recipe1.html">Tomatoes Stuffed with Foie and
                                                        Chanterelles</a></h3>
                                                <ul class="entry-meta">
                                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-12">
                                        <div class="product-box-layout2">
                                            <figure class="item-figure"><img src="img/product/product12.jpg"
                                                        alt="Product"></figure>
                                            <div class="item-content">
                                                <span class="sub-title">DESERT</span>
                                                <h3 class="item-title"><a href="single-recipe1.html">Pumpkin Cheesecake With
                                                        GingersnapCrust</a></h3>
                                                <ul class="entry-meta">
                                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-block d-md-none d-xl-block col-12">
                                        <div class="product-box-layout2">
                                            <figure class="item-figure"><img src="img/product/product13.jpg"
                                                        alt="Product"></figure>
                                            <div class="item-content">
                                                <span class="sub-title">JUICE</span>
                                                <h3 class="item-title"><a href="single-recipe1.html">Blueberry Juice with Lemon Crema</a></h3>
                                                <ul class="entry-meta">
                                                    <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>             
                            </div>
                            <div class="recipe-reviews">
                                <div class="section-heading heading-dark">
                                    <h2 class="item-heading">RECIPE REVIEWS</h2>
                                </div>
                                <div class="avarage-rating-wrap">
                                    <div class="avarage-rating">Avarage Rating: 
                                        <span class="rating-icon-wrap">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </span>
                                        <span class="rating-number">(5)</span>                                        
                                    </div>
                                    <div class="total-reviews">Total Reviews:<span class="review-number">(02)</span></div>
                                </div>
                                <ul>
                                    <li class="reviews-single-item">
                                        <div class="media media-none--xs">
                                            <img src="img/blog/comment1.jpg" alt="Comment" class="media-img-auto">
                                            <div class="media-body">
                                                <h4 class="comment-title">Liza Zaman</h4>
                                                <span class="post-date">September 27, 2018</span>
                                                <p>Absolutely great recipe. I cooked it for my kids and they loved it, even 
                                                        asked for more, can you believe it?</p>
                                                <ul class="item-rating">
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-empty"><i class="fas fa-star"></i></li>
                                                    <li class="single-item"><span>9<span> / 10</span></span> </li>
                                                </ul>
                                                <a href="#" class="item-btn">REPLY<i class="fas fa-long-arrow-alt-right"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="reviews-single-item">
                                        <div class="media media-none--xs">
                                            <img src="img/blog/comment2.jpg" alt="Comment" class="media-img-auto">
                                            <div class="media-body">
                                                <h4 class="comment-title">John Martin</h4>
                                                <span class="post-date">September 12, 2018</span>
                                                <p>Absolutely great recipe. I cooked it for my kids and they loved it, even 
                                                        asked for more, can you believe it?</p>
                                                <ul class="item-rating">
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-fill"><i class="fas fa-star"></i></li>
                                                    <li class="single-item star-empty"><i class="fas fa-star"></i></li>
                                                    <li class="single-item"><span>7<span> / 10</span></span> </li>
                                                </ul>
                                                <a href="#" class="item-btn">REPLY<i class="fas fa-long-arrow-alt-right"></i></a>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="leave-review">
                                <div class="section-heading heading-dark">
                                    <h2 class="item-heading">LEAVE A REVIEW</h2>
                                </div>
                                <div class="rate-wrapper">
                                    <div class="rate-label">Rating</div>
                                    <div class="rate">
                                        <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                        <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                        <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                        <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                        <div class="rate-item"><i class="fa fa-star" aria-hidden="true"></i></div>
                                    </div>
                                </div>
                                <form class="leave-form-box">
                                    <div class="row">
                                        <div class="col-12 form-group">
                                            <label>Comment :</label>
                                            <textarea placeholder="" class="textarea form-control" name="message" rows="7"
                                                cols="20" data-error="Message field is required" required></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-lg-4 form-group">
                                            <label>Name :</label>
                                            <input type="text" placeholder="" class="form-control" name="name"
                                                data-error="Name field is required" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-lg-4 form-group">
                                            <label>E-mail :</label>
                                            <input type="email" placeholder="" class="form-control" name="email"
                                                data-error="E-mail field is required" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-lg-4 form-group">
                                            <label>Website :</label>
                                            <input type="email" placeholder="" class="form-control" name="email"
                                                data-error="E-mail field is required" required>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-12 form-group mb-0">
                                            <button type="submit" class="item-btn">POST REVIEW</button>
                                        </div>
                                    </div>
                                    <div class="form-response"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">LATEST RECIPES</h3>
                            </div>
                            <div class="widget-latest">
                                <ul class="block-list">
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
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
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
                        <div class="widget">
                            <div class="widget-ad">
                                <a href="#"><img src="img/figure/figure4.jpg" alt="Ad" class="img-fluid"></a>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">FEATURED ARTICLE</h3>
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
                                    data-r-extra-large-nav="true" data-r-extra-large-dots="false">
                                    <div class="featured-box-layout1">
                                        <div class="item-img">
                                            <img src="img/product/product17.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">BREAKFAST</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund efficiantue.</p>
                                        </div>
                                    </div>
                                    <div class="featured-box-layout1">
                                        <div class="item-img">
                                            <img src="img/product/product18.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">DINNER</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund efficiantue.</p>
                                        </div>
                                    </div>
                                    <div class="featured-box-layout1">
                                        <div class="item-img">
                                            <img src="img/product/product19.jpg" alt="Brand" class="img-fluid">
                                        </div>
                                        <div class="item-content">
                                            <span class="ctg-name">SALAD</span>
                                            <h4 class="item-title"><a href="single-recipe1.html">Baked Garlic Prawn</a></h4>
                                            <p>Definitiones noel ei verear intelle
                                                gatpri civibus consequat area
                                                refund efficiantue.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="widget">
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
                        <div class="widget">
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
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">POPULAR TAGS</h3>
                            </div>
                            <div class="widget-tag">
                                <ul>
                                    <li>
                                        <a href="#">DESERT</a>
                                    </li>
                                    <li>
                                        <a href="#">CAKE</a>
                                    </li>
                                    <li>
                                        <a href="#">BREAKFAST</a>
                                    </li>
                                    <li>
                                        <a href="#">BURGER</a>
                                    </li>
                                    <li>
                                        <a href="#">DINNER</a>
                                    </li>
                                    <li>
                                        <a href="#">PIZZA</a>
                                    </li>
                                    <li>
                                        <a href="#">SEA FOOD</a>
                                    </li>
                                    <li>
                                        <a href="#">SALAD</a>
                                    </li>
                                    <li>
                                        <a href="#">JUICE</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Single Recipe With Sidebar Area End Here -->
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
    <!-- Modal End-->
    <!-- Jquery Js -->
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
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
</body>


</html>