<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
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

<style type="text/css">
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
.userimg {
	width: 100px;
	height: 100px;
}
.eventimg {
	width: 200px;
	height: 150px;
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
	width: 500px;
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
.imgpat{
   width:200px;
}
</style>
<title>Event Manage</title>
</head>
<body>
<jsp:include page="layout/navbar.jsp"/>
<div class="container-fluid">
<div class="row">
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="col-lg-9" style="height:calc(100vh);margin:auto;padding-top:30px;margin-left:300px">
	<!-- Preloader Start Here -->
	<div id="preloader"></div>
	
	<!-- ScrollUp Start Here -->
	<a href="#wrapper" data-type="section-switch" class="scrollup"> <i
		class="fas fa-angle-double-up"></i>
	</a>
	<!-- ScrollUp End Here -->		
<!-- ????????????	-> ??????	 -->
<div id="wrapper" class="wrapper">
<div  class="w3-main">
<section class="recipe-without-sidebar-wrap" style="padding-top:30px;">
		<div class="container">
		    <div class="row" id="showevent"></div>
		    <div id="neweventbtn"><a onclick="addevent(1)"><i class="submitbtn">????????????</i></a>
		</div>	
</section>	
<!-- ???????????? -->
<section id="insertevent" class="submit-recipe-page-wrap padding-top-74 ">
            <div class="container insertdiv">
                <div class="row gutters-60">
                    <div class="col-lg-8"> 
                       <p class="title_h1">????????????</p> 
                       
                         <form class="submit-recipe-form">
                            <div class="form-group">
                                <input type="hidden" id="eventId" ><br />
                                <label><i class="fas fa-utensils color_red"></i>????????????</label>
                                <input type="text" id="eventTitle" placeholder="Recipe Name" class="form-control insertdiv" name="name"
                                    data-error="Subject field is required" style="background-color:white;" required>
                                <span class="check" id="checkTitle"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                                <label><i class="fas fa-comments color_red"></i>????????????</label>
                                <textarea placeholder="Type your text" class="textarea form-control insertdiv" name="message" id="eventContext"
                                    rows="7" cols="20" data-error="Message field is required" style="background-color:white;" required></textarea>
                                 <span class="check" id="checkContext"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                            
                            <div class="additional-input-wrap">
                                <label><i class="fas fa-eye color_red"></i>??????</label>
                                <div class="form-group">
                                   <label id="fileload">
                                    <ul class="upload-img">
                                        <li><img src="http://localhost:8090/cookblog/recipe/upload.png" id="imgView" alt="Upload Image" class="eventimg "></li>
                                    </ul>
                                      <input type="file" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display: none;" onchange="imgview(event,imgView)" >
                                      <i class="fas fa-cloud-upload-alt color_red"></i>UPLOAD
                                    </label>
                                </div>
                            </div>
                            <div class="additional-input-wrap">
                                <label><i class="fas fa-calendar color_red"></i>????????????</label>
                                <div class="row no-gutters ">
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-left insertdiv" >
                                            <i class="fas fa-arrows-alt"></i>
                                            <input type="date" id="timeStart" class="form-control" name="name">
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-group additional-input-box icon-right insertdiv">
                                            <input  type="date" id="timeEnd" class="form-control" name="name">
                                                
                                            <i class="fas fa-times"></i>
                                        </div>
                                    </div>
                                    <span class="check" id="checkTime"></span>
                                 </div>
                            </div>
							<button id="createbtn" class="submitbtn">????????????</button>
							<a href="http://localhost:8090/cookblog/showallevent"><span id="createbtn" class="submitbtn" >??????</span></a>
                            <div  style="color: red;"><i onclick="hotkey()" class="fas fa-star color_yellow"></i></div>
                        </form>
                     
                    </div>
                </div>
          </div>
</section>
<section class="submit-recipe-page-wrap padding-top-74 ">
 	<div class="col-xl-12 col-lg-6 col-md-6 col-sm-6 col-12 ">
      <div class="container">
      
         <div class="product-box-layout6 col-lg-8" id="oneevent">
            
         </div>
      </div>
   </div>
</section> 
<!-- ???????????????     -->
<section class="">
            <div class="container" id="showparticipate">
                <div class="section-heading heading-dark">
                    <h2 class="item-heading"><i class="fas fa-users color_red"></i>Participant</h2>
                </div>
                <div class="row" >
                    <div class="container">
                    <div class="row gutters-60">
                    <div class="col-lg-8">
                        <div class="author-box-layout1">
                                <table class="table table-striped">
                                    <tbody id="participatelist">
                                    
                                    </tbody>
                                </table>
                         </div>
                      </div>
                 </div>
                </div>       
                </div>
            </div>
 </section>
</div></div></div></div></div>
		<!-- Recipe Without Sidebar Area End Here -->
		<!-- Footer Area Start Here -->
<!-- 		<footer class="ranna-bg-dark "> -->
<!-- 			<div class="container "> -->
<!-- 				<div class="footer-logo "> -->
<!-- 					<a href="index.html"><img src="img/logo-light.png" -->
<!-- 						class="img-fluid" alt="footer-logo"></a> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</footer> -->

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

//---------------------------------------------?????????
$(document).ready(function() {//????????????,??????????????????
// 	 //??????
 	 $("#showevent").show();
 	 showAllEvent();
 	 $("#insertevent").hide();
 	 $("#oneevent_out").hide();
	
 	 $("#showparticipate").hide();
  });
//??????
 function addevent(){
	//??????
 	$("#showevent").hide();
	$("#insertevent").show();//??????????????????
 	$("#oneevent_out").hide();
	
	$("#showparticipate").hide();
	//??????
 	$("#createbtn").hide();//?????????????????????
 	$("#eventId").val("1");//????????????
 	$("#neweventbtn").hide();//???????????????
 }
 //??????
function showupdate(eventId){
	//??????
 	$("#showevent").hide();
	$("#insertevent").show();//??????????????????
 	$("#oneevent_out").hide();
	
	$("#showparticipate").hide();
	//??????
 	$("#createbtn").show();//?????????????????????
 	$("#neweventbtn").hide();//???????????????
	updateevent(eventId);
 }
//??????????????????
 function showoneevent(eventId){
	//??????
	$("#showevent").hide();
	$("#insertevent").hide();
	$("#oneevent_out").show();//?????????????????????
	participate(eventId);
	$("#showparticipate").show();//???????????????
	participatelist(eventId);
 	$("#createbtn").hide;//?????????????????????
 	$("#neweventbtn").hide();//???????????????
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
												
				replydata += '<li><a ><i class="fas fa-long-arrow-alt-right" onclick="showupdate('+ value.eventId+')">??????</i></a></li>';
				replydata += '<li><a onclick="del('+ value.eventId+ ')"><i class="fas fa-long-arrow-alt-right">??????</i></a></li>';
				replydata += '<li><a onclick="showoneevent('+ value.eventId+ ')"><i class="fas fa-users">????????????????????????</i></a></li>';
				replydata += '</ul></div></div></div>';
				
			})				
            $("#showevent").html(replydata);
			});
}
function eventend(timeend){
	let result=0;
    let timearry=timeend.split("/");

 	let now=new Date();
	let year=now.getFullYear();
	let month=now.getMonth()+1;
	let date=now.getDate();

	if(timearry[0]>year){
		result=0;
	}else{
		if(timearry[1]>month){
			result=0;
		}else{
			if(timearry[2]>date){
				result=0;
			}else{
				result=1;
			}
		}
	}
	return  result;
}
//--------------------event?????????-------------------> 
//??????????????????
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
		//??????????????????
		timeStart.min=now.getFullYear()+"-"+month+"-"+date;
		timeEnd.min=now.getFullYear()+"-"+month+"-"+dateend;
}
 //???????????????(???????????????)+???url
function imgview(event,imgid){   
 		const fr = new FileReader();
 		//???url
 		let fPhoto=document.getElementById("eventPhoto").files;
 		if(fPhoto.length>0){//??????
 			let fileToLoad=fPhoto[0];//????????????????????????
 			fr.onload = function (e) {
 			    	fileDataURL=e.target.result
 					$('#'+imgid.id+'').attr('src', fileDataURL);//img??????
 		};
 			fr.readAsDataURL(event.target.files[0]);//img??????
 	}
}
//????????????
//eventTitle_20???(??????????????????25???)
$("#eventTitle").blur(function(){
	str=eventTitle.value;
	if(str.length<1||str.length>21){
		$("#checkTitle").text('????????????1~20');
		//$("#eventTitle").val("");
	}else{
		$("#checkTitle").text("");
	}
});
//eventContext_200???(????????????max)
$("#eventContext").blur(function(){
	str=eventContext.value;
	if(str.length<1||str.length>200){
		$("#checkContext").text('????????????1~200');
		$("#createbtn").hide();
	}else{
		$("#checkContext").text("");
		$("#createbtn").show();
	}
});
$("#timeStart").blur(function(){
	//???????????????
	let now=new Date();
	let year=now.getFullYear();
	let month=now.getMonth()+1;
	let date=now.getDate();
	//???????????????
	let inputtime=$("#timeStart").val();
	let tarr=inputtime.split("-");
	function reset(){
		if(month<10){month="0"+month}
		if(date<10){date="0"+date}
		timeStart.value=year+"-"+month+"-"+date;
	}
	if(tarr[0]<year){
		$("#checkTime").text("??????????????????????????????");
		reset();
	}else{$("#checkTime").text("");}
	
	if(tarr[0]==year){
		if(Number(tarr[1])<month){	
 			$("#checkTime").text("??????????????????????????????");
 			reset();
 		}else{$("#checkTime").text("");}
		if(Number(tarr[1])==month){	
			if(Number(tarr[2])<date){	
	 			$("#checkTime").text("??????????????????????????????");
	 			reset();
	 		}else{$("#checkTime").text("");}
 		}else{$("#checkTime").text("");}
	}	
});
$("#timeEnd").blur(function(){
	//???????????????
	let starttime=$("#timeStart").val();
	let starr=starttime.split("-");
	
	//???????????????
	let inputtime=$("#timeEnd").val();
	let tarr=inputtime.split("-"); 
	let date_num=parseInt(starr[2])+1;
	//??????
 	function reset(){
 		if(date_num<10){date_num="0"+date_num}
 		$("#timeEnd").val(starr[0]+"-"+starr[1]+"-"+date_num);
	}
	if(tarr[0]<starr[0]||tarr[0]>(parseInt(starr[0])+1)){//???
		$("#checkTime").text("????????????????????????????????????,?????????????????????");
		reset();
	}else{$("#checkTime").text("");}
	if(tarr[0]==starr[0]){
		if(tarr[1]<starr[1]){//???
 			$("#checkTime").text("????????????????????????????????????");
 			reset();
 		}else{$("#checkTime").text("");}
		if(tarr[1]==starr[1]){
			if(tarr[2]<date_num){//???
 				$("#checkTime").text("????????????????????????????????????");
				reset();
 			}else{
 				$("#checkTime").text("");
 			}
		}
	}
  
});
//?????????
function hotkey(){
	$("#eventTitle").val("????????????");
	$("#eventContext").text("???????????????????????????!");
	$("#timeStart").val("2022-09-07");
	$("#timeEnd").val("2022-09-30");
	$("#createbtn").show();
	$("#checkTitle").text("");
	$("#checkContext").text("");
}
//CRUD
//????????????
$("#createbtn").click(function(){
	$("#showevent").show();
	$("#insertevent").hide();
	$("#neweventbtn").show();
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
		contentType:'application/json',//??????????????????
		dataType:'json',//??????????????????
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
					+ '<a>'+ value.eventTitle											
					+ '</a></h3><p>'+ value.eventContext
					+ '</p><p class="fas fa-clock">????????????:'+ value.timeStart+ '~'+ value.timeEnd
					+ '</p><ul class="entry-meta">'
					//if(${userId}==1){
			replydata += '<li><a onclick="addevent()"><i class="fas fa-user">??????</i></a></li>';
			replydata += '<li><a onclick="showupdate('+ value.eventId+')"><i class="fas fa-user">??????</i></a></li>';
			replydata += '<li><a onclick="del('+ value.eventId+ ')"><i class="fas fa-user">??????</i></a></li>';
             //}	
			replydata += '<li><a onclick="participate('+ value.eventId+ ')"><i class="fas fa-user">????????????</i></a></li>';
			replydata += '</ul></div></div></div>';

		 })
          $("#showevent").html(replydata);
         
 			//????????????
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
//????????????
function updateevent(eventId){
	var replyjson=JSON.stringify(eventId);
	$.ajax({
		url:"${contextRoot}/event/update",
		contentType:'application/json',//??????????????????
		dataType:'json',//??????????????????
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
//??????
function del(eventId){
 	Swal.fire({
 		  title: '??????',
 		  text: '??????????????????????',
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
	    	    text: "??????????????????",
	    	    icon: 'success',
		    }).then((success) => {
		    	if (success.isConfirmed) {
		    		
		    	}
		    })
		    var replyjson=JSON.stringify(eventId);
			$.ajax({
 				url:"${contextRoot}/event/delete",
	 			contentType:'application/json',//??????????????????
 				dataType:'json',//??????????????????
 				method:'post',
 				data:replyjson,
 				success:function(result){			
					
 				},
 				error:function(err){
 					console.log(err);
 				}
 			})
			 $(location).prop("href", "http://localhost:8090/cookblog/showallevent");
  					}	}  		
		    )		    
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
			  	replydata+=
			  		'<div class="item-figure">'
			  		+'<img src="${contextRoot}/image/event/'+result.eventPhoto+'" alt="Product" class="choiceimg"></div>'
			  		+'<div class="item-content">'
			  		+'<h3 class="item-title"><a>'+result.eventTitle+'</a></h3>'
			  		+'<p><i class="fas fa-star color_yellow"></i>'+result.eventContext+'</p>'
			  		+'<ul class="entry-meta remove-3rd-child-lg">'			  		
			  		+'<li><i class="fas fa-clock color_red"></i>????????????:'+result.timeStart+'</li><br/>'
			  		+'<li><i class="fas fa-clock color_red"></i>????????????:'+result.timeEnd+'</li><br/>'
			 	    +'<li><i class="fas fa-long-arrow-alt-right" onclick="rechoice()" class="submitbtn">????????????</i></li><br/>'
                    +'</ul></div>'
			  	 $("#oneevent").html(replydata);
                 
			 },error:function(err){
			 	console.log(err);
		}
    });
}


//??????????????????????????????
function rechoice(){
	 $(location).prop("href", "http://localhost:8090/cookblog/showallevent");
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
    $(location).prop("href", "http://localhost:8090/cookblog/showevent");
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
						'<tr><th><div class="author-personal-info">'
						+'<a href="http://localhost:8090/cookblog/recipe/find/'+value.recipeId+'" class="item-figure"><img src="${contextRoot}/image/recipe/'+value.cookPhoto+'"alt="Product" class="imgpat"></a>'
						+'<div class="item-content">'
						+'<div class="item-title">'+value.cookTitle+'</div>'
						+'<div class="item-designation"><i class="fas fa-user"></i>by '+value.userName+'</div>'
						+'</div></div></th><td><div class="author-social-info">'
                        +'<ul><div></div></li><li><div>'      
                        +'<i class="fas fa-heart color_red"></i>'
                        +'<h4 class="item-title">'+value.favoritenum+'</h4>'
                        +'</div></li>'
                        +'<li><div onclick="canceljoin('+value.recipeId+','+eventId+')"><h4 class="item-title">DELETE</h4></div></li>'
                        +'</ul></div></td></tr>';           
				})
				$("#participatelist").html(replydata);
			});	   
 }
function imglink(recipeId){
	$(location).prop("href", "http://localhost:8090/cookblog/recipe/find/"+recipeId);
}
//????????????
function canceljoin(recipeId,eventId){
	Swal.fire({
		  title: '????????????????????????????',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '??????!',
		  cancelButtonText: '??????!'
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire(
		      '????????????!'
		    )
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
		participatelist(eventId);
		}
	})
}		
</script>
</body>
</html>