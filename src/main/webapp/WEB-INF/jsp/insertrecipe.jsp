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
    <title>Submit Recipe</title>
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
		.recipeImageUpload{
			object-fit:contain;
			height:125px;
			width:125px;
			border-radius:6px;
		}
		.insertcontainer{
			background-color:white;
			padding:30px;
			border-radius:10px;
			border: 1px solid #E0E0E0;
			box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
		}
		.wrongMessage{
			margin-left:30px;
			color:red;
		}
		.currectMessage{
			margin-left:30px;
			color:green;
		}
		.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/insertrecipe.jpg");
    		background-position: center;
            background-size: cover;}
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
                            <h1>Submit Recipe</h1>
                            <ul>
                                <li>
                                    <a href="${contextRoot}">Home</a>
                                </li>
                                <li>
                                    <a href="${contextRoot}/recipe/find/all">Recipes</a>
                                </li>
                                <li>Submit Recipe</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Inne Page Banner Area End Here -->
        <!-- Submit Recipe Area Start Here -->
        <section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50"  style="background-color:#F0F0F0">
            <div class="container">
                <div class="row gutters-60">
                	<div class="col-lg-2"></div>
                    <div class="col-lg-8 insertcontainer">
                        <form class="submit-recipe-form needs-validation" method="POST" action="recipe/insert" enctype="multipart/form-data" novalidate>
                            <div class="form-group" style="display: flex;justify-content: center;">
                                <label><img id="recipeImageUpload" src="${contextRoot}/recipe/upload.png" height="150px"/>
                                <input type="file" name="photo" onchange="photochange(event,recipeImageUpload)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                            </div>
                            <div class="form-group">
                                <label>????????????</label>
                                <input type="text" placeholder="?????????????????????..." class="form-control" name="title"
                                    data-error="Subject field is required" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label>????????????</label>
                                <select class="select2 tags form-control" name="tags" multiple="multiple"></select>
                            </div>
                            <div class="form-group">
                                <label>??????</label>
                                <textarea placeholder="?????????????????????..." class="textarea form-control" name="descript" id="form-message"
                                    rows="7" cols="20" data-error="Message field is required" required></textarea>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="additional-input-wrap">
                                <label>????????????</label>
                                <div class="row gutters-5">
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-left">
                                            <i class="far fa-clock"></i>
                                            <input type="number" placeholder="????????????????????????" class="form-control" name="time" min="1" required>
                                        </div>
                                        	
                                    </div>
                                    <div class="col-6">
                                       <div class="form-group additional-input-box icon-left">
                                            <i class="fas fa-utensils"></i>
                                            <input type="number" placeholder="??????????????????" min="1" class="form-control"
                                                name="people"  required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="additional-input-wrap">
                                    <label>??????</label>
                                    <div class="foodtable">
                                    <!-- ---------------------??????????????????--------------------- -->
                                    <div class="row no-gutters singlefood">
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-left">
                                                <i class="fas fa-arrows-alt"></i>
                                                <select class="select2 foods" name="foods"></select>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group additional-input-box icon-right">
                                                <input type="number" placeholder="??????????????????" class="form-control" id="insertfood" name="gram" min="1" required>
                                                <i class="fas fa-times removeFood"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------??????????????????--------------------- -->
                                    </div>
                                    <button type="button" class="btn-upload" id="addFood"><span class="typcn typcn-plus">&nbsp;</span>????????????</button>
                            </div>
                            <div class="additional-input-wrap">
                                <label>??????</label>
                                <div class="steptable" id="steptable">
                                    <!-- ---------------------??????????????????--------------------- -->
                                    <div class="row no-gutters singlestep">
                                        <div class="col-3">
                                            <div class="form-group additional-input-box icon-left" style="height: 150px;">
                                                <i class="fas fa-arrows-alt"></i>
                                                <label><img id="recipeImageUpload1" src="${contextRoot}/recipe/upload.png" class="recipeImageUpload"/>
                                                <input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload1)" accept=".png, .jpg, .jpeg" style="display:none;"/></label>
                                            </div>
                                        </div>
                                        <div class="col-9">
                                            <div class="form-group additional-input-box icon-right"  style="height: 150px;">
                                                <textarea name="stepDescript" cols="30" rows="4" placeholder="??????????????????" class="textarea form-control" id="insert" style="height:auto" required></textarea>
                                                <i class="fas fa-times removeStep"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ---------------------??????????????????--------------------- -->
                                </div>
                                    <button type="button" class="btn-upload" id="addStep"><span class="typcn typcn-plus">&nbsp;</span>????????????</button>
                            </div>
                            <button type="submit" class="btn-submit">????????????</button><span id="wrongMessage"></span><br>
                            <button type="button" class="btn-submit" onclick="quickInsert()">????????????</button>
                            <button type="button" class="btn-submit" onclick="quickInsert2()">????????????2</button>
                        </form>
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
    <!-- Summernote JS -->
    <script src="${contextRoot}/js/summernote.min.js"></script>
    <!-- Select 2 Js -->
    <script src="${contextRoot}/js/select2.full.min.js"></script>
    <!-- Smoothscroll Js -->
    <script src="${contextRoot}/js/smoothscroll.min.js"></script>
    <!-- Sortable Js -->
    <script src="${contextRoot}/js/Sortable.min.js"></script>
    <!-- Custom Js -->
    <script src="${contextRoot}/js/main.js"></script>
    <script>

        //???????????????
            var foodSettings = {
                "url": "http://localhost:8090/cookblog/find/foods/all",
                "method": "GET",
                "timeout": 0,
            };

            var foodList = '';
                $.ajax(foodSettings).done(function (response) {
                for(i in response){
                    foodList += '<option value="'+ response[i].foodsName +'">'+ response[i].foodsName +'</option>';
                }
                $(".foods").append(foodList);
                });

            function selectRefresh() {
                $('.foods').select2({
                    theme: 'classic',
                    dropdownAutoWidth: true,
                    width: '100%',
                });
            }

            //??????????????????
            var insertfood = 1;
            $("#addFood").click(function(){
                var addfoods = '<div class="row no-gutters singlefood">'
                              +'<div class="col-6">'
                              +'<div class="form-group additional-input-box icon-left">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<select class="select2 foods" name="foods">'+foodList+'</select>'
                              +'</div></div>'
                              +'<div class="col-6">'
                              +'<div class="form-group additional-input-box icon-right">'
                              +'<input type="number" placeholder="??????????????????" class="form-control" id="insertfood'+insertfood+'" name="gram" required>'
                              +'<i class="fas fa-times removeFood"></i>'
                              +'</div></div></div>'
                $(".foodtable").append(addfoods);
                selectRefresh();
                insertfood++;
            })

            //????????????
            $(".foodtable").click(function(e){
                let removeBTN = $(e.target)
                if(removeBTN.hasClass("removeFood")){
                    removeBTN.parents(".singlefood").remove();
                }
            })


            //??????????????????
            var count = 2;
            var insert = 1;
            $("#addStep").click(function(){
                var addsteps = '<div class="row no-gutters singlestep">'
                              +'<div class="col-3">'
                              +'<div class="form-group additional-input-box icon-left" style="height: 150px;">'
                              +'<i class="fas fa-arrows-alt"></i>'
                              +'<label><img id="recipeImageUpload'+count+'" src="${contextRoot}/recipe/upload.png" class="recipeImageUpload"/>'
                              +'<input type="file" name="stepPhoto" onchange="photochange(event,recipeImageUpload'+count+')" accept=".png, .jpg, .jpeg" style="display:none;"/></label>'
                              +'</div></div>'
                              +'<div class="col-9">'
                              +'<div class="form-group additional-input-box icon-right"  style="height: 150px;">'
                              +'<textarea name="stepDescript" cols="30" rows="4" placeholder="??????????????????" id="insert'+insert+'" class="textarea form-control" style="height:auto" required></textarea>'
                              +'<i class="fas fa-times removeStep"></i>'
                              +'</div></div></div>'

                $(".steptable").append(addsteps);
                count++;
                insert++;
            })

            //????????????
            $(".steptable").click(function(e){
                let removeBTN = $(e.target)
                if(removeBTN.hasClass("removeStep")){
                    removeBTN.parents(".singlestep").remove();
                }
            })

            

            //????????????
            //?????????????????????(???????????????)
            
            function photochange(event,imgid){   
                //img??????
                let fr = new FileReader();
                fr.onload = function (e) {
                    $('#'+imgid.id+'').attr('src', e.target.result);
                };
                fr.readAsDataURL(event.target.files[0]);
            }

            //??????KeywordList
            var keywordSettings = {
                "url": "http://localhost:8090/cookblog/find/keyword/all",
                "method": "GET",
                "timeout": 0,
            };
            $.ajax(keywordSettings).done(function (response) {
                var keywordList = '';
                for(i in response){
                    keywordList += '<option value="'+ response[i].keyword +'">'+ response[i].keyword +'</option>';
                }
                $(".tags").append(keywordList);
                $(".tags").select2({
                    theme: 'classic',
                    dropdownAutoWidth: true,
                    width: '100%'
                });
            });

              // ??????
              (function() {
            	  'use strict';
            	  window.addEventListener('load', function() {
            	    var forms = document.getElementsByClassName('needs-validation');
            	    var validation = Array.prototype.filter.call(forms, function(form) {
            	      // ???????????????
            	      form.addEventListener('submit', function(event) {
            	        if (form.checkValidity() === false) {
            	          event.preventDefault();
            	          event.stopPropagation();
            	          $("#wrongMessage").html("").append("<span class='typcn typcn-warning-outline' style='font-size:25px;'>&nbsp;</span>????????????????????????")
						  $("#wrongMessage").removeClass("currectMessage").addClass("wrongMessage")
            	        }
            	        form.classList.add('was-validated');
            	      }, false);
            	      
            	      // ????????????????????????
            	      form.addEventListener('change', function(event) {
              	        if (form.checkValidity() === true) {
              	          $("#wrongMessage").html("").append("<span class='typcn typcn-tick-outline' style='font-size:25px;'></span>")
						  $("#wrongMessage").removeClass("wrongMessage").addClass("currectMessage")
              	        }
              	      }, false);
            	      
            	      form.addEventListener('input', function(event) {
                	        if (form.checkValidity() === true) {
                	          $("#wrongMessage").html("").append("<span class='typcn typcn-tick-outline' style='font-size:25px;'></span>")
  						  $("#wrongMessage").removeClass("wrongMessage").addClass("currectMessage")
                	        }
                	      }, false);
            	      
            	    });
            	  }, false);
            	})();
              
              		
            
            // ???????????????????????????
            $("input[type='number']").change(function(){
            	console.log($(this).val());
            	if($(this).val() <= 0){
            		$(this).val(1);
            	}
            });
            
            // ????????????
            new Sortable(steptable, {
                handle: '.singlestep',
                animation: 150
            });
            
            function quickInsert(){
            	$("input[name='title']").val("????????????");
            	$("textarea[name='descript']").val("?????????????????????");
            	$("input[name='time']").val("30");
            	$("input[name='people']").val("3");
            	$("#insertfood").val("150");
            	$("#insertfood1").val("300");
            	$("#insertfood2").val("30");
            	$("#insert").val("?????????????????????????????????????????????????????????????????????????????????????????????????????????");
            	$("#insert1").val("???????????????????????????185???30?????????");
            	$("#insert2").val("????????????????????????????????????????????????????????????????????????");
            	$("#insert3").val("?????????");
            	$("#wrongMessage").html("").append("<span class='typcn typcn-tick-outline' style='font-size:25px;'></span>")
            	 $("#wrongMessage").removeClass("wrongMessage").addClass("currectMessage")
            }
            
            
            function quickInsert2(){
            	$("input[name='title']").val("[???????????????]??????????????????");
            	$("textarea[name='descript']").val("????????????????????????????????????????????????????????????www.xxxxgov.com");
            	$("input[name='time']").val("30");
            	$("input[name='people']").val("3");
            	$("#insertfood").val("150");
            	$("#insertfood1").val("300");
            	$("#insertfood2").val("30");
            	$("#insert").val("?????????");
            	$("#insert1").val("?????????????????????????????????????????????");
            	$("#insert2").val("???????????????????????????????????????????????????????????????");
            	$("#insert3").val("???????????????????????????????????????????????????????????????????????????????????????????????????");
            	$("#wrongMessage").html("").append("<span class='typcn typcn-tick-outline' style='font-size:25px;'></span>")
            	 $("#wrongMessage").removeClass("wrongMessage").addClass("currectMessage")
            }
    </script>
</body>


</html>