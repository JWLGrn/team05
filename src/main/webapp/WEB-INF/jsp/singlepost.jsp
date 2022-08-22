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
                            <h1>Standard Blog Page</h1>
                            <ul>
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li>Blog</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="single-blog-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="single-blog-box">
                            <div class="main-figure">
                                <a href="#"><img src="${contextRoot}/posts/${posts.postphoto}" alt="Blog"></a>
                            </div>
                            <div class="blog-content">
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE" value="${posts.time}"/></a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>${posts.users.userName}</span></a></li>
                                    <li><a href="#"><i class="fas fa-comments"></i>Comments <span>(${fn:length(posts.reply)})</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>59</span></a></li>
                                    <li><a href="${contextRoot}/posts/delete/${posts.postsId}"><span>刪除</span></a></li>
                                    <li><a href="${contextRoot}/posts/update/${posts.postsId}"><span>修改</span></a></li>
                                </ul>
                                <h3 class="item-title">${posts.title}</h3>
                                <p class="item-details">${posts.context}</p>
                            </div>
                            <div class="tag-share">
                                <ul>
                                    <li>
                                        <ul class="inner-tag">
                                            <li>
                                                <a href="#">Burger</a>
                                            </li>
                                            <li>
                                                <a href="#">Dinner</a>
                                            </li>
                                            <li>
                                                <a href="#">Pizza</a>
                                            </li>
                                            <li>
                                                <a href="#">Salad</a>
                                            </li>
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
                            <div class="next-prev-post">
                                <div class="prev-post">
                                    <a href="#" class="item-figure"><img src="img/blog/prev-post.jpg" alt="Post"></a>
                                    <div class="item-content">
                                        <p>PREVIOUS POST</p>
                                        <h3 class="post-title"><a href="#">Old school pancake next area so goody</a></h3>
                                    </div>
                                </div>
                                <div class="next-post">
                                    <div class="item-content">
                                        <p>NEXT POST</p>
                                        <h3 class="post-title"><a href="#">Old school pancake next area so goody</a></h3>
                                    </div>
                                    <a href="#" class="item-figure"><img src="img/blog/next-post.jpg" alt="Post"></a>
                                </div>
                            </div>
                            <div class="recipe-reviews">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">RECIPE REVIEWS</h2>
                                </div>
                                <ul id="replyblock">
                                <!-- --------------------留言區重複的結構-------------------- -->
                                    
								<!-- --------------------留言區重複的結構-------------------- -->
                                </ul>
                            </div>
                            <div class="leave-review">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">LEAVE A REVIEW</h2>
                                </div>
                                <form class="leave-form-box" id="insertreply">
                                    <input type="hidden" value="${posts.postsId}" name="postsId">
                                    <div class="row">
								<!-- --------------留言-------------- -->
                                        <div class="col-12 form-group">
                                            <label>留言 :</label>
                                            <textarea placeholder="" class="textarea form-control" name="message" id="message" rows="7"
                                                cols="20" data-error="Message field is required" required></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                <!-- --------------留言-------------- -->
                                        <div class="col-12 form-group mb-0">
                                            <button type="button" class="item-btn" id="replysubmit">送出</button>
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
                                <h3 class="item-heading">LATEST BLOG</h3>
                            </div>
                            <div class="widget-blog-post">
                                <ul class="block-list" id="latestPost">
                                    
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
                                <a href="#"><img src="img/figure/figure6.jpg" alt="Ad" class="img-fluid"></a>
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
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">INSTAGRAM</h3>
                            </div>
                            <div class="widget-instagram">
                                <ul>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure9.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure10.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure11.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure12.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure13.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure14.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure15.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure16.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="item-box">
                                            <img src="img/social-figure/social-figure17.jpg" alt="Social Figure" class="img-fluid">
                                            <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a>
                                        </div>
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
        <!-- Submit Recipe Area End Here -->
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
    <script type="text/javascript">
    
    	function replyList(response){
    		var replyList = '';
                    for(let i in response){
                        replyList +='<li class="reviews-single-item">'
                                    +'<div class="media media-none--xs">'
                                    +' <img src="${contextRoot}/users/'+response[i].userPhoto+'" alt="Comment" class="media-img-auto">'
                                    +'<div class="media-body">'
                                    +'<h4 class="comment-title">'+response[i].userName+'</h4>'+'<span class="post-date">'+response[i].uploadTime+'</span>'
                                    +'<p>'+response[i].message+'</p>'+'</div></div></li>'
                    }
                    $("#replyblock").html("").append(replyList);
    	}
    
    	$("#replysubmit").click(function(){
    		var data = $("#insertreply").serialize();
            $.ajax({
                url : 'http://localhost:8090/cookblog/posts/reply/insert',
                type : 'post',
                data : data,
                success : function(response) {
                	replyList(response)
                }
            });

    	})
    	
    	var settings = {
  			"url": "http://localhost:8090/cookblog/posts/reply/all",
  			"method": "GET",
  			"timeout": 0,
		};

		$.ajax(settings).done(function (response) {
			replyList(response);
		});
		
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
		            	+'<a href="#"><img src="${contextRoot}/posts/'+response[i].postphoto+'" alt="Post" width="100"></a>'
		            	+'</div><div class="item-content">'
		            	+'<div class="item-post-date"><a href="#"><i class="fas fa-clock"></i>'+response[i].time+'</a></div>'
		            	+'<h4 class="item-title"><a href="#">'+response[i].title+'</a></h4>'
		            	+'<div class="item-post-by"><a href="${contextRoot}/posts/find/'+response[i].postsId+'"><i class="fas fa-user"></i><span>by </span>'
		            	+response[i].userName+'</a></div></div></li>'
		            }
		            $("#latestPost").html("").append(latestPost);
				});
		
    </script>
    </body>
</html>