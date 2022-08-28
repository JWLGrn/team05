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
    	.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/recipebanner.jpg");
    		background-position: center;
            background-size: cover;
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
        <section class="inner-page-banner bg-common">
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
							<li><a href="${contextRoot}/categories/${category}/${pageNumber}">
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

</body>
</html>