<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
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
                                    <li><a href="#">首頁</a></li>
                                    <li>
                                        <a href="category.html">分類</a>
                                    </li>
                                    <li><a href="#">活動</a></li>
                                    <li>
                                        <a href="${contextRoot}/recipe/find/all">食譜</a>
                                    </li>
                                    <li><a href="#${contextRoot}/posts/find/all">個人</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li><a href="author.html">　Author</a></li>
                                            <li><a href="blog-list.html">　Blog List</a></li>
                                            <li><a href="single-blog.html">　Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="${contextRoot}/posts/find/all">專欄</a>
                                        <ul class="dropdown-menu-col-1">
                                            <li><a href="blog-grid.html">Blog Grid</a></li>
                                            <li><a href="blog-list.html">Blog List</a></li>
                                            <li><a href="single-blog.html">Blog Details</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.html">關於我們</a></li>
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
                                        <a href="${contextRoot}/insertrecipe" class="fill-btn"><i class="flaticon-plus-1"></i>上傳食譜</a>
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

