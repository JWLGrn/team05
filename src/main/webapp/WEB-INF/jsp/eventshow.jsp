<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>Campaigns</title>
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
<!-- Flaticon CSS 
<link rel="stylesheet" href="${contextRoot}/css/flaticon.css">-->
<!-- Summernote CSS 
<link rel="stylesheet" href="${contextRoot}/css/summernote.css">-->
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">

<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
<style type="text/css">
.eventimg {
	width: 300px;
	height: 200px;
}
.insertdiv{
 	background-color:#fdf1f1;
 	padding:50pt;
 	box-shadow: 0px 0px 10px  rgba(200, 200, 200, 0.8);
}
.circle {
	 border-radius:60%;
}
.aligncenter{
    justify-content: center;
}
.imgcenter {
	display: flex;
	justify-content: center;
	align-items: center;
	opacity: 0.7;
	object-fit: contain;
}
.imgcenter:hover {	   
     opacity: 1;
     transform: scale(1.1);
}
.submitbtn{
	color:white;
	background-color:  #ff4a51;
	border: white;
	padding: 10pt 20pt 10pt 20pt;
	font-weight:bold;
	margin-bottom: 40pt;
	margin-left:10pt;
	box-shadow: 0px 0px 5px  rgba(255,80,87, 0.8);
}
.submitbtn:hover{
	background-color:  #e92731;	
}
.test {
	border-width: 9px;
	border-style: solid;
	border-color: blue;
}
.choiceimg{
	width: 1000px;
}
.my-description {
    text-align: center;
    color: #444444;
    font-size: 17px;
}
.padding_50{
	padding-left:50pt;
}
.color_red{
  color: #ff5057;
}
.color_yellow{
 color: #fdb401;
}
.color_white{
	color: white;
}
.title_h1{
   font-weight:bold;
   font-size: 36px;
   color:red;
}
.padding_top_50{
	padding-top: 80pt;
}
.padding_but_50{
    padding-bottom: 80pt;
}
.recipediv{
	padding:80pt;
}
a{
    cursor: pointer; 
}
.inner-page-banner:before {
    		background: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, .45)),url("${contextRoot}/banner/showeventbanner.jpg");
    		background-position: center;
            background-size: cover;
		}

</style>
<style>
</style>
</head>
<body>
	<!-- Preloader Start Here -->
	<div id="preloader"></div>
	<!-- Preloader End Here -->
	<!-- ScrollUp Start Here -->
	<a href="#wrapper" data-type="section-switch" class="scrollup"> <i
		class="fas fa-angle-double-up"></i>
	</a>
	<!-- ScrollUp End Here -->
	<div id="wrapper" class="wrapper">
		<!-- Header Area Start Here -->
		<jsp:include page="../jsp/layout/navbar.jsp" />
		<!-- Header Area End Here -->
		<!-- Inne Page Banner Area Start Here -->
		<section class="inner-page-banner bg-common"
			data-bg-image="/img/figure/inner-page-banner1.jpg">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="breadcrumbs-area">
							<h1>Campaigns</h1>
							<ul>
							<li>
                                <a href="${contextRoot}">Home</a>
                                </li>
                                <li>Event</li>
								<li>Campaigns</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Recipe Without Sidebar Area Start Here -->
<!-- ????????????	-> ??????	 -->
<section class="recipe-without-sidebar-wrap padding-top-80 padding-bottom-22">
		<div class="container">
		    <div class="row" id="showevent"></div>
		</div>	
</section>	
<!-- ?????????????????? -->
<section class="row aligncenter">
    <div id="oneevent_out" class="recipe-without-sidebar-wrap padding-top-80 padding-bottom-22">
      <div class="row gutters-40"> 
                     <div class="col-lg-9"> 
                        <div class="row gutters-40 ">
                            <div class="col-12">
                               <div class="product-box-layout4" id="oneevent">
                               </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     </div>
 </section> 
<!-- ???????????? --> 
<section id="insertevent" class="submit-recipe-page-wrap padding-top-74 padding-bottom-50 ">
            <div class="container" id="showmyRecipe">
                <div class="row gutters-60 recipediv ranna-box-style ">
                    <div class="col-lg-8"> 
                    	<div class="section-heading heading-dark">
                                <h2 class="item-heading">MY RECIPES LIST</h2>
                        </div>
                        <div id="myRecipe">
                       111
                        </div>  
                    </div>
                </div>
             </div>
</section>

<!-- ???????????????     -->
<section class="padding-bottom-45">
            <div class="container" id="showparticipate">
                <div class="section-heading heading-dark">
                    <h2 class="item-heading">Participant</h2>
                </div>
                <div class="row" id="participatelist">
                    
                </div>
            </div>
 </section>



		<!-- Recipe Without Sidebar Area End Here -->
		<!-- Footer Area Start Here -->
		<footer class="ranna-bg-dark ">
			<div class="container ">
				<div class="footer-logo ">
					<a href="${contextRoot}"><img src="${contextRoot}/image/img/logo-light.png" alt="footer-logo"></a>
				</div>

			</div>
		</footer>

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
		<!-- Summernote JS 
		<script src="${contextRoot}/js/summernote.min.js"></script>-->
		<!-- Select 2 Js -->
		<script src="${contextRoot}/js/select2.full.min.js"></script>       
        <script src="${contextRoot}/js/main.js"></script>
        <!-- sweetalert -->
		<script src="${contextRoot}/js/sweetalert2.all.min.js"></script>

<!-- JAVA???SCRIPT------------------------------------------------ -->
<script type="text/javascript">
//????????????
let fileDataURL;
//--------------------------------------------?????????
 


//---------------------------------------------?????????
 $(document).ready(function() {//????????????,??????????????????
	 //??????
	 $("#showevent").show();
	 showAllEvent();
	 $("#oneevent_out").hide();
	// participate(eventId)
	$("#showmyRecipe").hide();
	// showMyRecipe(eventId);
	 $("#showparticipate").hide();	 	 
 });
//????????????
 function showoneevent(eventId){
	//??????
	$("#showevent").hide();
	$("#oneevent_out").show();//?????????????????????
	participate(eventId)
	$("#showmyRecipe").show();//????????????
	showMyRecipe(eventId);	
	$("#showparticipate").hide();
 }
 //??????????????????showparticipate()
 function showparticipate(eventId){
	//??????
		$("#showevent").hide();
		$("#oneevent_out").show();//?????????????????????
		participate(eventId);
		$("#showmyRecipe").hide();//????????????
		$("#showparticipate").show();//???????????????
		participatelist(eventId);
 }
//--------------------event?????????------------------->  
function showAllEvent() {
	var settings = {
					"url" : "http://localhost:8090/cookblog/event/showevent",
					"method" : "GET",
					"timeout" : 0,
	};
	$.ajax(settings).done(function(response) {
			var replydata = "";
			$.each(response,function(index, value) {	
				replydata += '<div class="col-lg-4 col-md-6 col-sm-6 col-12" class="test">'
					+ '<div class="product-box-layout1" >'
					+ '<figure class="imgcenter">'
					+ '<img src="${contextRoot}/image/event/'+value.eventPhoto+'" class="eventimg">'
					+ '</figure>'
					+ '<div class="item-content">'
					+ '<h3 class="item-title">'
					+ value.eventTitle											
					+ '</h3><p >'+ value.eventContext
					+ '</p><p class="fas fa-clock color_yellow">????????????:'+ value.timeStart+ '~'+ value.timeEnd
					+ '</p><ul class="entry-meta">'
			  	let a=eventtime(value.timeStart,value.timeEnd);
				
				if(a==0){
					replydata += '<li><a onclick="showoneevent('+ value.eventId+ ')"><i class="fas fa-users">????????????</i></a></li>';
				}
				if(a==1){
					replydata += '<li><i class="fas fa-users">????????????</i></li>';
				}
				if(a==2){
					replydata += '<li><i class="fas fa-users">??????????????????</i></li>';
				}
				replydata += '</ul></div></div></div>';
				
			})				
            $("#showevent").html(replydata);
			});
}
function eventtime(timestart,timeend){
console.log(timestart+"-"+timeend);
 	let result=0;
 //??????????????????
  	let now=new Date();
	let year=now.getFullYear();
	let month=now.getMonth()+1;
	let date=now.getDate();
	
 //??????????????????
    let start = new Date(timestart);
    let end = new Date(timeend);
    console.log(end<now);
    if((start>now)==true){
    	result=2;
    }
    if((end<now)==true){
    	result=1;
    }
	return  result;
}
//--------------------????????????-------------------> 
//???????????????   ??????????????????
function participate(eventId){
	
		var replyjson=JSON.stringify(eventId);
		$.ajax({
			url:"${contextRoot}/event/choice",
			contentType:'application/json',//??????????????????
			dataType:'json',//??????????????????
			method:'post',
			data:replyjson,
			success:function(result){						
			 	var replydata="";
			  	replydata+='<section class="all-recipes-page-wrap">'
			  		+'<div class="about-box"><div class="about-figure">'
			  		+'<img src="${contextRoot}/image/event/'+result.eventPhoto+'" alt="About" class="choiceimg"></div>'
			  		+'<h2 class="about-title title-bar bar-center">'+result.eventTitle+'</h2>'
			 		+'<p class="my-description"><i class="fas fa-star color_yellow"></i>'+result.eventContext+'<br/>'
			 		+'<i class="fas fa-clock color_red"></i>????????????:'+result.timeStart+'~'
			 		+'????????????:'+result.timeEnd+'</p>'
			 		+'</div></div></div></div>'	
			 		+'</div></section>'
			 	    +'<button onclick="rechoice()" class="submitbtn">????????????</button>'
                    +'<button onclick="showoneevent('+result.eventId+')" class="submitbtn">????????????</button>'
                    +'<button onclick="showparticipate('+result.eventId+')" class="submitbtn">?????????????????????</button>'
			  	 $("#oneevent").html(replydata);
			 },error:function(err){
			 	console.log(err);
		}
    });
}
//???????????? 
function showMyRecipe(eventId){
	
			let count=0;
			var settings = {
				    "url": "http://localhost:8090/cookblog/event/showrecipe",
				    "method": "GET",
				   	"timeout": 0,
			};
			$.ajax(settings).done(function (response) {
			var replydata="";

			$.each(response,function(index,value){
				count++;
				checkjoin(eventId,value.recipeId,count);
				replydata+='<div class="row gutters-40" >'
								+'<div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">'
								+'<div class="product-box-layout6">'
								+'<div class="item-figure">'						
								+'<img src="${contextRoot}/image/recipe/'+value.cookPhoto+'" class="eventimg" alt="Product">'
								+'</div><div class="item-content" id="canceladdbtn_'+count+'">'
								+'<input type="checkbox" name="choicerecipe" value="'+value.recipeId+'"/>'
								+'<h3 class="item-title"><a href="${contextRoot}/recipe/find/'+value.recipeId+'">'+value.recipeId+"_"+value.cookTitle+'</a></h3>'
								+'<p><i class="fas fa-utensils color_yellow"></i>'+value.cookDescription+'</p>'
								+'<p><i class="fas fa-clock color_red"></i>'+value.cookTime+'??????</p>'
        						+'<ul class="entry-meta remove-3rd-child-lg">'
        						+'</ul></div></div></div></div>'                                       
				})
					replydata+="<button onclick='checkchoice("+eventId+")' class='submitbtn'>??????</button>";
					$("#myRecipe").html(replydata);			
				});	
}
//??????????????????????????????
function rechoice(){
	 $(location).prop("href", "http://localhost:8090/cookblog/showevent");
}
//--------------------??????????????????-------------------> 
//???????????????????????????????????????
function checkchoice(eventId){
	var str=eventId;
	var nodes=document.getElementsByName('choicerecipe');
	for(let i=0;i<nodes.length;i++){
			if(nodes[i].checked){
					str+="-"+nodes[i].value;
			}
	}
	var replyjson=JSON.stringify(str);
	$.ajax({
		url:"${contextRoot}/event/participate",
		contentType:'application/json',//??????????????????
		dataType:'json',//??????????????????
		method:'post',
		data:replyjson,
		success:function(result){						
	
		},
		error:function(err){
				 console.log(err);
		}
	});
   // $(location).prop("href", "http://localhost:8090/cookblog/showevent");
	showoneevent(eventId)
}
//?????????????????????
function checkjoin(eventId,recipeId,count){
				let obj={
						eventId:eventId,
						recipeId:recipeId
				}
			  	var replyjson=JSON.stringify(obj);
			  	 $.ajax({
				 	url:"${contextRoot}/event/participatecheck",
			 	 	contentType:'application/json',//??????????????????
			  	 	dataType:'json',//??????????????????
			  	 	method:'post',
			  	 	data:replyjson,
			  	 	success:function(result){		
						
						if(result==true){
							console.log(count);
							$("input[value='"+recipeId+"']").hide();
							$("#canceladdbtn_"+count).append('<div onclick="canceljoin('+recipeId+','+eventId+')"><i class="fas fa-users"></i>????????????</div>');
						}
			  	 	},
			  	 	error:function(err){
			  	 		console.log(err);
			  	 	}
 			  	});
}
//????????????
function canceljoin(recipeId,eventId){
	 Swal.fire({
		  title: '??????',
		  text: '?????????????????????????',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '??????!',
		  cancelButtonText: '??????!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		    	title: '??????',
	    	    text: "????????????",
	    	    icon: 'success',
	    	    confirmButtonText: '??????'
		    }).then((success) => {
		    	if (success.isConfirmed) {
		    		let data1=recipeId+","+eventId;
 				var replyjson=JSON.stringify(data1);
 				$.ajax({
 				 	url:"${contextRoot}/event/joindelete",
 				 	contentType:'application/json',//??????????????????
  		 		 	dataType:'json',//??????????????????
 				 	method:'post',
 		 		 	data:replyjson,
 		 		 	success:function(result){			
 				 	
 				 },
 				 	error:function(err){
 		 			console.log(err);
 		 		 }
 				 
 			});
 			showoneevent(eventId);
		  }
		    	})
		    }
		    
		})
		 
}
//--------------------????????????-------------------> 
//???????????????
function participatelist(eventId){
		var settings = {
	        "url": "${contextRoot}/campaign/list/"+eventId,
	    	"method": "GET",
	   		"timeout": 0,
	    };
		$.ajax(settings).done(function (response) {
			var replydata="";
			$.each(response,function(index,value){
				replydata+=
					'<div class="col-lg-4 col-md-6 col-sm-12 col-12">'
					+'<div class="product-box-layout2" onclick="imglink('+value.recipeId+')">'
					+'<figure class="item-figure">'
					+'<img src="${contextRoot}/image/recipe/'+value.cookPhoto+'"alt="Product" ></figure>'
					+'<div class="item-content">'
					+'<h3 class="item-title color_white">'+value.cookTitle+'</h3>'
					+'<ul class="entry-meta">'
					+'<li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>'
					+'<li><a href="#"><i class="fas fa-user"></i>by '+value.userName+'</a></li>'
					+'<li><a href="#"><i class="fas fa-heart"></i>'+value.favoritenum+' Likes</a></li>'
					+'</ul></div></div></div>';
		
			})
			$("#participatelist").html(replydata);
		});	
   
}
function imglink(recipeId){
	$(location).prop("href", "http://localhost:8090/cookblog/recipe/find/"+recipeId);
}
</script>
</body>
</html>