<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>Admin Menu</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- simple-notify CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/simple-notify.min.css">
    <!-- sweetalert2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/sweetalert2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
        <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui/dist/fancybox.css"/>
        <style type="text/css">
    	
		.cursor_pointer{
			cursor: pointer; 
		}
        .nav{
        	color:white;
        }
        .nav:hover{
        	color:black;
        }

        .navl{
        	padding-bottom:7px;
        	padding-top:7px;
        	padding-left:20px;
        }
        .navl:hover{
        	background-color:white;
        	padding-bottom:7px;
        	padding-top:7px;
        	padding-left:20px;
        }
		div.admin{
			background-color:#ff4a52;
		}
		body::-webkit-scrollbar {
   			 display: none;
		}
		body{
			height: 100%;
		}
		button{
		padding: 5px 10px 5px;
    	background-color: #ff4a52;
    	border-radius: 0;
    	border: none;
    	color: #ffffff;
    	font-weight: 600;
    	display: inline-flex;
    	-webkit-box-align: center;
    	align-items: center;
    	-webkit-box-pack: center;
    	justify-content: center;
    	cursor: pointer;
    	box-shadow: none;
    	transition: all 0.3s ease-out;
		}
    </style>
</head>
<body style="height: 100%;">
	<div class="col-lg-2 admin fixed-top"
		style="z-index: 3; width: 200px; font-weight: bold;height:100vh;" id="mySidebar">
		<br>
		<div>
		 <h3 class="w3-padding-64" style="padding-top:50px">
				<b>????????????</b>
			</h3>
			</div>
                    
		<div><ul>
				<li class="navl"><a class="nav" href="${contextRoot}/adminIndex">??????????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/addfoods">????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/show/AllFoods">????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/addkeyword">??????????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/showAllKeywords">??????????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/showAllUsers">???????????????</a></li>
				<li class="navl"><a class="nav" href="${contextRoot}/showallevent">????????????</a></li>
			</ul>
		</div>
	</div>

</body>
</html>