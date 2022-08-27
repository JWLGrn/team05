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
    <link rel="shortcut icon" href="${contextRoot}/favicon.png">
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
/*     .inner-page-banner:before { */
/*     		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/recipe/${recipe.cookPhoto}"); */
/*     		background-position: center; */
/*             background-size: cover; */
/* 		} */

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
        .recipeobfit{
            object-fit: contain;
            width: 150px;
            height: 100px;
        }
    </style>
</head>

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
        <jsp:include page="layout/navbar.jsp"/>
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        <section class="inner-page-banner bg-common">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>Submit a Recipe</h1>
                            <ul>
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li>Recipe Post</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <form class="submit-recipe-form" method="POST" action="${contextRoot}/recipe/update" enctype="multipart/form-data">
                        	<input type="hidden" value="${recipe.recipeId}" name="recipeId">
                            <div class="form-group">
                                <label>
                                    <img id="recipeImageUpload" src="${contextRoot}/recipe/${recipe.cookPhoto}" height="150px"/>
                                <input type="file" id="recipePhoto" name="photo" onchange="photochange(event,recipeImageUpload)" accept=".png, .jpg, .jpeg" style="display: none;"/>
                            </label>
                            </div>
                            <div class="form-group">
                                <label>食譜名稱</label>
                                <input type="text" placeholder="請輸入食譜名稱..." class="form-control" name="title"
                                    data-error="Subject field is required" value="${recipe.cookTitle}" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label>食譜標籤</label>
                                <c:forEach items="${recipe.recipeKeyword}" var="rK" varStatus="rKs">
                                <p class="tagsSelected" id="tags${rKs.index}" data-tags="${rK.keyword.keyword}" style="display: none;"></p>
                                </c:forEach>
                                <select class="select2 tags form-control" name="tags" multiple="multiple"></select>
                            </div>
                            <div class="form-group">
                                <label>簡介</label>
                                <textarea placeholder="請輸入食譜描述..." class="textarea form-control" name="descript" id="form-message"
                                    rows="7" cols="20" data-error="Message field is required" required>${recipe.cookDescription}</textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="additional-input-wrap">
                                <label>烹調資訊</label>
                                <div class="row gutters-5">
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-left">
                                            <i class="far fa-clock"></i>
                                            <input type="number" placeholder="烹飪時間（分鐘）" class="form-control"
                                                name="time" value="${recipe.cookTime}">   
                                        </div>
                                    </div>
                                    <div class="col-6">
                                       <div class="form-group additional-input-box icon-left">
                                            <i class="fas fa-utensils"></i>
                                            <input type="number" placeholder="份量（人份）" class="form-control"
                                                name="people" value="${recipe.cookServe}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="additional-input-wrap">
                                    <label>食材</label>
                                    <div class="foodtable">
                                    <!-- ---------------------食材動態結構--------------------- -->
                                    <c:forEach items="${recipe.recipeFoods}" var="rF" varStatus="rFs">
                                    <div class="row no-gutters singlefood">
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-left">
                                                <i class="fas fa-arrows-alt"></i>
                                                <select class="select2 foods" name="foods" id="foods${rFs.index}" data-foods="${rF.foods.foodsName}"></select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-right">
                                                <input type="number" placeholder="份量（公克）" class="form-control" name="gram" value="${rF.gram}">
                                                <i class="fas fa-times removeFood"></i>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach> 
                                    <!-- ---------------------食材動態結構--------------------- -->
                                    </div>
                                    <button type="button" class="btn-upload" id="addFood"><i class="flaticon-add-plus-button"></i>加入食材</button>
                            </div>
                            <div class="additional-input-wrap">
                                <label>步驟</label>
                                <div class="steptable">
                                    <!-- ---------------------步驟動態結構--------------------- -->
                                    <c:forEach items="${recipe.recipeStep}" var="rS" varStatus="rSs">
                                    <div class="row no-gutters singlestep">
                                        <div class="col-3">
                                            <div class="form-group additional-input-box icon-left" style="height: 150px;">
                                                <i class="fas fa-arrows-alt"></i>
                                                <label><img id="recipeImageUpload${rSs.index}" src="${contextRoot}/recipe/${rS.stepPhoto}" height="150px"/>
                                                <input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload${rSs.index})" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="form-group additional-input-box icon-right"  style="height: 150px;">
                                                <textarea name="stepDescript" cols="30" rows="4" placeholder="輸入步驟說明" class="textarea form-control" style="height:auto">${rS.stepDescription}</textarea>
                                                <i class="fas fa-times removeStep"></i>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!-- ---------------------步驟動態結構--------------------- -->
                                </div>
                                    <button type="button" class="btn-upload" id="addStep"><i class="flaticon-add-plus-button"></i>加入步驟</button>
                            </div>
                            <button type="submit" class="btn-submit">修改食譜</button>
                        </form>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                    	<div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">最新食譜</h3>
                            </div>
                            <div class="widget-latest">
                                <ul class="block-list" id="latestRecipe">
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
                        

<!--                         <div class="widget"> -->
<!--                             <div class="section-heading heading-dark"> -->
<!--                                 <h3 class="item-heading">INSTAGRAM</h3> -->
<!--                             </div> -->
<!--                             <div class="widget-instagram"> -->
<!--                                 <ul> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure9.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure10.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure11.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure12.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure13.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure14.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure15.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure16.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                     <li> -->
<!--                                         <div class="item-box"> -->
<!--                                             <img src="img/social-figure/social-figure17.jpg" alt="Social Figure" class="img-fluid"> -->
<!--                                             <a href="#" class="item-icon"><i class="fab fa-instagram"></i></a> -->
<!--                                         </div> -->
<!--                                     </li> -->
<!--                                 </ul> -->
<!--                             </div> -->
<!--                         </div> -->
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
        <button type="button" class="close">�</button>
        <form class="search-form">
            <input type="search" value="" placeholder="Type here........" />
            <button type="submit" class="search-btn"><i class="flaticon-search"></i></button>
        </form>
    </div>
    <!-- Search Box End Here -->
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
    <script>

            //載入食材庫
            var foodSettings = {
                "url": "http://localhost:8090/cookblog/find/foods/all",
                "method": "GET",
                "timeout": 0,
            };

            var foodList = '';
                $.ajax(foodSettings).done(function (response) {
                for(i in response){
                    foodList += '<option value="'+ response[i].foodsName +'">'+ response[i].foodsName +'</option>';
                }
                $(".foods").append(foodList);

                //載入已選擇食材
                for(let i=0 ; i<$(".foods").length ; i++){
                    $("#foods"+i).val($("#foods"+i).data("foods"));
                    $("#foods"+i).trigger('change'); 
                 }
            });

            function selectRefresh() {
                $('.foods').select2({
                    theme: 'classic',
                    dropdownAutoWidth: true,
                    width: '100%'
                });
            }

            //增加食材標籤
            $("#addFood").click(function(){
                var addfoods = '<div class="row no-gutters singlefood">'
                              +'<div class="col-6">'
                              +'<div class="form-group additional-input-box icon-left">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<select class="select2 foods" name="foods">'+foodList+'</select>'
                              +'</div></div>'
                              +'<div class="col-6">'
                              +'<div class="form-group additional-input-box icon-right">'
                              +'<input type="number" placeholder="份量（公克）" class="form-control" name="gram">'
                              +'<i class="fas fa-times removeFood"></i>'
                              +'</div></div></div>'
                $(".foodtable").append(addfoods);
                selectRefresh();
                
            })

            //移除食材
            $(".foodtable").click(function(e){
                let removeBTN = $(e.target)
                if(removeBTN.hasClass("removeFood")){
                    removeBTN.parents(".singlefood").remove();
                }
            })

            


            //增加步驟標籤
            var count = 100;
            $("#addStep").click(function(){
                var addsteps = '<div class="row no-gutters singlestep">'
                              +'<div class="col-3">'
                              +'<div class="form-group additional-input-box icon-left" style="height: 150px;">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<label><img id="recipeImageUpload'+count+'" src="${contextRoot}/recipe/upload.png" height="150px"/>'
                              +'<input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload'+count+')" accept=".png, .jpg, .jpeg" style="display:none;"/></label>'
                              +'</div></div>'
                              +'<div class="col-9">'
                              +'<div class="form-group additional-input-box icon-right"  style="height: 150px;">'
                              +'<textarea name="stepDescript" cols="30" rows="4" placeholder="輸入步驟說明" class="textarea form-control" style="height:auto"></textarea>'
                              +'<i class="fas fa-times removeStep"></i>'
                              +'</div></div></div>'

                $(".steptable").append(addsteps);
                count++;
            })

            //移除步驟
            $(".steptable").click(function(e){
                let removeBTN = $(e.target)
                if(removeBTN.hasClass("removeStep")){
                    removeBTN.parents(".singlestep").remove();
                }
            })

            

            //圖片預覽
            //步驟圖片顯示用(跟步驟一樣)
            
            function photochange(event,imgid){   
                //img預覽
                let fr = new FileReader();
                fr.onload = function (e) {
                    $('#'+imgid.id+'').attr('src', e.target.result);
                };
                fr.readAsDataURL(event.target.files[0]);
            }

            //新增KeywordList
            var keywordSettings = {
                "url": "http://localhost:8090/cookblog/find/keyword/all",
                "method": "GET",
                "timeout": 0,
            };
            $.ajax(keywordSettings).done(function (response) {
                var keywordList = '';
                for(i in response){
                    keywordList += '<option value="'+ response[i].keyword +'">'+ response[i].keyword +'</option>';
                }
                $(".tags").append(keywordList);
                $(".tags").select2({
                    theme: 'classic',
                    dropdownAutoWidth: true,
                    width: '100%'
                });

                //載入已選擇標籤
                var taglist = [];
                for(let i=0;i<$(".tagsSelected").length;i++){
                    taglist.push($("#tags"+i).data("tags"))
                }
                console.log(taglist)
                $('.tags').val(taglist);
                $('.tags').trigger('change');
            });

            
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
                  	+'<h4 class="item-title"><a href="${contextRoot}/recipe/'+response[i].recipeId+'">'+response[i].cookTitle+'</a></h4>'
                  	+'<div class="item-post-by"><a href="#"><i class="fas fa-user"></i><span>by </span>'
                  	+response[i].userName+'</a></div></div></li>'
                  	count++;
                  }
                  $("#latestRecipe").html("").append(latestRecipe);
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
    </script>
</body>


</html>