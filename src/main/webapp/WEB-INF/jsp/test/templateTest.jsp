<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <!-- Custom Css -->
    <link rel="stylesheet" href="style.css">
    <!-- Modernizr Js -->
    <script src="modernizr-3.6.0.min.js"></script>
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
        <header class="header-one">
            <div id="header-main-menu" class="header-main-menu header-sticky">
                <div class="container">                    
                    <div class="row">
                        <div class="col-lg-8 col-md-3 col-sm-4 col-4 possition-static">
                            <div class="site-logo-mobile">
                                <a href="index.html" class="sticky-logo-light"><img src="img/logo-light.png" alt="Site Logo"></a>
                                <a href="index.html" class="sticky-logo-dark"><img src="img/logo-dark.png" alt="Site Logo"></a>
                            </div>
                            <nav class="site-nav">
                                <ul id="site-menu" class="site-menu">
                                    <li><a href="#">Home</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li><a href="index.html">Home 1</a></li>
                                            <li><a href="index2.html">Home 2</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="category.html">Category</a>
                                    </li>
                                    <li>
                                        <a href="#">Recipes</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li>
                                                <a href="recipe-with-sidebar.html">Recipes With Sidebar</a>
                                            </li>
                                            <li>
                                                <a href="recipe-without-sidebar.html">Recipes Without Sidebar</a>
                                            </li>
                                            <li>
                                                <a href="single-recipe1.html">Single Recipe 1</a>
                                            </li>
                                            <li>
                                                <a href="single-recipe2.html">Single Recipe 2</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="possition-static hide-on-mobile-menu">
                                        <a href="#">Pages</a>
                                        <div class="template-mega-menu">
                                            <div class="container">
                                                <div class="row">
                                                    <div class="col-4">
                                                        <div class="menu-ctg-title">Home</div>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="index.html">
                                                                    <i class="fas fa-home"></i>Home 1</a>
                                                            </li>
                                                            <li>
                                                                <a href="index2.html">
                                                                    <i class="fas fa-home"></i>Home 2</a>
                                                            </li>
                                                        </ul>
                                                        <div class="menu-ctg-title">Recipes</div>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="recipe-with-sidebar.html"><i class="fas fa-utensils"></i>Recipes
                                                                    With Sidebar</a>
                                                            </li>
                                                            <li>
                                                                <a href="recipe-without-sidebar.html"><i class="fas fa-utensils"></i>Recipes
                                                                    Without
                                                                    Sidebar</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-4">
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="single-recipe1.html"><i class="fas fa-utensils"></i>Single
                                                                    Recipe 1</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-recipe2.html"><i class="fas fa-utensils"></i>Single
                                                                    Recipe 2</a>
                                                            </li>
                                                        </ul>
                                                        <div class="menu-ctg-title">Other Pages</div>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="about.html"><i class="fab fa-cloudversify"></i>About</a>
                                                            </li>
                                                            <li>
                                                                <a href="author.html"><i class="fas fa-user"></i>Author</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-author.html"><i class="fas fa-user"></i>Author
                                                                    Details</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-4">
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="submit-recipe.html"><i class="far fa-share-square"></i>Submit
                                                                    Recipe</a>
                                                            </li>
                                                            <li>
                                                                <a href="login.html"><i class="fas fa-lock"></i>Login</a>
                                                            </li>
                                                            <li>
                                                                <a href="404.html"><i class="fas fa-exclamation-triangle"></i>404
                                                                    Error</a>
                                                            </li>
                                                        </ul>
                                                        <div class="menu-ctg-title">Shop</div>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="shop.html"><i class="fas fa-shopping-cart"></i>Shop</a>
                                                            </li>
                                                            <li>
                                                                <a href="single-shop.html"><i class="fas fa-shopping-cart"></i>Shop
                                                                    Details</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="hide-on-desktop-menu">
                                        <a href="#">Pages</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li>
                                                <a href="about.html">About</a>
                                            </li>
                                            <li>
                                                <a href="author.html">Author</a>
                                            </li>
                                            <li>
                                                <a href="single-author.html">Author Details</a>
                                            </li>
                                            <li>
                                                <a href="submit-recipe.html">Submit Recipe</a>
                                            </li>
                                            <li>
                                                <a href="login.html">Login</a>
                                            </li>
                                            <li>
                                                <a href="login.html">404 Error</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Blog</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li><a href="blog-grid.html">Blog Grid</a></li>
                                            <li><a href="blog-list.html">Blog List</a></li>
                                            <li><a href="single-blog.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Shop</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li><a href="shop.html">Shop</a></li>
                                            <li><a href="single-shop.html">Shop Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-8 col-8 d-flex align-items-center justify-content-end">
                            <div class="nav-action-elements-layout1">
                                <ul>
                                    <li>
                                        <div class="cart-wrap cart-on-mobile d-lg-none">                                            
                                            <div class="cart-info">
                                                <i class="flaticon-shopping-bag"></i>
                                                <div class="cart-amount"><span class="item-currency">$</span>00</div>     
                                            </div>                                   
                                            <div class="cart-items">
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product1.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Pressure</a>
                                                        <span>Code: STPT601</span>
                                                    </div>
                                                    <div class="cart-quantity">X 1</div>
                                                    <div class="cart-price">$249</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product2.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Stethoscope</a>
                                                        <span>Code: STPT602</span>
                                                    </div>
                                                    <div class="cart-quantity">X 1</div>
                                                    <div class="cart-price">$189</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product3.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Microscope</a>
                                                        <span>Code: STPT603</span>
                                                    </div>
                                                    <div class="cart-quantity">X 2</div>
                                                    <div class="cart-price">$379</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-btn">
                                                        <a href="#" class="item-btn">View Cart</a>
                                                        <a href="#" class="item-btn">Checkout</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <button type="button" class="login-btn" data-toggle="modal" data-target="#myModal">
                                            <i class="flaticon-profile"></i>Login
                                        </button>
                                    </li>
                                    <li>
                                        <a href="submit-recipe.html" class="fill-btn"><i class="flaticon-plus-1"></i>SUBMIT
                                            RECIPE</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="mob-menu-open toggle-menu">
                                <span class="bar"></span>
                                <span class="bar"></span>
                                <span class="bar"></span>
                                <span class="bar"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom d-none d-lg-block">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 d-none d-lg-block">
                            <div class="nav-action-elements-layout2">
                                <ul class="nav-social">
                                    <li><a href="#" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
                                    <li><a href="#" title="twitter"><i class="fab fa-twitter"></i></a></li>
                                    <li><a href="#" title="linkedin"><i class="fab fa-linkedin-in"></i></a></li>
                                    <li><a href="#" title="pinterest"><i class="fab fa-pinterest-p"></i></a></li>
                                    <li><a href="#" title="skype"><i class="fab fa-skype"></i></a></li>
                                    <li><a href="#" title="rss"><i class="fas fa-rss"></i></a></li>
                                    <li><a href="#" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 d-none d-lg-block">
                            <div class="site-logo-desktop">
                                <a href="index.html" class="main-logo"><img src="img/logo-dark.png" alt="Site Logo"></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="nav-action-elements-layout3">
                                <ul>
                                    <li>
                                        <div class="header-search-box">
                                            <a href="#search" title="Search" class="search-button">
                                                <i class="flaticon-search"></i>
                                            </a> 
                                        </div>
                                    </li>
                                    <li>
                                        <div class="cart-wrap d-none d-lg-block">                                            
                                            <div class="cart-info">
                                                <i class="flaticon-shopping-bag"></i>
                                                <div class="cart-amount"><span class="item-currency">$</span>00</div>     
                                            </div>                                   
                                            <div class="cart-items">
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product1.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Pressure</a>
                                                        <span>Code: STPT601</span>
                                                    </div>
                                                    <div class="cart-quantity">X 1</div>
                                                    <div class="cart-price">$249</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product2.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Stethoscope</a>
                                                        <span>Code: STPT602</span>
                                                    </div>
                                                    <div class="cart-quantity">X 1</div>
                                                    <div class="cart-price">$189</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-img">
                                                        <a href="#">
                                                            <img src="img/product/top-product3.jpg" alt="product" class="img-fluid">
                                                        </a>
                                                    </div>
                                                    <div class="cart-title">
                                                        <a href="#">Microscope</a>
                                                        <span>Code: STPT603</span>
                                                    </div>
                                                    <div class="cart-quantity">X 2</div>
                                                    <div class="cart-price">$379</div>
                                                    <div class="cart-trash">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="cart-item">
                                                    <div class="cart-btn">
                                                        <a href="#" class="item-btn">View Cart</a>
                                                        <a href="#" class="item-btn">Checkout</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
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
                                    <i class="icon-plus flaticon-add-plus-button"></i>
                                    <i class="icon-minus fas fa-minus"></i>
                                    分類
                                </button>
                            </div>
                            <div class="input-group-btn">
                                <button type="button" class="btn-search" id="searchrecipe"><i class="flaticon-search"></i></button>
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
							<c:forEach items="${rList}" var="rL">
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="product-box-layout1">
                            <figure class="item-figure"><a href="single-recipe1.html"><img src="${rL.cookPhoto}"
                                        alt="Product"></a></figure>
                            <div class="item-content">
                                <span class="sub-title">CHICKEN</span>
                                <h3 class="item-title"><a href="single-recipe1.html">${rL.cookTitle}</a></h3>
                                <p>${rL.cookDescription} </p>
                                <ul class="entry-meta">
                                    <li><a href="#"><i class="fas fa-clock"></i>${rL.cookTime} Mins</a></li>
                                    <li><a href="#"><i class="fas fa-user"></i>by <span>${rL.users.userName}</span></a></li>
                                    <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                   		 <!-- ===========================重複的結構=========================== -->
                </div>
            </div>
        </section>
        <!-- Recipe Without Sidebar Area End Here -->
        <!-- Footer Area Start Here -->
        <footer class="ranna-bg-dark">
            <div class="container">
                <div class="footer-logo">
                    <a href="index.html"><img src="img/logo-light.png" class="img-fluid" alt="footer-logo"></a>
                </div>
                <div class="footer-menu">
                    <ul>
                        <li><a href="#">FACEBOOK</a></li>
                        <li><a href="#">TWITTER</a></li>
                        <li><a href="#">INSTAGRAM</a></li>
                        <li><a href="#">PINTEREST</a></li>
                        <li><a href="#">GOOGLEPLUS</a></li>
                        <li><a href="#">YOUTUBE</a></li>
                    </ul>
                </div>
                <div class="copyright"><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></div>
            </div>
        </footer>
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
    <script src="jquery-3.6.0.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="popper.min.js"></script>
    <!-- Bootstrap Js -->
    <script src="bootstrap.bundle.min.js"></script>
    <!-- Plugins Js -->
    <script src="plugins.js"></script>
    <!-- Smoothscroll Js -->
    <script src="smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="main.js"></script>
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
                            +'<figure class="item-figure"><a href="single-recipe1.html"><img src="'+response[index].cookPhoto+'" alt="Product"></a></figure>'
                            +'<div class="item-content">'
                            +'<span class="sub-title">' + classifytitle + '</span>'
                            +'<h3 class="item-title"><a href="single-recipe1.html">'+response[index].cookTitle+'</a></h3>'
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