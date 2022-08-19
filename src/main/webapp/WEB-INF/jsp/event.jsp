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
活動id ${eventId} <input type="hidden" id="eventId"><br/>
活動標題<input type="text" id="eventTitle"><span class="check" id="checkTitle"></span><br/>
活動內容<textarea id="eventContext"></textarea><span class="check" id="checkContext"></span><br/>
開始<input type="date" id="dateStart"/><br/>
結束<input type="date" id="dateEnd"/><span class="check" id="checkTime"></span><br/>
圖片<label id="fileload"><img src="${contextRoot}/image/step/file.jpg" id="imgView"/>
   <input type="file" id="eventPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br/>
<button id="createbtn">建立活動</button>	
<div onclick="hotkey()" style="color:red;">快捷鍵</div>
</div>
<h3>活動顯示</h3>
<div id="showevent">


</div>

<h3>我的食譜</h3>
<div id="myRecipe">

<button>參加活動</button>	
</div>


<!-- js                                          -->
<script type="text/javascript">
let fileDataURL;
//網頁載入時
$(document).ready(function(){
	$("#createbtn").hide();
	if(${userId}==1){
		$("#newevent").show();
	}else{
		$("#newevent").hide();
	}
	
	showMyRecipe();
	showAllEvent();
	//預設開始時間 結束時間
	dateSet();
});
//初始時間設定
function dateSet(){
	let now=new Date();
	let month=now.getMonth()+1;
	let date=now.getDate();
	if(month<10){month="0"+month}
	if(date<10){date="0"+date}
	dateStart.value=now.getFullYear()+"-"+month+"-"+date;
	dateEnd.value=now.getFullYear()+"-"+month+"-"+(date+1);
	//最大值最小值
	dateStart.min=now.getFullYear()+"-"+month+"-"+date;
	dateEnd.min=now.getFullYear()+"-"+month+"-"+(date+1);
}

//步驟圖片顯示用(跟步驟一樣)+抓url
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
function showMyRecipe(){
	var settings = {
	        "url": "http://localhost:8090/cookblog/event/showrecipe",
	    	"method": "GET",
	   		"timeout": 0,
	    };
		$.ajax(settings).done(function (response) {
			var replydata="";
			$.each(response,function(index,value){
				replydata+=
					"食譜Id:"+value.recipeId+"<br/>"
					+"食譜名稱:"+value.cookTitle+""
					+"<img src='${contextRoot}/image/recipe/"+value.cookPhoto+"' class='userimg'/><br/>"
					+"敘述:"+value.cookDescription+"<br/>"
				    +"烹調時間:"+value.cookTime+"分鐘_"
					+"食用人數:"+value.cookServe+"人<br/>"			    
				    +"時間:"+value.date +"<br/>"	
					+"卡洛里:"+value.totalCal;	
				replydata+="<button onclick='participate("+value.recipeId+")'>參加活動</button><br/>-----------------------------------------<br/></div>";
			})
			$("#myRecipe").html(replydata);
			
		});	
}

//顯示活動
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
 				     replydata+="<button onclick='updateevent("+value.eventId+")'>修改</button><br/>";
			    }	
 			})

 			$("#showevent").html(replydata);
 		});	
}
//快捷鍵
function hotkey(){
	$("#eventTitle").val("夏日美食季");
	$("#eventContext").text("募集適合夏日的開胃食譜!");
	$("#createbtn").show();
	$("#checkTitle").text("");
	$("#checkContext").text("");
}


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
//新增活動
$("#createbtn").click(function(){
	var eventId=${eventId};
	var eventTitle=$("#eventTitle").val();
	var eventContext=$("#eventContext").text();
	var timeStart=$("#dateStart").val();
	var timeEnd=$("#dateEnd").val();
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
	console.log(eventId+"_"+eventTitle+"_"+eventContext+"_"+timeStart+"_"+timeEnd+"_"+fileDataURL);
    $.ajax({
		url:"${contextRoot}/event/insert",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){	
			console.log(result);
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
			$("#dateStart").val(result.timeStart);
			$("#dateEnd").val(result.timeEnd);
			console.log(result.timeStart);
			
		},
		error:function(err){
			console.log(err);
		}
	});
}





//參加活動紐
function participate(recipeId){
	//判斷是否有參加
	//以參加,按鈕必須顯示已參加
	console.log("participate");
}


</script>
</body>
</html>