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
<title>Personal</title>
<meta name="description" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon -->
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
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<style type="text/css">
.obfit{
object-fit:cover;
width: 200px;
height:200px;
}
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #fff;
    background-color: #ff4a52;
}
.aa {
    color: #ff4a52;
    text-decoration: none;
    background-color: transparent;
    cursor:pointer;
}
.photo{
object-fit:cover;
width:115px;
height:115px;
}
.recipeImg{
object-fit: cover;
width: 400px;
height: 250px;
}
.inner-page-banner:before {
background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/shownumberuser.jpg");
background-position: center;
background-size: cover;
		}
</style>
</head>
<!-- <body onload="Favorite();report()"> -->
<body>
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
		<section class="inner-page-banner bg-common">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="breadcrumbs-area">
							<h1>Welcome ${loginUser.userName}</h1>
							<ul>
								<li><a href="${contextRoot}">Home</a></li>
								<li>Personal</li>
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
								<nav class="nav nav-pills nav-fill">
 									 <a class="nav-item nav-link active aa" id="myrecipe">個人食譜</a>
  									 <a class="nav-item nav-link aa" id="mycollect">收藏食譜</a>
 									 <a class="nav-item nav-link aa" id="myfollow">追蹤作者</a>
								</nav>
                                <div id="showblock"></div>
                                    <ul class="pagination-layout1" id="pagesList"></ul>
                                    <div class="table-responsive">
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 sidebar-widget-area sidebar-break-md">
                        <div class="widget">
                            <div class="section-heading heading-dark">
                                <h3 class="item-heading">Welcome ${loginUser.userName }</h3>
                            </div>
                            <div class="widget-about">
                                <figure class="author-figure"><img src="${contextRoot}/users/${loginUser.userPhoto}" alt="about" class="obfit"></figure>
<!--                                 <figure class="author-signature"><img src="img/figure	/signature.png" alt="about"></figure> -->
<!--                                  <img class="userimg size" style="border-radius: 50%;" alt="about" src="${contextRoot}/users/${loginUser.userPhoto}"> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </section>        
<!--案讚測試功能:<div  id="myDiv"></div> -->
<!-- 檢舉測試功能:<div id="findUser"></div> -->
	<!-- ScrollUp End Here -->
<!-- 	<div id="wrapper" class="wrapper"> -->
		<!-- Header Area Start Here -->
		<jsp:include page="../layout/footer.jsp" />
		
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
		<script src="${contextRoot}/js/main.js">
</script>
<script type="text/javascript">
    

    //查詢個人食譜
     function myrecipe(){
	var settings = {
			  "url": "http://localhost:8090/cookblog/recipe.personal.controller",
			  "method": "GET",
			  "timeout": 0,
			};
			$.ajax(settings).done(function (response) {
			  console.log(response);
              let recipes = '<div class="section-heading heading-dark">'
                            +' <h2 class="item-heading">RECIPES</h2>'
                            +'</div>'
                            +'<div class="row">';     
                let count = 0;
                let page = 1;
                var pageList = new Array();
                for(let index in response){
                    let r = response[index].recipeKeyword;
                    var classifytitle = "";
                    if(r != null){
                        for(let i in r){
                            classifytitle += r[i].keywords + " "      
                        }                 
                    }
                    recipes += '<div class="col-md-6 col-sm-6 col-12">'
                            +'<div class="product-box-layout1">'
                            +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'"><img src="${contextRoot}/recipe/'+response[index].cookPhoto+'" alt="Product" class="recipeImg"></a></figure>'
                            +'<div class="item-content">'
                            +'<span class="sub-title">'+classifytitle.trim()+'</span>'    
                            +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'">'+response[index].cookTitle+'</a></h3>'      
                            +'<p>'+response[index].cookDescription+'</p>'           
                            +'<ul class="entry-meta">'            
                            +'<li><a><i class="fas fa-clock"></i>'+response[index].cookTime+'</a></li>'          
                            +'<li><a><i class="fas fa-user"></i>by <span>'+response[index].userName+'</span></a></li>'            
                            +'<li><a><i class="fas fa-heart"></i><span>'+response[index].favorite.length+'</span> Likes</a></li>'              
                            +'</ul></div></div></div>';
                    count++        
                    if(count % 4 == 0){
                        recipes += '</div>' 
                    	pageList.push(recipes);
                        recipes = '<div class="section-heading heading-dark">'
                                +' <h2 class="item-heading">RECIPES</h2>'
                                +'</div>'
                                +'<div class="row">';   	
                    }
                 }  
                 if (count % 4 != 0) {  //剩下的筆數
                    recipes += '</div>'
                    pageList.push(recipes);
                    recipes = "";
                }
                  console.log(pageList[0])
                $("#showblock").html("").append(pageList[0]);

                //分頁按鈕
                var totalPages = pageList.length;
                pageBtn(totalPages,1);

                                //切換頁面
                $("#pagesList").click(function(event) {
                    let page2 = $(event.target).html()
                if (!isNaN(page2)) {
                        $("#showblock").html("").append(pageList[page2 - 1]);
                        pageBtn(totalPages,page2);
                    }
                })
                         
			});
                
};

$('#mycollect').click(function(e){
             var settings = {
                     "url": "http://localhost:8090/cookblog/collect.personal.controller",
                     "method": "GET",
                     "timeout": 0,
            };

			$.ajax(settings).done(function (response) {

              let collect = '<div class="section-heading heading-dark">'
                            +' <h2 class="item-heading">RECIPES</h2>'
                            +'</div>'
                            +'<div class="row">';                               
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
                    }
                    collect += '<div class="col-md-6 col-sm-6 col-12">'
                            +'<div class="product-box-layout1">'
                            +'<figure class="item-figure"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'"><img src="${contextRoot}/recipe/'+response[index].cookPhoto+'"" alt="Product" class="recipeImg"></a></figure>'
                            +'<div class="item-content">'
                            +'<span class="sub-title">'+classifytitle.trim()+'</span>'    
                            +'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+response[index].recipeId+'">'+response[index].cookTitle+'</a></h3>'      
                            +'<p>'+response[index].cookDescription+'</p>'           
                            +'<ul class="entry-meta">'            
                            +'<li><a><i class="fas fa-clock"></i>'+response[index].cookTime+'</a></li>'          
                            +'<li><a href="${contextRoot}/user/find/'+response[index].userId+'"><i class="fas fa-user"></i>by <span>'+response[index].userName+'</span></a></li>'            
                            +'<li><a><i class="fas fa-heart"></i><span>'+response[index].favorCount+'</span> Likes</a></li>'              
                            +'</ul></div></div></div>';
                            count++        
                    if(count % 4 == 0){
                        collect += '</div>' 
                    	pageList.push(collect);
                        collect = '<div class="section-heading heading-dark">'
                                +' <h2 class="item-heading">COLLECTION</h2>'
                                +'</div>'
                                +'<div class="row">';   	
                    }
                 }  
                 if (count % 4 != 0) {  //剩下的筆數
                    collect += '</div>'
                    pageList.push(collect);
                    collect = "";
                }
                  console.log(pageList[0])
                $("#showblock").html("").append(pageList[0]);

                //分頁按鈕
                var totalPages = pageList.length;
                pageBtn(totalPages,1);

                                //切換頁面
                $("#pagesList").click(function(event) {
                    let page2 = $(event.target).html()
                if (!isNaN(page2)) {
                        $("#showblock").html("").append(pageList[page2 - 1]);
                        pageBtn(totalPages,page2);
                    }
                })
                $(e.target).addClass("active");
                $(e.target).siblings().removeClass("active");
                console.log(collect);
			});
});

$('#myfollow').click(function(e){
            var settings = {
                "url": "http://localhost:8090/cookblog/follow.personal.controller",
                "method": "GET",
                 "timeout": 0,
            };

            $.ajax(settings).done(function (response) {

                 let follow = '<div class="section-heading heading-dark">'
                            +' <h2 class="item-heading">RECIPES</h2>'
                            +'</div>'
                            +'<div class="row">';                               
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
                     follow +='<table class="table table-striped">'
                            +'<tbody>'
                            +'<tr>'  
                            +'<th>'
                            +'<div class="author-personal-info">'
                            +'<a href="${contextRoot}/user/find/'+response[index].userId+'" class="item-figure photo"><img src="${contextRoot}/image/users/'+response[index].userPhoto+'" alt="Author" class="photo"></a>'
                            +'<div class="item-content">'
                            +'<div class="item-title"><a href="${contextRoot}/user/find/'+response[index].userId+'">'+response[index].userName+'</a></div>'     
                            +'</div></div></th><td>'           
                            +'<div class="author-social-info">'               
                            +'<ul><li><div>'                    
                            +'<h4 class="item-title">Recipes</h4>'                       
                            +'<span class="item-number">'+response[index].recipeCount+'</span>'                       
                            +'</div></li><li><div>'                           
                            +'<h4 class="item-title">Follower</h4>'                            
                            +'<span class="item-number">'+response[index].followCount+'</span>'                        
                            +'</div></li><li><div>'  
                            +'<h4 class="item-title">Favourite</h4>'                      
                            +'<span class="item-number">'+response[index].favoriteCount+'</span>'               
                            +'</div></li></ul></div></td></tr></tbody></table>';
                            count++        
                    if(count % 4 == 0){
                        follow += '</div>' 
                    	pageList.push(follow);
                        follow = '<div class="section-heading heading-dark">'
                                +' <h2 class="item-heading">FOLLOW</h2>'
                                +'</div>'
                                +'<div class="row">';   	
                    }
                 }  
                 if (count % 4 != 0) {  //剩下的筆數
                    follow += '</div>'
                    pageList.push(follow);
                    follow = "";
                }
                  console.log(pageList[0])
                $("#showblock").html("").append(pageList[0]);

                //分頁按鈕
                var totalPages = pageList.length;
                pageBtn(totalPages,1);

                                //切換頁面
                $("#pagesList").click(function(event) {
                    let page2 = $(event.target).html()
                if (!isNaN(page2)) {
                        $("#showblock").html("").append(pageList[page2 - 1]);
                        pageBtn(totalPages,page2);
                    }
                })
                $(e.target).addClass("active");
                $(e.target).siblings().removeClass("active");       
            });
})

myrecipe();

$("#myrecipe").click(function(){
    myrecipe();
    $(this).addClass("active");
    $(this).siblings().removeClass("active");
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