<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style type="text/css">
    .recipeImg{
        	object-fit: contain;
            width: 330px;
            height: 330px;
        }
    </style>
</head>
<body>
 <div id="preloader"></div>
    <!-- Preloader End Here -->
    <!-- ScrollUp Start Here -->
    <a href="#wrapper" data-type="section-switch" class="scrollup">
        <i class="fas fa-angle-double-up"></i>
    </a>
    <!-- ScrollUp End Here -->
    <div id="wrapper" class="wrapper">
        <!-- Header Area Start Here -->
        <jsp:include page="../layout/navbar.jsp"/>
        <!-- Header Area End Here -->
        <!-- Inne Page Banner Area Start Here -->
        <section class="inner-page-banner bg-common" data-bg-image="img/figure/inner-page-banner1.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>Search Your Recipes</h1>
                            <ul>
                                <li>
                                    <a href="index.html">Home</a>
                                </li>
                                <li>All Recipes</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Recipe Without Sidebar Area Start Here -->
        <section class="recipe-without-sidebar-wrap padding-top-80 padding-bottom-22">
            <div class="container">
                <div class="adv-search-wrap">
			<!-- ===================== ????????? ===================== -->
                <form action="find/user/username">
                    <div class="input-group">
                    	<select name="classify" id="classify">
                    		<option value="1">?????????</option>
                    		<option value="2">?????????</option>
                    	</select>
                        <input type="text" class="form-control" placeholder="??????????????????..." name="searchWord" id="searchWord" />
                        <div class="btn-group">
                            <div class="input-group-btn adv-search-fill-btn">
                                <button type="button" id="adv-serch" class="btn-adv-serch">
                                    <i class="icon-plus flaticon-add-plus-button"></i>
                                    <i class="icon-minus fas fa-minus"></i>
                                    ??????
                                </button>
                            </div>
                            <div class="input-group-btn">
                                <button type="button" class="btn-search" id="searchrecipe"><i class="flaticon-search"></i></button>
                            </div>
                        </div>
                    </div>
                  </form>  
              <!-- ===================== ????????? ===================== -->     
                    <div class="advance-search-form">
                        <div class="row">
                            <div class="col-lg-6">
                                <h3 class="item-title">?????????</h3>
                                <ul class="search-items">
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods0" type="checkbox" name="foods" value="??????" class="searchgroup">
                                            <label for="foods0">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods1" type="checkbox" name="foods" value="?????????" class="searchgroup">
                                            <label for="foods1">?????????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods2" type="checkbox" name="foods" value="?????????" class="searchgroup">
                                            <label for="foods2">?????????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods3" type="checkbox" name="foods" value="??????" class="searchgroup">
                                            <label for="foods3">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods4" type="checkbox" name="foods" value="??????" class="searchgroup">
                                            <label for="foods4">??????</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-6">
                                <h3 class="item-title">????????????</h3>
                                <ul class="search-items">
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country0" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country0">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country1" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country1">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country2" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country2">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country3" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country3">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country4" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country4">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country5" type="checkbox" name="country" value="??????" class="searchgroup">
                                            <label for="country5">??????</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country6" type="checkbox" name="country" value="?????????" class="searchgroup">
                                            <label for="country6">?????????</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="showrecipe">
							<!-- ===========================???????????????=========================== -->
							<c:forEach items="${rList}" var="rL">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-box-layout1">
                            <figure class="item-figure"><a href="${contextRoot}/recipe/find/${rL.recipeId}">
                            <img src="${contextRoot}/recipe/${rL.cookPhoto}" alt="Product" class="recipeImg" style="display:block; margin:auto;"></a></figure>
                            <div class="item-content">
                                <span class="sub-title">
                                <c:forEach items="${rL.recipeKeyword}" var="rK">
                                	${rK.keyword.keyword} 
                                </c:forEach>
                                </span>
                                <h3 class="item-title"><a href="${contextRoot}/recipe/find/${rL.recipeId}">${rL.cookTitle}</a></h3>
                                <p>${rL.cookDescription} </p>
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>${rL.cookTime} Mins</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>${rL.users.userName}</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>${fn:length(rL.favorite)}</span> Likes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                   		 <!-- ===========================???????????????=========================== -->
                </div>
            </div>
        </section>
        <!-- Recipe Without Sidebar Area End Here -->
        <!-- Footer Area Start Here -->
        <jsp:include page="../layout/footer.jsp"/>
        <!-- Footer Area End Here -->
    </div>
    <!-- Search Box Start Here -->
    <div id="search" class="search-wrap">
        <button type="button" class="close">??</button>
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
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <script>
        $("#searchrecipe").click(function(){

            var checkedList = [];
            $(".searchgroup:checked").each(function() {
                checkedList.push("&"+$(this).attr("name")+"="+$(this).val());
            });

            var checkedToController = "";
            if(checkedList.length != 0){
                for(i in checkedList){
                    checkedToController += checkedList[i]
                }
            }

            var settings = {
                "url": "http://localhost:8090/cookblog/find/recipe/food?classify=" + $("#classify").val() + "&searchWord=" + $("#searchWord").val() + checkedToController,
                "method": "GET",
                "timeout": 0,
            };

            $.ajax(settings).done(function (response) {
                let recipes = '';
                for(let index in response){
                    let r = response[index].recipeKeyword;
                    var classifytitle = "";
                    if(r != null){
                        for(let i in r){
                            classifytitle += r[i].keyword + " "
                            
                        }
                        classifytitle.trim();
                    }
                    

                    recipes += '<div class="col-lg-4 col-md-6 col-sm-6 col-12">'
                            +'<div class="product-box-layout1">'
                            +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'"><img src="${contextRoot}/recipe/'+response[index].cookPhoto+'" alt="Product"></a></figure>'
                            +'<div class="item-content">'
                            +'<span class="sub-title">' + classifytitle + '</span>'
                            +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'">'+response[index].cookTitle+'</a></h3>'
                            +'<p>'+response[index].cookDescription+'</p>'
                            +'<ul class="entry-meta">'
                            +'<li><a href="#"><i class="fas fa-clock"></i>'+response[index].cookTime+' Mins</a></li>'
                            +'<li><a href="#"><i class="fas fa-user"></i>by <span>'+response[index].userName+'</span></a></li>'
                            +'<li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>'
                            +'</ul></div></div></div>'
                }
                    
                $("#showrecipe").html("").append(recipes);

            });
        })

    </script>
</body>
</html>