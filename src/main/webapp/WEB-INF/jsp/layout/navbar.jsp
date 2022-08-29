<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextRoot}/css/typicons/typicons.css">
<style>
.userimg{
	object-fit:cover;
	width: 40px;
	height: 40px;
	border-radius:50%;
}

</style>
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
                                    <li><a href="${contextRoot}">首頁</a></li>
                                    <li>
                                        <a href="${contextRoot}/categories">分類</a>
                                    </li>
                                    <li><a href="${contextRoot}/showevent">活動</a></li>
                                    <li>
                                        <a href="${contextRoot}/recipe/find/all">食譜</a>
                                    </li>
                                    <c:if test="${!empty loginUser }">
                                    <li><a href="#">個人</a>
                                        <ul class="dropdown-menu-col-1">
                                      <li> <a href="${contextRoot}/users/updatemember?user_id=${loginUser.userId }">　修改會員資料</a></li>
                                            <li><a href="${contextRoot}/shownumberuser">　個人會員資料</a></li>
                                        </ul>
                                    </li>
                                    </c:if>
                                    <li><a href="${contextRoot}/posts/find/all">專欄</a>
                                        <ul class="dropdown-menu-col-1">
                                        <c:if test="${!empty loginUser }">
                                            <li><a href="${contextRoot}/posts">　新增文章</a></li>
                                        </c:if>
                                            <li><a href="${contextRoot}/posts/find/all">　文章列表</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="${contextRoot}/aboutus">關於我們</a></li>
                                    <li><a href="${contextRoot}/donation">贊助</a></li>
                                    <c:if test="${loginUser.permission ==2}">
                                    <li><a href="${contextRoot}/adminIndex">管理頁面</a>
                                    </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-lg-4 col-md-9 col-sm-8 col-8 d-flex align-items-center justify-content-end">
                            <div class="nav-action-elements-layout1">
                                <ul>             
                                   <c:if test="${empty loginUser }"> 
                                    <li>
                                       <a href="${contextRoot}/user/login" style="color: white"> <button type="button" class="login-btn" data-toggle="modal" data-target="#myModal">
                                            <span class="flaticon-profile typcn typcn-user-outline" style="font-size:30px">&nbsp;</span>登入
                                      </button> </a> 
                                    </li>
                                    </c:if>
                                    <c:if test="${!empty loginUser }">
                                    <li><img class="userimg size" alt="" src="${contextRoot}/users/${loginUser.userPhoto}"></li>
                                   	<li style="color:#ff4a52;">${loginUser.userName}</li>
                                    <li>
                                       <a href="${contextRoot}/users/logout" style="color: white"> <button type="button" class="login-btn" data-toggle="modal" data-target="#myModal">
                                            &nbsp;登出 </button></a> 
                                    </li>
                                    </c:if>
                                    
                                    <li>
                                        <a href="${contextRoot}/insertrecipe" class="fill-btn"><span class="flaticon-plus-1 typcn typcn-plus" style="font-size:20px"></span>上傳食譜</a>
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
            </div>
        </header>

