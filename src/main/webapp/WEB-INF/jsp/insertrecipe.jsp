<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html class="no-js" lang="">

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
    <link rel="stylesheet" href="normalize.css">
    <!-- Main Css -->
    <link rel="stylesheet" href="main.css">
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="bootstrap.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="animate.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="fontawesome-all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="flaticon.css">
    <!-- Summernote CSS -->
    <link rel="stylesheet" href="summernote.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="owl.carousel.min.css">
    <link rel="stylesheet" href="owl.theme.default.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="select2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernizr Js -->
    <script src="modernizr-3.6.0.min.js"></script>
    <style>

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
        <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <form class="submit-recipe-form" method="POST" action="add" enctype="multipart/form-data">
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
                                                <select class="select2 foods" name="filter-by"></select>
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
                                    <button type="button" class="btn-upload" id="addFood"><i class="flaticon-add-plus-button"></i>加入食材</button>
                            </div>
                            <div class="additional-input-wrap">
                                <label>步驟</label>
                                <div class="steptable">
                                    <!-- ---------------------步驟動態結構--------------------- -->
                                    <div class="row no-gutters singlestep">
                                        <div class="col-3">
                                            <div class="form-group additional-input-box icon-left" style="height: 150px;">
                                                <i class="fas fa-arrows-alt"></i>
                                                <label><img id="recipeImageUpload" src="upload.png" height="150px"/>
                                                <input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
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
                                    <button type="button" class="btn-upload" id="addStep"><i class="flaticon-add-plus-button"></i>加入步驟</button>
                            </div>
                            <button type="submit" class="btn-submit">發佈食譜</button>
                        </form>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
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
    <script src="jquery-3.6.0.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="popper.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="bootstrap.bundle.min.js"></script>
    <!-- Plugins Js -->
    <script src="plugins.js"></script>
    <!-- Owl Carousel Js -->
    <script src="owl.carousel.min.js"></script>
    <!-- Summernote JS -->
    <script src="summernote.min.js"></script>
    <!-- Select 2 Js -->
    <script src="select2.full.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="main.js"></script>
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
                              +'<select class="select2 foods" name="filter-by">'+foodList+'</select>'
                              +'</div></div>'
                              +'<div class="col-6">'
                              +'<div class="form-group additional-input-box icon-right">'
                              +'<input type="number" placeholder="份量（公克）" class="form-control" name="name">'
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
            var count = 1;
            $("#addStep").click(function(){
                var addsteps = '<div class="row no-gutters singlestep">'
                              +'<div class="col-3">'
                              +'<div class="form-group additional-input-box icon-left" style="height: 150px;">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<label><img id="recipeImageUpload'+count+'" src="upload.png" height="150px"/>'
                              +'<input type="file" name="rfile" onchange="photochange(event,recipeImageUpload'+count+')" accept=".png, .jpg, .jpeg" style="display:none;"/></label>'
                              +'</div></div>'
                              +'<div class="col-9">'
                              +'<div class="form-group additional-input-box icon-right"  style="height: 150px;">'
                              +'<textarea name="" cols="30" rows="4" placeholder="輸入步驟說明" class="textarea form-control" style="height:auto"></textarea>'
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