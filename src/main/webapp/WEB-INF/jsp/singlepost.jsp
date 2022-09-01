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
    <title>Blog Post</title>
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
        <!-- sweetalert2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/sweetalert2.min.css">
    
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
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
     .img-fluid{
            object-fit: cover;
            width: 350px;
            height: 300px;
        }
     .replyobfit{
     		object-fit: cover;
            width: 130px;
            height: 90px;
       }
       #msg{
        	color:red;
        	margin-left:30px;
      }
      .userobfit{
      		object-fit: cover;
            width: 150px;
            height:150px;
      }
      .cursor_pointer{
			cursor: pointer; 
		}
		.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/posts.jpg");
    		background-position: center;
            background-size: cover;
		a{
		color:#646464;
		}
		a:hover{
			color:#ff4a52;
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
                            <h1>Blog Post</h1>
                            <ul>
                                <li>
                                    <a href="${contextRoot}">Home</a>
                                </li>
                                <li>
                                    <a href="${contextRoot}/posts/find/all">Post List</a>
                                </li>
                                <li>Blog Post</li>
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
                                    <li><a><i class="fas fa-clock"></i><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss EEEE" value="${posts.time}"/></a></li>
                                    <li><a href="${contextRoot}/user/find/${posts.users.userId}"><i class="fas fa-user"></i>by <span>${posts.users.userName}</span></a></li>
                                    <li><a><i class="fas fa-comments"></i>Comments <span>(${fn:length(posts.reply)})</span></a></li>
                                    <c:if test="${loginUser.userId==posts.users.userId}">
                                    <li><a onclick="deletePost()" class="cursor_pointer"><span>刪除</span></a></li>
                                    <li><a href="${contextRoot}/posts/update/${posts.postsId}"><span>修改</span></a></li>
                                    </c:if>
                                </ul>
                                <h3 class="item-title">${posts.title}</h3>
                                <p class="item-details">${posts.context}</p>
                            </div>
                            <div class="recipe-reviews">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">所有留言</h2>
                                </div>
                                <ul id="replyblock">
                                <!-- --------------------留言區重複的結構-------------------- -->
                                    
								<!-- --------------------留言區重複的結構-------------------- -->
                                </ul>
                            </div>
                            <div class="leave-review">
                                <div class="section-heading3 heading-dark">
                                    <h2 class="item-heading">留言</h2>
                                </div>
                                <form class="leave-form-box" id="insertreply">
                                    <input type="hidden" value="${posts.postsId}" name="postsId">
                                    <div class="row">
								<!-- --------------留言-------------- -->
								 
                                        <div class="col-12 form-group">
                                       	<c:if test="${!empty loginUser }">
                                            <textarea placeholder="" class="textarea form-control" name="message" id="message" rows="7"
                                                cols="20" data-error="Message field is required" required></textarea>
                                         </c:if>
                                         <c:if test="${empty loginUser }">
                                         	<textarea placeholder="" class="form-control" name="message"rows="7"
                                                cols="20" style="background-color:white;" readonly>請先登入會員 : )</textarea>
                                         </c:if>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                 
                                <!-- --------------留言-------------- -->
                                        <div class="col-12 form-group mb-0">
                                        <c:if test="${!empty loginUser }">
                                            <button type="button" class="item-btn" id="replysubmit">送出</button><span id="msg"></span>
                                        </c:if>
                                        <c:if test="${empty loginUser }">
                                        	<button type="button" class="item-btn">送出</button>
                                        </c:if>
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
                                <h3 class="item-heading">最新貼文</h3>
                            </div>
                            <div class="widget-blog-post">
                                <ul class="block-list" id="latestPost">
                                    
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">隨機文章</h3>
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
        <!-- Submit Recipe Area End Here -->
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
    <!-- sweetalert2 Js -->
    <script src="${contextRoot}/js/sweetalert2.all.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <script type="text/javascript">
    
    	//留言欄位新增留言
    	function replyList(response){
    		var replyList = '';
                    for(let i in response){
                        replyList +='<li class="reviews-single-item">'
                                    +'<div class="media media-none--xs">'
                                    +' <img src="${contextRoot}/users/'+response[i].userPhoto+'" alt="Comment" class="media-img-auto userobfit">'
                                    +'<div class="media-body">'
                                    +'<h4 class="comment-title">'+response[i].userName+'</h4>'+'<span class="post-date">'+response[i].uploadTime+'</span>'
                                    +'<p>'+response[i].message+'</p>'
                                    if("${loginUser.userId}" == response[i].userId){
                        	 			replyList +='<div style="float:right;"><ul class="entry-meta"><li class="single-meta"><a class="cursor_pointer">'
                        	 		    		  +'<span onclick="deleteReply('+response[i].replyId+')">刪除</span></a></li></ul></div>'
                         			}
                                   	replyList +='</div></div></li>'
                    }
                    $("#replyblock").html("").append(replyList);
    	}
    
    	//送出留言
    	$("#replysubmit").click(function(){
    		if($("#message").val() == ""){
    			$("#msg").html("<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>請輸入留言！");
    		}else{
    			var data = $("#insertreply").serialize();
            $.ajax({
                url : 'http://localhost:8090/cookblog/posts/reply/insert',
                type : 'post',
                data : data,
                success : function(response) {
                	showReply();
                	$("#message").val("");
                }
            });
    	   }
    	})
    	
    	// 顯示留言
    	function showReply(){
    		var settings = {
  			"url": "http://localhost:8090/cookblog/posts/reply/${posts.postsId}",
  			"method": "GET",
  			"timeout": 0,
		  };

		  $.ajax(settings).done(function (response) {
			replyList(response);
		  });
    	}
    	showReply();
		
		// 最新貼文
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
			    
			 // 確認刪除文章
			    function deletePost(){
			    	Swal.fire({
			        title: '提醒',
			    	text: "確定要刪除此篇文章？",
			    	icon: 'warning',
			        showCancelButton: true,
			        confirmButtonColor: '#3085d6',
			        cancelButtonColor: '#d33',
			        confirmButtonText: '刪除',
			    	cancelButtonText: '取消'
			    }).then((result) => {
			         if (result.isConfirmed) {
			             Swal.fire({
			                title: '提示',
			    	    	text: "文章已刪除！",
			    	    	icon: 'success',
			    	    	confirmButtonText: '返回文章列表'
			            }).then((success) => {
			    	    	 if (success.isConfirmed) {
			    		    	 window.location.href = "${contextRoot}/posts/delete/${posts.postsId}";
			    	    	 }
			    		 })
			          }
			      })
			    }
			 
			 // 刪除留言
			    function deleteReply(id){
			    		Swal.fire({
			            title: '提醒',
			        	text: "確定要刪除此篇回覆？",
			        	icon: 'warning',
			            showCancelButton: true,
			            confirmButtonColor: '#3085d6',
			            cancelButtonColor: '#d33',
			            confirmButtonText: '刪除',
			        	cancelButtonText: '取消',
			        }).then((result) => {
			             if (result.isConfirmed) {
			                 Swal.fire({
			                    title: '提示',
			        	    	text: "回覆已刪除！",
			        	    	icon: 'success',
			        	    	confirmButtonText: '確認'
			                }).then((success) => {
			        	    	 if (success.isConfirmed) {
			                        let settings = {
			                            "url": "http://localhost:8090/cookblog/reply/delete/"+id,
			                            "method": "GET",
			                            "timeout": 0,
			                            };

			                            $.ajax(settings).done(function (response) {
			                                showReply();
			                            });
			        	    	 }
			        		 })
			              }
			          })
			    	
			    	
			    }
    </script>
    </body>
</html>