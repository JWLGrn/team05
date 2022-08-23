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
	width: 200x;
	height: 200px;
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
							<h1>Welcome to I Cook</h1>
							<ul>
								<li><a href="index.html">Home</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Recipe Without Sidebar Area Start Here -->
		<section
			class="recipe-without-sidebar-wrap padding-top-80 padding-bottom-22">
			<div class="container">
<!-- 顯示活動	-> 選擇	 -->
		<div class="row" id="showevent">
				
		</div>
<!-- 新增活動 -->
		  <div id="insertevent">			
			<section class="submit-recipe-page-wrap padding-top-74 padding-bottom-50">
            <div class="container">
                <div class="row gutters-60">
                    <div class="col-lg-8">
                        <form class="submit-recipe-form">
                            <div class="form-group">
                                <label><h1>活動新增</h1></label>
                                <input type="hidden" id="eventId" ><br />
                                <label>活動標題</label>
                                <input type="text" id="eventTitle" placeholder="Recipe Name" class="form-control" name="name"
                                    data-error="Subject field is required" required>
                                <span class="check" id="checkTitle"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label>活動內容</label>
                                <textarea placeholder="Type your text" class="textarea form-control" name="message" id="eventContext"
                                    rows="7" cols="20" data-error="Message field is required" required></textarea>
                                 <span class="check" id="checkContext"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                            
                            <div class="additional-input-wrap">
                                <label>圖片</label>
                                <div class="form-group">
                                   <label id="fileload">
                                    <ul class="upload-img">
                                        <li><img src="img/figure/upload-banner1.jpg" id="imgView" alt="Upload Image" class="eventimg"></li>
                                    </ul>
                                      <input type="file" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display: none;" onchange="imgview(event,imgView)" >
                                      <i class="fas fa-cloud-upload-alt"></i>UPLOAD
                                    </label>
                                </div>
                            </div>
                            <div class="additional-input-wrap">
                                <label>活動時間</label>
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-left">
                                            <i class="fas fa-arrows-alt"></i>
                                            <input type="date" id="timeStart" class="form-control" name="name">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-right">
                                            <input  type="date" id="timeEnd" class="form-control"
                                                name="name">
                                            <i class="fas fa-times"></i>
                                        </div>
                                    </div>
                                    <span class="check" id="checkTime"></span>
                                 </div>
                            </div>
							<button id="createbtn" class="submitbtn">建立活動</button>
                            <div onclick="hotkey()" style="color: red;">快捷鍵</div>
                        </form>
                    </div>

                </div>
            </div>
        </section>
       </div>
       			 		
       
        <!-- Submit Recipe Area End Here -->
<!-- 選定參加活動 -->
  <div class="row" id="oneevent_out"></div>
     <div class="row gutters-40">
                    <div class="col-lg-8">
                        <div class="row gutters-40">
                            <div class="col-12">
                               <div class="product-box-layout4" id="oneevent">
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       <button onclick="rechoice()" class="submitbtn">重新選擇</button>
  </div>
<!-- 顯示食譜 --> 
<section class="padding-bottom-45" >
                <div class="row gutters-40">
                    <div class="col-lg-8">
                        <div class="ranna-box-style" id="myRecipe">
                            <div class="section-heading heading-dark">
                                <h2 class="item-heading">RECIPES LIST</h2>
                            </div>
                                                        
                        </div>
                    </div>
             </div>                   
</section>
<!-- 顯示食譜 -->     

 

		<!-- Recipe Without Sidebar Area End Here -->
		<!-- Footer Area Start Here -->
		<footer class="ranna-bg-dark">
			<div class="container">
				<div class="footer-logo">
					<a href="index.html"><img src="img/logo-light.png"
						class="img-fluid" alt="footer-logo"></a>
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

		<!-- Custom Js -->
<script src="${contextRoot}/js/main.js"></script>

<script type="text/javascript">
let fileDataURL;
//測試用
$(document).ready(function() {
	//showAllEvent();
	$("#insertevent").hide();
	//$("#oneevent_out").show();
	//participate(9);
	$("#myRecipe").show();
	showMyRecipe(2);
});
//測試期間關閉
// $(document).ready(function() {
// 		//顯示活動
// 		showAllEvent();
// 		$("#insertevent").hide();
// 		//預設開始時間 結束時間
// 		dateSet();				
// });
//顯示活動  管理員:crud,一般使用者:參加活動

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
					+ '</p><p class="fas fa-clock">活動時間:'+ value.timeStart+ '~'+ value.timeEnd
					+ '</p><ul class="entry-meta">'
					//if(${userId}==1){								
				replydata += '<li><a onclick="updateevent('+ value.eventId+')"><i class="fas fa-user">修改</i></a></li>';
				replydata += '<li><a onclick="del('+ value.eventId+ ')"><i class="fas fa-user">刪除</i></a></li>';
                 //}	
				replydata += '<li><a onclick="participate('+ value.eventId+ ')"><i class="fas fa-user">參加活動</i></a></li>';
				replydata += '</ul></div></div></div>';

			})	
			replydata +='<div><a onclick="addevent(1)"><i class="submitbtn">新增活動</i></a></div>';
            $("#showevent").html(replydata);
			});
}
//新增
 function addevent(){
 	$("#insertevent").show();
 	$("#showevent").hide();
 	$("#createbtn").hide();
 	$("#eventId").val("1");
 }
//初始時間設定
function dateSet(){
		let now=new Date();
		let month=now.getMonth()+1;
		let date=now.getDate();
		let dateend=now.getDate()+1;
		if(month<10){month="0"+month}
		if(date<10){date="0"+date}
		if(dateend<10){dateend="0"+dateend}
		timeStart.value=now.getFullYear()+"-"+month+"-"+date;
		timeEnd.value=now.getFullYear()+"-"+month+"-"+dateend;
		//最大值最小值
		timeStart.min=now.getFullYear()+"-"+month+"-"+date;
		timeEnd.min=now.getFullYear()+"-"+month+"-"+dateend;
}
 //圖片顯示用(跟步驟一樣)+抓url
function imgview(event,imgid){   
 		const fr = new FileReader();
 		//抓url
 		let fPhoto=document.getElementById("eventPhoto").files;
 		if(fPhoto.length>0){//有圖
 			let fileToLoad=fPhoto[0];//取得檔案詳細資料
 			fr.onload = function (e) {
 			    	fileDataURL=e.target.result
 					$('#'+imgid.id+'').attr('src', fileDataURL);//img預覽
 		};
 			fr.readAsDataURL(event.target.files[0]);//img預覽
 	}
}
// //顯示食譜
 
			function showMyRecipe(eventId){
				var settings = {
				        "url": "http://localhost:8090/cookblog/event/showrecipe",
				    	"method": "GET",
				   		"timeout": 0,
				    };
					$.ajax(settings).done(function (response) {
						var replydata="<h3>我的食譜</h3>";
						
						$.each(response,function(index,value){
							checkjoin(eventId,value.recipeId);
							replydata+='<input type="checkbox" name="choicerecipe" value="'+value.recipeId+'"/>';
							replydata+='<div class="row gutters-40">'
								+'<div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12">'
								+'<div class="product-box-layout6">'
								+'<div class="item-figure">'
								+'<img src="${contextRoot}/image/recipe/'+value.cookPhoto+'" class="eventimg" alt="Product">'
								+'</div><div class="item-content">'
								+'<h3 class="item-title"><a href="single-recipe1.html">'+value.recipeId+'_'+value.cookTitle+'</a></h3>'
								+'<p>'+value.cookDescription+'</p>'
        						+'<ul class="entry-meta remove-3rd-child-lg">'
        						+'</ul></div></div></div></div>'
//                                             <li><a href="#"><i class="fas fa-clock"></i>15 Mins</a></li>
//                                             <li><a href="#"><i class="fas fa-user"></i>by <span>John Martin</span></a></li>
//                                             <li><a href="#"><i class="fas fa-heart"></i><span>02</span> Likes</a></li>
						})
						replydata+="<button onclick='checkchoice("+eventId+")'>送出</button>";
						$("#myRecipe").html(replydata);			
					});	
			}

 //輸入檢查--------------------------------------------

			//eventTitle_20字(實際上限中文25字)
			$("#eventTitle").blur(function(){
				str=eventTitle.value;
				if(str.length<1||str.length>21){
					$("#checkTitle").text('自數限定1~20');
					$("#eventTitle").val("");
				}else{
					$("#checkTitle").text("");
				}
			});
			//eventContext_200字(實際上限max)
			$("#eventContext").blur(function(){
				str=eventContext.value;
				if(str.length<1||str.length>200){
					$("#checkContext").text('自數限定1~200');
					$("#createbtn").hide();
				}else{
					$("#checkContext").text("");
					$("#createbtn").show();
				}
			});
			$("#timeStart").blur(function(){
				//取現在時間
				let now=new Date();
				let year=now.getFullYear();
				let month=now.getMonth()+1;
				let date=now.getDate();
				//取輸入時間
				let inputtime=$("#timeStart").val();
				let tarr=inputtime.split("-");
				function reset(){
					if(month<10){month="0"+month}
					if(date<10){date="0"+date}
					timeStart.value=year+"-"+month+"-"+date;
				}
				if(tarr[0]<year){
					$("#checkTime").text("開始時間不可小於今天");
					reset();
				}else{
					if(tarr[1]<month){
						$("#checkTime").text("開始時間不可小於今天");
						reset();
					}else{
						if(tarr[2]<date){
							$("#checkTime").text("開始時間不可小於今天");
							reset();
						}else{
							$("#checkTime").text("");
						}
					}
				}	
			});
			$("#timeEnd").blur(function(){
				//取開始時間
				let starttime=$("#timeStart").val();
				let starr=starttime.split("-");
				//取輸入時間
				let inputtime=$("#timeEnd").val();
				let tarr=inputtime.split("-"); 
				let date_num=parseInt(starr[2])+1;
				
			 	function reset(){
			 		if(date_num<10){date_num="0"+date_num}
			 		$("#timeEnd").val(starr[0]+"-"+starr[1]+"-"+date_num);
				}
				if(tarr[0]<starr[0]||tarr[0]>(parseInt(starr[0])+1)){//年
					$("#checkTime").text("結束時間不可小於開始時間,也不能超過一年");
					reset();
				}else{
					if(tarr[1]<starr[1]){//月
						$("#checkTime").text("結束時間不可小於開始時間");
						reset();
					}else{
						if(tarr[2]<date_num){//日
							$("#checkTime").text("結束時間不可小於開始時間");
							reset();
						}else{
							$("#checkTime").text("");
						}
					}
				}	
			});
//輸入檢查--------------------------------------------
//快捷鍵
			function hotkey(){
				$("#eventTitle").val("秋季美食");
				$("#eventContext").text("募集專屬秋天的美食!");
				$("#timeStart").val("2022-10-01");
				$("#timeEnd").val("2022-10-31");
				$("#createbtn").show();
				$("#checkTitle").text("");
				$("#checkContext").text("");
			}
			
// //功能-------------------------------------------------------
//新增活動
$("#createbtn").click(function(){
				$("#showevent").show();
				$("#insertevent").hide();
				var eventId=$("#eventId").val();
				var eventTitle=$("#eventTitle").val();
				var eventContext=$("#eventContext").val();
				var timeStart=$("#timeStart").val();
				var timeEnd=$("#timeEnd").val();
				var eventPhoto=$("#eventPhoto").val();
				console.log(eventId);
				var event={
						   eventId:eventId,
						   eventTitle:eventTitle,
						   eventContext:eventContext,
						   timeStart:timeStart,
						   timeEnd:timeEnd,
						   eventPhoto:fileDataURL	
				}
				var replyjson=JSON.stringify(event);	
				
				    $.ajax({
					url:"${contextRoot}/event/insert",
					contentType:'application/json',//送出資料型態
					dataType:'json',//回傳資料型態
					method:'post',
					data:replyjson,
					success:function(result){	
						var replydata="";
			 			$.each(result,function(index,value){
			 				replydata += '<div class="col-lg-4 col-md-6 col-sm-6 col-12" class="test">'
								+ '<div class="product-box-layout1" class="test">'
								+ '<figure class="item-figure imgcenter">'
								+ '<img src="${contextRoot}/image/event/'+value.eventPhoto+'" class="eventimg">'
								+ '</figure>'
								+ '<div class="item-content ">'
								+ '<h3 class="item-title">'
								+ '<a href="single-recipe1.html">'+ value.eventTitle											
								+ '</a></h3><p >'+ value.eventContext
								+ '</p><p class="fas fa-clock">活動時間:'+ value.timeStart+ '~'+ value.timeEnd
								+ '</p><ul class="entry-meta">'
								//if(${userId}==1){
						replydata += '<li><a onclick="addevent()"><i class="fas fa-user">新增</i></a></li>';
						replydata += '<li><a onclick="updateevent('+ value.eventId+')"><i class="fas fa-user">修改</i></a></li>';
						replydata += '<li><a onclick="del('+ value.eventId+ ')"><i class="fas fa-user">刪除</i></a></li>';
		                 //}	
						replydata += '<li><a onclick="participate('+ value.eventId+ ')"><i class="fas fa-user">參加活動</i></a></li>';
						replydata += '</ul></div></div></div>';

					 })
                      $("#showevent").html(replydata);
	                 
			 			//清空資料
			 			$("#eventId").val("");
						$("#eventTitle").val("");
						$("#eventContext").val("");
						$("#imgView").attr("src","${contextRoot}/image/step/file.jpg");
						$("#timeStart").val("");
						$("#timeEnd").val("");
						document.getElementById("eventPhoto").remove();
						$("#fileload").append('<input type="file" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)">');
					},
					error:function(err){
						console.log(err);
					}
			    });
});
//修改活動
function updateevent(eventId){
	    $("#insertevent").show();
	    $("#showevent").hide();
		var replyjson=JSON.stringify(eventId);
		$.ajax({
			url:"${contextRoot}/event/update",
			contentType:'application/json',//送出資料型態
			dataType:'json',//回傳資料型態
			method:'post',
			data:replyjson,
			success:function(result){			
				$("#eventId").val(result.eventId);
				$("#eventTitle").val(result.eventTitle);
				$("#eventContext").val(result.eventContext);
				$("#imgView").attr("src","${contextRoot}/image/event/"+result.eventPhoto);
				$("#timeStart").val(result.timeStart);
				$("#timeEnd").val(result.timeEnd);
				},
			error:function(err){
					console.log(err);
			}
	});
}
//刪除
	function del(eventId){
		var r = confirm("您確定要刪除嗎?");
		if (r == true) {
			 console.log("del");
			 alert('刪除成功');
		var replyjson=JSON.stringify(eventId);
		$.ajax({
			 url:"${contextRoot}/event/delete",
			 contentType:'application/json',//送出資料型態
			 dataType:'json',//回傳資料型態
			 method:'post',
			 data:replyjson,
			 success:function(result){			
					alert('刪除成功');
			 },
			 error:function(err){
			 console.log(err);
			 		}
			 	});
			}
				 $(location).prop("href", "http://localhost:8090/cookblog/showevent");
}

//參加活動紐   顯示選擇活動
function participate(eventId){
		var replyjson=JSON.stringify(eventId);
		$.ajax({
			url:"${contextRoot}/event/update",
			contentType:'application/json',//送出資料型態
			dataType:'json',//回傳資料型態
			method:'post',
			data:replyjson,
			success:function(result){						
			 	var replydata="";
			  	replydata+='<section class="all-recipes-page-wrap">'
			  		+'<div class="about-box"><div class="about-figure">'
			  		+'<img src="${contextRoot}/image/event/'+result.eventPhoto+'" alt="About" class="choiceimg"></div>'
			  		+'<h2 class="about-title title-bar bar-center">'+result.eventTitle+'</h2>'
			 		+'<p class="my-description">敘述:'+result.eventContext+'<br/>'
			 		+'開始時間:'+result.timeStart+'<br/>'
			 		+'結束時間:'+result.timeEnd+'</p>'
			 		+'</div></div></div></div>'	
			 		+'</div></section>';
			 		//result.eventId
			  	 $("#oneevent").html(replydata);
			  	 $("#showMyRecipe").show();
			     showMyRecipe(eventId);
			 },error:function(err){
			 	console.log(err);
		}
    });
}
//參加者名單
// 				var replyjson1=JSON.stringify(eventId);
// 				$.ajax({
// 					url:"${contextRoot}/event/update",
// 					contentType:'application/json',//送出資料型態
// 					dataType:'json',//回傳資料型態
// 					method:'post',
// 					data:replyjson,
// 					success:function(result){						
// 						var replydata="";			
// 			 				replydata+="<h3>選擇參加的活動</h3>"
// 								+"活動Id:"+result.eventId+"<br/>"
// 								+"活動標題:"+result.eventTitle+""
// 								+"<img src='${contextRoot}/image/event/"+result.eventPhoto+"' class='userimg'/><br/>"
// 								+"敘述:"+result.eventContext+"<br/>"
// 							    +"開始時間:"+result.timeStart+"<br/>"
// 								+"結束時間:"+result.timeEnd+"<br/>"
// 								+"<button onclick='rechoice()'>重新選擇</button>";	
// 			 			$("#showevent").html(replydata);
// 			 			$("#showMyRecipe").show();
// 			 			campaignlist(eventId);
// 			 			showMyRecipe(eventId);			
// 					},
// 					error:function(err){
// 						console.log(err);
// 					}
// 				});
// 			}
//			function campaignlist(eventId){
// 				//參加者名單
// 				var settings = {
// 			        "url": "${contextRoot}/campaign/list/"+eventId,
// 			    	"method": "GET",
// 			   		"timeout": 0,
// 			    };
				
// 				$.ajax(settings).done(function (response) {
// 					var replydata="";
// 					$.each(response,function(index,value){
// 						replydata+=
// 							"食譜標題:"+value.cookTitle+"<br/>"
// 							+"食譜圖片:<img src='${contextRoot}/image/recipe/"+value.cookPhoto+"' class='userimg'/><br/>"
// 							+"作者:"+value.userName+"<br/>"
// 							+"<img src='${contextRoot}/image/users/"+value.userPhoto+"' class='userimg'/><br/>"
// 							+"按讚數:"+value.favoritenum+"<br/>";
					
// 					})
// 					$("#showcampaign").html(replydata);
// 				});	
//			}
//重新選擇想參加的活動
function rechoice(){
	 $(location).prop("href", "http://localhost:8090/cookblog/showevent");
}
//將參加的食譜傳到後端資料庫
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
				 	contentType:'application/json',//送出資料型態
				 	dataType:'json',//回傳資料型態
				 	method:'post',
				 	data:replyjson,
				 	success:function(result){						
						$(location).prop("href", "http://localhost:8090/cookblog/event/page");
				 	},
				 	error:function(err){
				 		console.log(err);
				 	}
				});
}
function checkjoin(eventId,recipeId){
				let obj={
						eventId:eventId,
						recipeId:recipeId
				}
			  	var replyjson=JSON.stringify(obj);
			  	 $.ajax({
				 	url:"${contextRoot}/event/participatecheck",
			 	 	contentType:'application/json',//送出資料型態
			  	 	dataType:'json',//回傳資料型態
			  	 	method:'post',
			  	 	data:replyjson,
			  	 	success:function(result){		
						console.log(result);
						
						if(result==true){
							console.log(recipeId);
							$("input[value='"+recipeId+"']").hide();
						}
			  	 	},
			  	 	error:function(err){
			  	 		console.log(err);
			  	 	}
			  	});
}
</script>
</body>
</html>