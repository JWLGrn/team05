<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html class="no-js" lang="">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Submit Post</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <style>
		.ck-editor__editable_inline {
			/* 設定最低高度 */
    		min-height: 500px;
		}
		.insertcontainer{
			background-color:white;
			padding:30px;
			border-radius:10px;
			border: 1px solid #E0E0E0;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		}
		.msg{
			margin-left:30px;
			color:red;
		}
		.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/cpost.jpg");
    		background-position: center;
            background-size: cover;
		}
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
        <section class="inner-page-banner bg-common">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumbs-area">
                            <h1>Submit Post</h1>
                            <ul>
                                <li>
                                    <a href="${contextRoot}">Home</a>
                                </li>
                                <li>
                                    <a href="${contextRoot}/posts/find/all">Post List</a>
                                </li>
                                <li>Submit Post</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50" style="background-color:#F0F0F0">
            <div class="container">
                <div class="row gutters-60">
                <div class="col-lg-2"></div>
                    <div class="col-lg-8 insertcontainer">
                        <form class="submit-recipe-form" method="POST" action="recipe/insert">
                        <div class="form-group" style="display: flex;justify-content: center;">
                                <label><img id="postImageUpload" src="${contextRoot}/recipe/upload.png" height="150px"/>
                                <input type="file" name="photo" id="photo" onchange="photochange(event,postImageUpload)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                            </div>
                            <div class="form-group">
                                <label>標題</label>
                                <input type="text" placeholder="請輸入文章標題..." class="form-control" id="title"
                                    data-error="Subject field is required" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label>文章內容</label>
        							<textarea id="editor"></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <button type="button" class="btn-submit">發表文章</button><span class="msg"></span>
                            
                        </form>
                        <i class="fas fa-star color_yellow" onclick="hotkey()">快捷鍵</i>
                    </div>
                </div>
            </div>
        </section>
        <!-- Submit Recipe Area End Here -->
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
    <!-- Owl Carousel Js -->
    <script src="${contextRoot}/js/owl.carousel.min.js"></script>
    <!-- Select 2 Js -->
    <script src="${contextRoot}/js/select2.full.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <script src="${contextRoot}/ckeditor/ckeditor.js"></script>
 	<script type="text/javascript">
 	 function hotkey(){
		 $("#title").val("蔥花冷凍保存時，如何避免結塊或變形？簡單1方法讓冷凍蔥花鬆散又漂亮");
		 $("p").text("讓冷凍蔥花鬆散又漂亮的方法： 首先，將切好的蔥花全數放入一個可冷凍的食物保鮮盒中。蓋上食物保鮮盒的蓋子前，要先在蔥花上蓋一張廚房紙巾。廚房紙巾要摺成可以完全覆蓋盒中每個角落的大小。鋪好廚房紙巾後，就可以將食物保鮮盒的蓋子蓋上，再把保鮮盒整個「倒過來」，然後就這樣倒著放入冰箱冷凍即可，這麼做就能避免蔥花結塊變形。每次要取用冷凍蔥花時，直接用湯匙去挖就好。");
	 }
 		ClassicEditor
    	.create(document.querySelector('#editor'))
    	.then(editor => {
    		window.editor = editor;
    	})

//     	$(".btn-submit").click(function(){
//             var editorData= editor.getData();
//             var settings = {
//             		  "url": "http://localhost:8090/cookblog/posts/insert",
//             		  "method": "POST",
//             		  "timeout": 0,
//             		  "headers": {
//             		    "Content-Type": "application/json"
//             		  },
//             		  "data": JSON.stringify({
//             		    "title": $("#title").val(),
//             		    "context": $(editor.getData()).text()
//             		  }),
//             		};

//             		$.ajax(settings).done(function (response) {
//             		  console.log(response);
//             		});
//           })
          
          $(".btn-submit").click(function(){
        	  if($("#title").val()=="" || editor.getData() == ""){
        		  $(".msg").html("<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>請輸入資料！");
        		  }else{
        		  var formData = new FormData();
              	  var data= new Blob([JSON.stringify({
                  "title": $("#title").val(),
                  "context": editor.getData(),
                  "outline": $(editor.getData()).text().substr(0,180)+"..."
              	  })], {
                      type: "application/json"
                  });

              formData.append("posts", data);
              formData.append("photo", $("#photo")[0].files[0]);  

              
              $.ajax({
                  url : "http://localhost:8090/cookblog/posts/insert",
                  type : "post",
                  data : formData,
                  cache: false,
                  processData : false,
                  contentType: false,
                  success : function(response) {
                	  if(response == 0){
                		  window.location.href = "http://localhost:8090/cookblog/user/login";
                	  }else{
                		  window.location.href = "http://localhost:8090/cookblog/posts/find/"+response;
                	  }
                	  
                  },
              });
        	  }
        	  

          })
          
          	//圖片預覽
            function photochange(event,imgid){   
                //img預覽
                let fr = new FileReader();
                fr.onload = function (e) {
                    $('#'+imgid.id+'').attr('src', e.target.result);
                };
                fr.readAsDataURL(event.target.files[0]);
            }
 	</script>
</body>


</html>