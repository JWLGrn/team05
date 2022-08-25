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
    <link rel="stylesheet" href="${contextRoot}/css/microns/microns.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style type="text/css">
    .recipeImg{
        	object-fit: cover;
            width: 400px;
            height: 250px;
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
        <jsp:include page="layout/navbar.jsp"/>
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
			<!-- ===================== 搜尋框 ===================== -->
                <form action="find/user/username">
                    <div class="input-group">
                    	<select name="classify" id="classify">
                    		<option value="1">找食譜</option>
                    		<option value="2">找作者</option>
                    	</select>
                        <input type="text" class="form-control" placeholder="請輸入關鍵字..." name="searchWord" id="searchWord" />
                        <div class="btn-group">
                            <div class="input-group-btn adv-search-fill-btn">
                                <button type="button" id="adv-serch" class="btn-adv-serch">
                                    <span class="icon-plus flaticon-add-plus-button typcn typcn-plus" style="font-size:20px">&nbsp;</span>
                                    <span class="icon-minus fas fa-minus typcn typcn-minus" style="font-size:20px">&nbsp;</span>
                                     分類
                                </button>
                            </div>
                            <div class="input-group-btn">
                                <button type="button" class="btn-search" id="searchrecipe"><span class="flaticon-search mu mu-search" style="font-size:30px;color:white;"></span></button>
                            </div>
                        </div>
                    </div>
                  </form>  
              <!-- ===================== 搜尋框 ===================== -->     
                    <div class="advance-search-form">
                        <div class="row">
                            <div class="col-lg-6">
                                <h3 class="item-title">食材類</h3>
                                <ul class="search-items">
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods0" type="checkbox" name="foods" value="豆類" class="searchgroup">
                                            <label for="foods0">豆類</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods1" type="checkbox" name="foods" value="魚貝類" class="searchgroup">
                                            <label for="foods1">魚貝類</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods2" type="checkbox" name="foods" value="蔬菜類" class="searchgroup">
                                            <label for="foods2">蔬菜類</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods3" type="checkbox" name="foods" value="肉類" class="searchgroup">
                                            <label for="foods3">肉類</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="foods4" type="checkbox" name="foods" value="蛋類" class="searchgroup">
                                            <label for="foods4">蛋類</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-lg-6">
                                <h3 class="item-title">異國風味</h3>
                                <ul class="search-items">
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country0" type="checkbox" name="country" value="中式" class="searchgroup">
                                            <label for="country0">中式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country1" type="checkbox" name="country" value="美式" class="searchgroup">
                                            <label for="country1">美式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country2" type="checkbox" name="country" value="日式" class="searchgroup">
                                            <label for="country2">日式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country3" type="checkbox" name="country" value="韓式" class="searchgroup">
                                            <label for="country3">韓式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country4" type="checkbox" name="country" value="歐式" class="searchgroup">
                                            <label for="country4">歐式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country5" type="checkbox" name="country" value="港式" class="searchgroup">
                                            <label for="country5">港式</label>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="checkbox checkbox-primary">
                                            <input id="country6" type="checkbox" name="country" value="東南亞" class="searchgroup">
                                            <label for="country6">東南亞</label>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="showrecipe">
							<!-- ===========================重複的結構=========================== -->
							<c:forEach items="${page.content}" var="rL">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-box-layout1">
                            <figure class="item-figure"><a href="${contextRoot}/recipe/find/${rL.recipeId}">
                            <img src="${contextRoot}/recipe/${rL.cookPhoto}" alt="Product" class="recipeImg"></a></figure>
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
                   		 <!-- ===========================重複的結構=========================== -->
                </div>
            </div>
            <div>
            <ul class="pagination-layout1" id="pagesList">
                     <c:forEach begin="1" end="${page.totalPages}" var="pageNumber">
					<c:choose>
						<c:when test="${pageNumber-1 == page.number}">
							<li class="active">
								<a>${pageNumber}</a>
							</li>	
						</c:when>
						<c:otherwise>
							<li><a href="${contextRoot}/recipe/find/all?p=${pageNumber}">
								${pageNumber} </a>
							</li>	
						</c:otherwise>

					</c:choose>
				</c:forEach>
             </ul>
            </div> 
        </section>
        <!-- Recipe Without Sidebar Area End Here -->
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
                let count = 0;
                let page = 1;
                var pageList = new Array();
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
                            +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'">'
                            +'<img src="${contextRoot}/recipe/'+response[index].cookPhoto+'" alt="Product" class="recipeImg"></a></figure>'
                            +'<div class="item-content">'
                            +'<span class="sub-title">' + classifytitle + '</span>'
                            +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'">'+response[index].cookTitle+'</a></h3>'
                            +'<p>'+response[index].cookDescription+'</p>'
                            +'<ul class="entry-meta">'
                            +'<li><a href="#"><i class="fas fa-clock"></i>'+response[index].cookTime+' Mins</a></li>'
                            +'<li><a href="#"><i class="fas fa-user"></i>by <span>'+response[index].userName+'</span></a></li>'
                            +'<li><a href="#"><i class="fas fa-heart"></i><span>'+response[index].favorCount+'</span> Likes</a></li>'
                            +'</ul></div></div></div>'
                    count++;
                    
                    if(count % 9 == 0){
                        pageList[count / 9 - 1] = recipes;
                        recipes = "";
                    }                                
                }
	           if (recipes != "") {  //剩下的筆數
                    pageList[Math.ceil(count / 9 - 1)] = recipes;
                    recipes = "";
                }
                  
                $("#showrecipe").html("").append(pageList[0]);

                //分頁按鈕
                var totalPages = pageList.length;
                pageBtn(totalPages,1);


                //切換頁面
                document.getElementById("pagesList").addEventListener("click", function (event) {
                    let page = event.target.innerHTML
                if (!isNaN(page)) {
                        $("#showrecipe").html("").append(pageList[page - 1]);
                        pageBtn(totalPages,page);
                    }
                })
            });
        })

        //分頁按鈕
        function pageBtn(totalPages,nowPage){
                var str2 = ''
                for (let i = 1; i <= totalPages; i++) {
                    if(i == nowPage){
                        str2 += '<li class="active"><a>' + i + '</a></li>'
                    }else{
                        str2 += '<li><a style="cursor: pointer;">' + i + '</a></li>'
                    }
                }
                $("#pagesList").html("").append(str2);
        }
                

    </script>
</body>
</html>