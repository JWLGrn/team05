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
		.recipeImageUpload{
			object-fit:contain;
			height:125px;
			width:125px;
			border-radius:6px;
		}
		.insertcontainer{
			background-color:white;
			padding:30px;
			border-radius:10px;
			border: 1px solid #E0E0E0;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
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
        <section class="inner-page-banner bg-common" data-bg-image="img/figure/inner-page-banner1.jpg">
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
        <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50"  style="background-color:#F0F0F0">
            <div class="container">
                <div class="row gutters-60">
                	<div class="col-lg-2"></div>
                    <div class="col-lg-8 insertcontainer">
                        <form class="submit-recipe-form" method="POST" action="recipe/insert" enctype="multipart/form-data">
                            <div class="form-group" style="display: flex;justify-content: center;">
                                <label><img id="recipeImageUpload" src="${contextRoot}/recipe/upload.png" height="150px"/>
                                <input type="file" name="photo" onchange="photochange(event,recipeImageUpload)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                            </div>
                            <div class="form-group">
                                <label>食譜名稱</label>
                                <input type="text" placeholder="請輸入食譜名稱..." class="form-control" name="title"
                                    data-error="Subject field is required" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label>食譜標籤</label>
                                <select class="select2 tags form-control" name="tags" multiple="multiple"></select>
                            </div>
                            <div class="form-group">
                                <label>簡介</label>
                                <textarea placeholder="請輸入食譜描述..." class="textarea form-control" name="descript" id="form-message"
                                    rows="7" cols="20" data-error="Message field is required" required></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="additional-input-wrap">
                                <label>烹調資訊</label>
                                <div class="row gutters-5">
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-left">
                                            <i class="far fa-clock"></i>
                                            <input type="number" placeholder="烹飪時間（分鐘）" class="form-control"
                                                name="time">   
                                        </div>
                                    </div>
                                    <div class="col-6">
                                       <div class="form-group additional-input-box icon-left">
                                            <i class="fas fa-utensils"></i>
                                            <input type="number" placeholder="份量（人份）" class="form-control"
                                                name="people">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="additional-input-wrap">
                                    <label>食材</label>
                                    <div class="foodtable">
                                    <!-- ---------------------食材動態結構--------------------- -->
                                    <div class="row no-gutters singlefood">
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-left">
                                                <i class="fas fa-arrows-alt"></i>
                                                <select class="select2 foods" name="foods"></select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-right">
                                                <input type="number" placeholder="份量（公克）" class="form-control" name="gram">
                                                <i class="fas fa-times removeFood"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------食材動態結構--------------------- -->
                                    </div>
                                    <button type="button" class="btn-upload" id="addFood"><span class="typcn typcn-plus">&nbsp;</span>加入食材</button>
                            </div>
                            <div class="additional-input-wrap">
                                <label>步驟</label>
                                <div class="steptable">
                                    <!-- ---------------------步驟動態結構--------------------- -->
                                    <div class="row no-gutters singlestep">
                                        <div class="col-3">
                                            <div class="form-group additional-input-box icon-left" style="height: 150px;">
                                                <i class="fas fa-arrows-alt"></i>
                                                <label><img id="recipeImageUpload1" src="${contextRoot}/recipe/upload.png" class="recipeImageUpload"/>
                                                <input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload1)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="form-group additional-input-box icon-right"  style="height: 150px;">
                                                <textarea name="stepDescript" cols="30" rows="4" placeholder="輸入步驟說明" class="textarea form-control" style="height:auto"></textarea>
                                                <i class="fas fa-times removeStep"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------步驟動態結構--------------------- -->
                                </div>
                                    <button type="button" class="btn-upload" id="addStep"><span class="typcn typcn-plus">&nbsp;</span>加入步驟</button>
                            </div>
                            <button type="submit" class="btn-submit">發佈食譜</button>
                        </form>
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
            var count = 2;
            $("#addStep").click(function(){
                var addsteps = '<div class="row no-gutters singlestep">'
                              +'<div class="col-3">'
                              +'<div class="form-group additional-input-box icon-left" style="height: 150px;">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<label><img id="recipeImageUpload'+count+'" src="${contextRoot}/recipe/upload.png" class="recipeImageUpload"/>'
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
            });

            
    </script>
</body>


</html>