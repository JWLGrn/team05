<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Ranna | Submit Recipes</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
</head>
<body onload="Favorite();report()">
<!-- <body> -->
<!-- Preloader Start Here -->
	<div id="preloader"></div>
	<!-- Preloader End Here -->
	<!-- ScrollUp Start Here -->
	<a href="#wrapper" data-type="section-switch" class="scrollup"> <i
		class="fas fa-angle-double-up"></i>
	</a>
	
	<div id="wrapper" class="wrapper">
		<!-- Header Area Start Here -->
		<jsp:include page="../layout/navbar.jsp" />
		<!-- Header Area End Here -->
		<!-- Inne Page Banner Area Start Here -->
		<section class="inner-page-banner bg-common"
			data-bg-image="/img/figure/inner-page-banner1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="breadcrumbs-area">
							<h1>Welcome ${loginUser.userName}</h1>
							<ul>
								<li><a href="${contextRoot}">Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		</div>
	
	<!-- Inne Page Banner Area End Here -->
        <!-- Author Area Start Here -->
        
<!--         ------------------------------------------------------------------------ -->
        <section class="author-page-wrap padding-top-80 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="author-box-layout1">
                            <div class="adv-search-wrap">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Author Name Search . . ." />
                                    <div class="btn-group">
                                        <div class="input-group-btn">
                                            <button type="submit" class="btn-search"><i class="flaticon-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h3 class="author-section-title">Total 1,050 Authors</h3>
                            <div class="table-responsive">
<!--                            重複結構  ------------------------------------------------------------ -->
                                <table class="table table-striped">
                                    <tbody>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author2.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Mark Willy</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">15</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">29</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">35+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author3.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Abul Hassan</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">16</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">41</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">17+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author4.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Liza Zaman</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">10</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">25</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">19+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author5.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Mark Willy</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">14</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">25</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">28+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author6.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Liza Zaman</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">9</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">21</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">40+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author7.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Mark Willy</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">9</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">26</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">17+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author8.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Mark Willy</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">13</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">40</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">23+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>
                                                <div class="author-personal-info">
                                                    <a href="#" class="item-figure"><img src="img/blog/author3.jpg" alt="Author"></a>
                                                    <div class="item-content">
                                                        <div class="item-title"><a href="#">Mark Willy</a></div>
                                                        <div class="item-designation">Dessert Specialist</div>
                                                    </div>
                                                </div>
                                            </th>
                                            <td>
                                                <div class="author-social-info">
                                                    <ul>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Recipes</h4>
                                                                <span class="item-number">18</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Reviews</h4>
                                                                <span class="item-number">28</span>
                                                            </div>
                                                        </li>
                                                        <li>
                                                            <div>
                                                                <h4 class="item-title">Favourite</h4>
                                                                <span class="item-number">10+</span>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
<!--                                 -------------------------------------- -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">Welcome ${loginUser.userName }</h3>
                            </div>
                            <div class="widget-about">
<!--                                 <figure class="author-figure"><img src="img/figure/about.jpg" alt="about"></figure> -->
<!--                                 <figure class="author-signature"><img src="img/figure	/signature.png" alt="about"></figure> -->
                                 <img class="userimg size" style="border-radius: 50%;" alt="about" src="${contextRoot}/users/${loginUser.userPhoto}">
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
                    </div>
                </div>
            </div>
        </section>
        案讚測試功能:<div  id="myDiv"></div>
檢舉測試功能:<div id="findUser"></div>
	<!-- ScrollUp End Here -->
<!-- 	<div id="wrapper" class="wrapper"> -->
		<!-- Header Area Start Here -->
		<jsp:include page="../layout/navbar.jsp" />
		<!-- Header Area End Here -->
		<!-- Inne Page Banner Area Start Here -->
<!-- 		</div> -->
		<!-- Inne Page Banner Area End Here -->
		<!-- Submit Recipe Area Start Here -->
		<!--         <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50"> -->
		<!--             <div class="container"> -->



<!-- ----------------------------------------------------------------------------------------------- -->


<script>
function Favorite()
{
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
var content ='';
             var recipe=JSON.parse(xhr.responseText);
             for(var i =0;i<recipe.length;i++){
            	 content+= '<a href="' + "${contextRoot}/favorite?recipe_id="+recipe[i].recipeId+"&&user_id=${loginUser.userId }" + '">'
            	 +'<img src="break.jpg" width="40">'+ 
            	 recipe[i].cookTitle + '</a>';
            	 console.log(recipe[i].recipeId);
             }
             document.getElementById("myDiv").innerHTML=content;
  }
});

xhr.open("GET", "http://localhost:8090/cookblog/finder",true);

xhr.send();
}

function report(){
	var xhr = new XMLHttpRequest();
	xhr.withCredentials = true;

	xhr.addEventListener("readystatechange", function() {
	  if(this.readyState === 4) {
		  var content ='';
		  var report=JSON.parse(xhr.responseText);
		  for(var i =0;i<report.length;i++){
		  content+= '<a href="' + "${contextRoot}/users/report?user_id="+report[i].userId+"&&user_id=${loginUser.userId }" + '">'
     	 +'<img src="report.jpg" width="40">'+ 
     	report[i].userName + '</a>';
	    console.log(this.responseText);
	    content+='<a>'
	    document.getElementById("findUser").innerHTML=content;
		  }
	  }
	});

	xhr.open("GET", "http://localhost:8090/cookblog/findUsers",true);

	xhr.send();
}
</script>	
	
		

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

</body>
</html>