<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<script src="${contextRoot}/js/jquery-3.6.0.min.js" ></script>
<script type="text/javascript"></script>
<style type="text/css">
h3 {
    color: purple;
     }
 textarea {
    padding: 10px;
    max-width: 100%;
    line-height: 1.5;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-shadow: 1px 1px 1px #999;
    width: 300px;
    height: 50px;
}
input {
  margin:3pt;
}
img{
	width: 200px; 
}
.userimg{
	width: 100px; 

	border-radius: 10px
}
.check{
	color:red;
}

  </style>
</head>
<body>
<div id="newevent">
<h3>活動新增</h3>
使用者Id:${userId}<br/>
活動id <input type="text" id="eventId" value="1"><br/>
活動標題<input type="text" id="eventTitle"><span class="check" id="checkTitle"></span><br/>
活動內容<textarea id="eventContext"></textarea><span class="check" id="checkContext"></span><br/>
開始<input type="date" id="timeStart"/><br/>
結束<input type="date" id="timeEnd"/><span class="check" id="checkTime"></span><br/>
圖片<label id="fileload"><img src="${contextRoot}/image/step/file.jpg" id="imgView"/>
   <input type="file" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br/>
<button id="createbtn">建立活動</button>	
<div onclick="hotkey()" style="color:red;">快捷鍵</div>
</div>
<h3>活動顯示</h3>
<div id="showevent">
	
</div>

<h3>活動參加者</h3>
<div id="showcampaign">
	
</div>

<div id="myRecipe">    
</div>


<!-- js                                          -->
<script type="text/javascript">
let fileDataURL;
//網頁載入時預設--------------------------------------------
$(document).ready(function(){
	 $("#createbtn").hide();
	 $("#showMyRecipe").hide();
	 if(${userId}==1){//userId=1  -->管理員
	 	$("#newevent").show();
	 }else{
	 	$("#newevent").hide();
	}
	//顯示活動
	 showAllEvent();
	 //預設開始時間 結束時間
	 dateSet();
});
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
//顯示食譜
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
				replydata+=
					"食譜Id:"+value.recipeId+"<br/>"
					+"食譜名稱:"+value.cookTitle+""
					+"<img src='${contextRoot}/image/recipe/"+value.cookPhoto+"' class='userimg'/><br/>"//onblur="checkjoin('+eventId+','+value.recipeId+')
					+"敘述:"+value.cookDescription+"<br/>"
				    +"烹調時間:"+value.cookTime+"分鐘_"
					+"食用人數:"+value.cookServe+"人<br/>"			    
				    +"時間:"+value.date +"<br/>"	
					+"卡洛里:"+value.totalCal
					+"<br/>-----------------------------------</br>";		
			})
			replydata+="<button onclick='checkchoice("+eventId+")'>送出</button>";
			$("#myRecipe").html(replydata);			
		});	
}
//顯示活動  管理員:crud,一般使用者:參加活動
function showAllEvent(){
	var settings = {
	        "url": "http://localhost:8090/cookblog/event/showevent",
	    	"method": "GET",
	   		"timeout": 0,
	    };
 		$.ajax(settings).done(function (response) {
 			var replydata="";
 			$.each(response,function(index,value){
 				replydata+=
					"活動Id:"+value.eventId+"<br/>"
					+"活動標題:"+value.eventTitle+""
					+"<img src='${contextRoot}/image/event/"+value.eventPhoto+"' class='userimg'/><br/>"
					+"敘述:"+value.eventContext+"<br/>"
				    +"開始時間:"+value.timeStart+"<br/>"
					+"結束時間:"+value.timeEnd;
				if(${userId}==1){
 				     replydata+="<button onclick='updateevent("+value.eventId+")'>修改</button>";
 				     replydata+="<button onclick='del("+value.eventId+")'>刪除</button>";
			    }else{
			    	replydata+="<button onclick='participate("+value.eventId+")'>參加活動</button>";
			    	
			    }
				replydata+="<br/>-----------------------------------------<br/>";
 			})

 			$("#showevent").html(replydata);
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
//功能-------------------------------------------------------
//新增活動
$("#createbtn").click(function(){
	var eventId=$("#eventId").val();;
	var eventTitle=$("#eventTitle").val();
	var eventContext=$("#eventContext").val();
	var timeStart=$("#timeStart").val();
	var timeEnd=$("#timeEnd").val();
	var eventPhoto=$("#eventPhoto").val();
	
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
 				replydata+=
					"活動Id:"+value.eventId+"<br/>"
					+"活動標題:"+value.eventTitle+""
					+"<img src='${contextRoot}/image/event/"+value.eventPhoto+"' class='userimg'/><br/>"
					+"敘述:"+value.eventContext+"<br/>"
				    +"開始時間:"+value.timeStart+"<br/>"
					+"結束時間:"+value.timeEnd;
 				if(${userId}==1){
				     replydata+="<button onclick='updateevent("+value.eventId+")'>修改</button>";
				     replydata+="<button onclick='del("+value.eventId+")'>刪除</button>";
			    }
				replydata+="<br/>-----------------------------------------<br/>";	
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
			//console.log(result.timeStart);
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
	 $(location).prop("href", "http://localhost:8090/cookblog/event/page");
}

//參加活動紐
function participate(eventId){
	//顯示選擇活動

// 	var replyjson=JSON.stringify(eventId);
// 	$.ajax({
// 		url:"${contextRoot}/event/update",
// 		contentType:'application/json',//送出資料型態
// 		dataType:'json',//回傳資料型態
// 		method:'post',
// 		data:replyjson,
// 		success:function(result){						
// 			var replydata="";			
//  				replydata+="<h3>選擇參加的活動</h3>"
// 					+"活動Id:"+result.eventId+"<br/>"
// 					+"活動標題:"+result.eventTitle+""
// 					+"<img src='${contextRoot}/image/event/"+result.eventPhoto+"' class='userimg'/><br/>"
// 					+"敘述:"+result.eventContext+"<br/>"
// 				    +"開始時間:"+result.timeStart+"<br/>"
// 					+"結束時間:"+result.timeEnd+"<br/>"
// 					+"<button onclick='rechoice()'>重新選擇</button>";	
//  			$("#showevent").html(replydata);
//  			$("#showMyRecipe").show();
//  			showMyRecipe(eventId);
// 		},
// 		error:function(err){
// 			console.log(err);
// 		}
//	});
	//參加者名單

	var replyjson=JSON.stringify(eventId);
	$.ajax({
		url:"${contextRoot}/event/update",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){						
			var replydata="";			
 				replydata+="<h3>選擇參加的活動</h3>"
					+"活動Id:"+result.eventId+"<br/>"
					+"活動標題:"+result.eventTitle+""
					+"<img src='${contextRoot}/image/event/"+result.eventPhoto+"' class='userimg'/><br/>"
					+"敘述:"+result.eventContext+"<br/>"
				    +"開始時間:"+result.timeStart+"<br/>"
					+"結束時間:"+result.timeEnd+"<br/>"
					+"<button onclick='rechoice()'>重新選擇</button>";	
 			$("#showevent").html(replydata);
 			$("#showMyRecipe").show();
 			campaignlist(eventId);
 			showMyRecipe(eventId);			
		},
		error:function(err){
			console.log(err);
		}
	});
}
function campaignlist(eventId){
	//參加者名單
	var settings = {
        "url": "${contextRoot}/campaign/list/"+eventId,
    	"method": "GET",
   		"timeout": 0,
    };
	
	$.ajax(settings).done(function (response) {
		var replydata="";
		$.each(response,function(index,value){
			replydata+=
				"食譜標題:"+value.cookTitle+"<br/>"
				+"食譜圖片:<img src='${contextRoot}/image/recipe/"+value.cookPhoto+"' class='userimg'/><br/>"
				+"作者:"+value.userName+"<br/>"
				+"<img src='${contextRoot}/image/users/"+value.userPhoto+"' class='userimg'/><br/>"
				+"按讚數:"+value.favoritenum+"<br/>";
		
		})
		$("#showcampaign").html(replydata);
	});	
}
//重新選擇想參加的活動
function rechoice(){
	 $(location).prop("href", "http://localhost:8090/cookblog/event/page");
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