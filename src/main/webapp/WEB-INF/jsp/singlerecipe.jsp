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
<!--     <link rel="shortcut icon" href="favicon.png"> -->
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
    <!-- simple-notify CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/simple-notify.min.css">
    <!-- sweetalert2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/sweetalert2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css"/>
    <style type="text/css">
    	.replyobfit{
            object-fit: contain;
            width: 200px;
            height: 150px;
        }
        .single-recipe-layout1 .recipe-reviews ul li.reviews-single-item:nth-child(even) {
    		margin-left: 0px;
		}
		.single-recipe-layout1 .recipe-reviews ul li.reviews-single-item img {
    		border-radius: 0%;
		}
		.single-recipe-layout1 .recipe-reviews ul li.reviews-single-item {
    		padding: 10px;
		}
		.single-recipe-layout1 .item-feature ul li {
    		flex: 0 0 50%;
    		max-width: 50%;
		}
		.recipeobfit{
            object-fit: contain;
            width: 150px;
            height: 100px;
        }
        .recipeImg{
        	object-fit: cover;
            width: 150px;
            height: 150px;
        }
        .color_red{
  			color: #ff4a52;
		}
		.color_gray{
  			color: gray;
		}
		.color_blue{
  			color: blue;
  			cursor: pointer;
		}
		.cursor_pointer{
			cursor: pointer; 
		}
        .descript{
            overflow: hidden;
            display: -webkit-box;
            text-overflow: ellipsis;
            -webkit-line-clamp: 2; /*行數*/
            -webkit-box-orient: vertical;
            white-space: normal;
        }
        .img-fluid{
            object-fit: cover;
            width: 350px;
            height: 300px;
        }
        .authorimg{
        	object-fit:cover;
			width: 200px;
			height:200px;
        }
        #msg{
        color:red;
        margin-left:30px;
        }
<<<<<<< HEAD
        .inner-page-banner:before {
		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/srecipebanner.jpg");
		background-position: center;
		background-size: cover;
		}
=======
        .a-flex{
        	display:flex;
        	align-items: center;
    		flex-direction: row-reverse;
    		padding-right:30px;
        }
>>>>>>> 251b2da0e5e138f1ed76ff6ae4388809165113a4
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
                                        <li class="single-meta"><a href="${contextRoot}/user/find/${recipe.users.userId}"><i class="fas fa-user"></i>by <span>${recipe.users.userName}</span></a></li>
                                        <li class="single-meta"><i class="fas fa-heart cursor_pointer" id="favorite" onclick="addfavorite(${recipe.recipeId})"></i>&nbsp;&nbsp;<a><span id="fanum">${fn:length(recipe.favorite)}</span>
                                                Likes</a></li>
                                        <li class="single-meta"><i><span class="typcn typcn-flag cursor_pointer" style="font-size:22px;" id="collect" onclick="addcollect(${recipe.recipeId})" ></span></i>&nbsp;&nbsp;<a><span id="conum">${fn:length(recipe.collect)}</span>
                                                收藏</a></li>
                                    </ul><!--  -->
                                </div>
                                <div class="col-xl-3 col-12 a-flex">
                                    <ul class="action-item">
                                    	<c:if test="${loginUser.userId==recipe.userId}">
                                    	<li><a href="${contextRoot}/recipe/update/${recipe.recipeId}"><button style="font-size:17px">修改</button></a></li>
                                    	<li><a><button style="font-size:17px" onclick="deleteRecipe()">刪除</button></a></li>
                                    	</c:if>
                                    	<li><a href="${contextRoot}/users/report?user_id=${recipe.userId}&&user_id=${loginUser.userId }"><button style="font-size:17px">檢舉</button></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="item-figure">
                            <a data-caption="${recipe.cookTitle}" data-fancybox="gallery" href="${contextRoot}/recipe/${recipe.cookPhoto}">
                                <img src="${contextRoot}/recipe/${recipe.cookPhoto}" alt="Product" style="display:block; margin:auto;">
                            </a>
                            </div>
                            <div class="item-feature">
                                <ul>
                                    <li>
                                        <div class="feature-wrap">
                                            <div class="media">
                                                <div class="feature-icon">
                                                    <i class="fas fa-clock"></i>
                                                </div>
                                                <div class="media-body space-sm">
                                                    <div class="feature-title">時間</div>
                                                    <div class="feature-sub-title">${recipe.cookTime} 分鐘</div>
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
                                                    <div class="feature-title">份量</div>
                                                    <div class="feature-sub-title">${recipe.cookServe} 人份</div>
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
                                            <h3 class="item-title"><i class="fas fa-info"></i>營養成分（每人份）</h3>
                                            <ul class="nutrition-list">
                                                <li>
                                                    <div class="nutrition-name">卡路里</div>
                                                    <div class="nutrition-value"><fmt:formatNumber type="number" value="${recipe.totalCal/recipe.cookServe}" maxFractionDigits="2"/></div>
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
                                    <a data-caption="${rS.stepDescription}" data-fancybox="gallery" href="${contextRoot}/recipe/${rS.stepPhoto}">
                                        <img src="${contextRoot}/recipe/${rS.stepPhoto}" alt="DIRECTIONS" class="recipeImg">
                                    </a>
                                    </div>
                                    <div class="item-content">
                                        <div class="serial-number">${rS.step} Step</div>
                                          <p>${rS.stepDescription}</p>
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
                                      <a href="${contextRoot}/categories/${rK.keyword.keyword}/1">${rK.keyword.keyword}</a>
                                    </li>
								</c:forEach>
                                <!-- ---------------重複的結構--------------- -->
                                        </ul>
                                    </li>
                                </ul>
                            </div>  
                            <div class="recipe-reviews">
                                <div class="section-heading heading-dark">
                                    <h2 class="item-heading">跟著做做看</h2>
                                </div>
                                <ul id="showmsg">
                                <!-- --------------------留言區重複的結構-------------------- -->
                                    
								<!-- --------------------留言區重複的結構-------------------- -->
                                </ul>
                            </div>
                            <div class="leave-review">
                                <div class="section-heading heading-dark">
                                    <h2 class="item-heading">留下成果</h2>
                                </div>
                                <form class="leave-form-box">
                                    <div class="row">
                                    <div class="col-12 form-group">
                                    		<input type="hidden" id="replyId" value="${recipe.recipeId}">
                                    		<label>照片 :</label>
                                        	<label id="fileload">
                                        	<img src="${contextRoot}/image/recipe/upload.png" id="imgView" class="replyobfit"/>
      										<input type="file" id="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)">
      										</label>
                                        	</div>
                                        <div class="col-12 form-group">
                                        	
                                            <label>留言 :</label>
                                            <c:if test="${!empty loginUser }">
                                            <textarea placeholder="" class="textarea form-control" name="message" rows="7"
                                                cols="20" data-error="Message field is required" id="message" required></textarea>
                                             </c:if>
                                             <c:if test="${empty loginUser }">
                                             <textarea placeholder="" class="form-control"rows="7"
                                                cols="20" style="background-color:white;" readonly>請先登入會員 : )</textarea>
                                              </c:if>  
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="col-12 form-group mb-0">
                                        	<c:if test="${!empty loginUser }">
                                            <button type="button" class="item-btn" id="senddata">送出</button><span id="msg"></span>
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
                                <h3 class="item-heading">關於作者</h3>
                            </div>
                            <div class="widget-about">
                                <figure class="author-figure"><img src="${contextRoot}/image/users/${recipe.users.userPhoto}" alt="about" class="authorimg"></figure>
                                <a href="${contextRoot}/user/find/${recipe.users.userId}"><h3 class="item-title">${recipe.users.userName}</h3></a>
                                <p>${fn:length(recipe.users.recipe)} 食譜　　<span id="tracknum">${fn:length(recipe.users.track)}</span> 粉絲</p>
                                <c:if test="${loginUser.userId != recipe.userId}">
                                <p><i class="fas fa-star color_gray" id="track"><span id="tratext"> 追蹤</span></i></p>
                                </c:if>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">最新食譜</h3>
                            </div>
                            <div class="widget-latest">
                                <ul class="block-list" id="latestRecipe">
							<!-- ----------------重複結構---------------- -->
                            <!-- ----------------重複結構---------------- -->
                                </ul>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">食譜隨選</h3>
                            </div>
                            <div class="widget-featured-feed">
                                <div class="rc-carousel nav-control-layout1" id="randomRecipe" data-loop="true" data-items="3"
                                    data-margin="5" data-autoplay="true" data-autoplay-timeout="5000" data-smart-speed="700"
                                    data-dots="false" data-nav="true" data-nav-speed="false" data-r-x-small="1"
                                    data-r-x-small-nav="true" data-r-x-small-dots="false" data-r-x-medium="1"
                                    data-r-x-medium-nav="true" data-r-x-medium-dots="false" data-r-small="1"
                                    data-r-small-nav="true" data-r-small-dots="false" data-r-medium="1"
                                    data-r-medium-nav="true" data-r-medium-dots="false" data-r-large="1"
                                    data-r-large-nav="true" data-r-large-dots="false" data-r-extra-large="1"
                                    data-r-extra-large-nav="true" data-r-extra-large-dots="false">
                                </div>
                            </div>
                        </div>
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">熱門類別</h3>
                            </div>
                            <div class="widget-categories">
                                <ul id="category">
                                    <li>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Single Recipe With Sidebar Area End Here -->
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
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- simple-notify Js -->
    <script src="${contextRoot}/js/simple-notify.min.js"></script>
    <!-- sweetalert2 Js -->
    <script src="${contextRoot}/js/sweetalert2.all.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <!-- Fancybox Js -->
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script type="text/javascript">
    var recipeId="${recipe.recipeId}";
    $(document).ready(function() {//網頁載入,顯示活動區塊
    	showReply();
   		if(eval("${!empty loginUser}")){   			
   			favoriteornot(recipeId);
   			collectornot(recipeId);
   			if(eval("${loginUser.userId != recipe.userId}")){
   				followornot(recipeId);
   			}
   		}  
    });
    //是否按過讚
    function favoriteornot(recipeId){
    	var replyjson=JSON.stringify(recipeId);
		$.ajax({
			url:"${contextRoot}/recipe/favor",
			contentType:'application/json',//送出資料型態
			dataType:'json',//回傳資料型態
			method:'post',
			data:replyjson,
			success:function(result){			
				if(result==true){
					$("#favorite").addClass("color_red");
				}
			 },error:function(err){
			 	console.log(err);
		}
    });	
}
  //是否有收藏
    function collectornot(recipeId){
    	var replyjson=JSON.stringify(recipeId);
		$.ajax({
			url:"${contextRoot}/recipe/collect",
			contentType:'application/json',//送出資料型態
			dataType:'json',//回傳資料型態
			method:'post',
			data:replyjson,
			success:function(result){			
				if(result==true){
					$("#collect").addClass("color_red");
				}
			 },error:function(err){
			 	console.log(err);
		}
    });	
}
  
//按讚 
function addfavorite(recipeId){
	if(eval("${!empty loginUser}")){
	str=0;
	var replyjson=JSON.stringify(recipeId);
	$.ajax({
		url:"${contextRoot}/recipe/addfavor",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){
			if(result==true){
				$("#favorite").css("color","#ff4a52");
				str=Number($("#fanum").text())+1;
				
			}else{
				$("#favorite").css("color","gray");
				str=$("#fanum").text()-1;
			}
			$("#fanum").text(str);
		 },error:function(err){
		 	console.log(err);
	   	}
  	  });
	}
}

//按收藏
function addcollect(recipeId){
	if(eval("${!empty loginUser}")){
	str=0;
	var replyjson=JSON.stringify(recipeId);
	$.ajax({
		url:"${contextRoot}/recipe/addcollect",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){
			if(result==true){
				$("#collect").css("color","#ff4a52");
				str=Number($("#conum").text())+1;
				
			}else{
				$("#collect").css("color","gray");
				str=$("#conum").text()-1;
			}
			$("#conum").text(str);
		 },error:function(err){
		 	console.log(err);
	   	}
  	  });
	}
}

//是否追蹤過
function followornot(recipeId){
	// console.log(recipeId);
     	var replyjson=JSON.stringify(recipeId);
 		$.ajax({
 			url:"${contextRoot}/recipe/follow",
 			contentType:'application/json',//送出資料型態
 			dataType:'json',//回傳資料型態
 			method:'post',
 			data:replyjson,
 			success:function(result){
 				console.log(result);
 				if(result==true){
					$("#track").css("color","#ff4a52");
					$("#tratext").text(" 已追蹤");
				}else{
					 $("#track").css("color","gray");
		  			 $("#tratext").text(" 追蹤");
				}
 			 },error:function(err){
 			 	console.log(err);
 		}
     });	
}
//按追蹤
$("#track").click(function(){
	if(eval("${!empty loginUser}")){
	console.log(recipeId);
	var replyjson=JSON.stringify(recipeId);
  	$.ajax({
  		url:"${contextRoot}/recipe/addfollow",
  		contentType:'application/json',//送出資料型態
  		dataType:'json',//回傳資料型態
  		method:'post',
  		data:replyjson,
  		success:function(result){
  			
  			if(result==true){
  			    $("#track").css("color","gray");
  			    $("#tratext").text(" 追蹤");
  			    $("#tracknum").text(Number($("#tracknum").text())-1);
  			 	new Notify ({
    	 		    status: 'error',
    	 		    title: '提示',
    	 		    text: '已取消追蹤${recipe.users.userName}',
    	 		    effect: 'slide',
    	 		    speed: 400,
    	 		    customIcon: '<i class="fas fa-star"></i>',
    	 		    showIcon: true,
    	 		    showCloseButton: true,
    	 		    autoclose: true,
    	 		    autotimeout: 3000,
    	 		    gap: 20,
    	 		    distance: 20,
    	 		    type: 1,
    	 		    position: 'left bottom'
    	 		  })
  			  	
  	 			  }else{
  	 			$("#track").css("color","#ff4a52");  	 			
  	 			$("#tratext").text(" 已追蹤");
  	 			$("#tracknum").text(Number($("#tracknum").text())+1);
  	 		  new Notify ({
  	 		    status: 'error',
  	 		    title: '提示',
  	 		    text: '已追蹤${recipe.users.userName}',
  	 		    effect: 'slide',
  	 		    speed: 400,
  	 		    customIcon: '<i class="fas fa-star"></i>',
  	 		    showIcon: true,
  	 		    showCloseButton: true,
  	 		    autoclose: true,
  	 		    autotimeout: 3000,
  	 		    gap: 20,
  	 		    distance: 20,
  	 		    type: 1,
  	 		    position: 'left bottom'
  	 		  })
  	 		}	
  		},error:function(err){
  			   console.log(err);
  		}
    });
  }
})

    // 右方最新食譜
    	var lastestsettings = {
  		  "url": "${contextRoot}/recipe/find/lastest",
  		  "method": "GET",
  		  "timeout": 0,
  		};

  		$.ajax(lastestsettings).done(function (response) {
  				var latestRecipe = '';
  			
  				var count = 1;
              for(let i in response){
            	  
            	let keywords = '';
            	let kWord = response[i].recipeKeyword;
            	for(let j in kWord){
                	keywords += kWord[j].keywords+' '
            	}
            	  
              	latestRecipe += '<li class="single-item">'
              	+'<div class="item-img">'
              	+'<a href="${contextRoot}/recipe/find/'+response[i].recipeId+'"><img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" alt="Post" class="recipeobfit"></a>'
              	+'<div class="count-number">'+count+'</div></div>'
              	+'<div class="item-content">'
              	+'<div class="item-ctg">'+keywords.trim()+'</div>'
              	+'<h4 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h4>'
              	+'<div class="item-post-by"><a href="${contextRoot}/user/find/'+response[i].userId+'"><i class="fas fa-user"></i><span>by </span>'
              	+response[i].userName+'</a></div></div></li>'
              	count++;
              }
              $("#latestRecipe").html("").append(latestRecipe);
  		});
    
 	// 顯示留言
 	function showReply(){
 		var replysettings = {
			"url": "http://localhost:8090/cookblog/recipe/reply/${recipe.recipeId}",
			"method": "GET",
			"timeout": 0,
	};

	$.ajax(replysettings).done(function (response) {
		var replyList = '';
        for(let i in response){
             replyList +='<li class="reviews-single-item">'
                       +'<div class="media media-none--xs">'
                       +' <img src="${contextRoot}/reply/'+response[i].finallyPhoto+'" alt="Comment" class="media-img-auto replyobfit">'
                       +'<div class="media-body actionlist">'
                       +'<h4 class="comment-title">'+response[i].userName+'</h4>'+'<span class="post-date">'+response[i].uploadTime+'</span>'
                       +'<p>'+response[i].message+'</p>'

             			if("${loginUser.userId}"== response[i].userId){
            	 			replyList +='<div style="float:right;"><ul class="entry-meta"><li class="single-meta"><a class="cursor_pointer">'
            	 		    		  +'<span onclick="deleteReply('+response[i].replyId+')">刪除</span></a></li></ul></div>'
             			}
                       	replyList +='</div></div></li>'
                	}
        $("#showmsg").html("").append(replyList);
	});
 	}
	
 	var fileDataURL;
    
  	//步驟圖片顯示用(跟步驟一樣)+抓url
    function imgview(event,imgid){
      const fr = new FileReader();
      //抓url
      let fPhoto=document.getElementById("finallyPhoto").files;
      if(fPhoto.length>0){//有圖
    	let fileToLoad=fPhoto[0];//取得檔案詳細資料
        fr.onload = function (e) {
        	fileDataURL=e.target.result
    		$('#'+imgid.id+'').attr('src', fileDataURL);//img預覽
    	};
    	fr.readAsDataURL(event.target.files[0]);//img預覽
      }
    }
    
    // 新增留言
    $("#senddata").click(function(){
    	var message=$("#message").val();
    	var replyId=$("#replyId").val();
    	if(message == ""){
    		$("#msg").html("<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>請輸入留言！");
    	}else{
    		var reply={
    			   replyId:replyId,
    			   finallyPhoto:fileDataURL,
    			   message:message
    	}
    	var replyjson=JSON.stringify(reply);
    	$.ajax({
    		url:"${contextRoot}/reply/insert",
    		contentType:'application/json',//送出資料型態
    		dataType:'json',//回傳資料型態
    		method:'post',
    		data:replyjson,
    		success:function(result){	
    			console.log(result);
    			if(result.length == 0){
    				alert("請登入會員！！");
    			}else{
                    showReply();
    				//清空輸入欄+圖片
    				$("#message").val("");
    				$("#finallyPhoto").val(null);
    				fileDataURL = null;
    				$("#imgView").attr("src","${contextRoot}/image/recipe/upload.png");
    			}
    			
    		},
    		error:function(err){
    			console.log(err);
    		}
    	});
    	}
    	
    });
    
 // 右方隨機推播
    var randomsettings = {
        "url": "${contextRoot}/recipe/find/random/6",
        "method": "GET",
        "timeout": 0
    };

    $.ajax(randomsettings).done(function (response) {
        var figure = '';
        for(let i in response){
            let keywords = "";
            let kWord = response[i].recipeKeyword;
            for(let j in kWord){
                keywords += kWord[j].keywords+" "
            }
            figure +='<div class="featured-box-layout1">'
                   +'<div class="item-img">'
                   +'<img src="${contextRoot}/recipe/'+response[i].cookPhoto+'" alt="Brand" class="img-fluid"></div>'
            	   +'<div class="item-content">'
            	   +'<span class="ctg-name">'+keywords.trim()+'</span>'
        		   +'<h4 class="item-title"><a href="${contextRoot}/recipe/find/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h4>'
        		   +'<p class="descript">'+response[i].cookDescription+'</p></div></div>'
        }
        $("#randomRecipe").html("").append(figure);
        $("#randomRecipe").each(function () {
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
    
      

    // 確認刪除
    function deleteRecipe(){
    	Swal.fire({
        title: '提醒',
    	text: "確定要刪除此篇食譜？",
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
    	    	text: "食譜已刪除！",
    	    	icon: 'success',
    	    	confirmButtonText: '返回食譜列表'
            }).then((success) => {
    	    	 if (success.isConfirmed) {
    		    	 window.location.href = "${contextRoot}/recipe/delete/${recipe.recipeId}";
    	    	 }
    		 })
          }
      })
    }
    
    // 右方分類
    var settings = {
    		  "url": "${contextRoot}/categories/rank/8",
    		  "method": "GET",
    		  "timeout": 0,
    		};

    		$.ajax(settings).done(function (response) {
    			var category = "";
    			for(let i in response){
    				category += '<li><a href="${contextRoot}/categories/'+response[i].keyword+'/1">'
    						 +response[i].keyword+'<span>'+response[i].recipeKeyword.length+'</span>'
    						 +'</a></li>'
    			}
    			$("#category").html("").append(category);
    		});
    		
    // 刪除留言
    function deleteReply(id){
    		console.log(id)
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