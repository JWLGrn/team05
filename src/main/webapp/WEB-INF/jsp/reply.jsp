<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  width: 10pt;

}
img{
	width: 100px; 
}
.userimg{
	width: 50px; 
	height: 50px; 
	border-radius: 10px
}
.check{
	color:red;
}

  </style>
</head>
<body>

<h3>留言</h3>
  
  回應類型:<span id="a"></span><input type="hidden" value="${replytype}" id="rtype"><!-- 訊息類型 1為recipe           自行設定-->
  食譜Id:<span id="b"></span><input type="hidden" value="2" id="replytypeId"><!-- 訊息id replytypeId= recipeId或postsId      自行設定-->
  留言Id<span id="c"></span><input type="hidden" value="1" id="replyId"><!-- 假id設1為新增 -->
  留言者:<input type="hidden" value="${usersId}" id="usersId"/>
  圖片:<label id="fileload"><img src="${contextRoot}/image/step/file.jpg" id="imgView"/>
      <input type="file" id="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label>
  留言:<textarea name="message" id="message">我是留言</textarea>
  <button id="senddata">送出</button>

<h3>顯示留言</h3>
<div id="showmsg">
</div>


<!-- js                                          -->
<script type="text/javascript">
//網頁載入時顯示
let fileDataURL = null;
$(document).ready(function(){
	$("#senddata").hide();
	show();
});
		
function show(){	
	var settings = {
        "url":"${contextRoot}/event/showrecipe",
    	"method": "GET",
   		"timeout": 0,
    };
	
	$.ajax(settings).done(function (response) {
		var replydata="";
		$.each(response,function(index,value){
			replydata+=
				"留言Id:"+value.replyId+"<br/>"
				+"<img src='${contextRoot}/image/users/"+value.userPhoto+"' class='userimg'/>"
				+"留言者Id:"+value.userId+"_"
				+"留言者:"+value.userName+"<br/>"
			    +"留言圖片:<img src='"+value.finallyPhoto+"'/>"
				+"留言內容:"+value.message+"<br/>"			    
			    +"留言時間:"+value.uploadTime; 
			replydata+="<br/>-----------------------------------------<br/></div>";
		})
		$("#showmsg").html(replydata);
	});	
}
$("#senddata").click(function(){
	var rtype=$("#rtype").val();
	var replytypeId=$("#replytypeId").val();
	var replyId=$("#replyId").val();
	var usersId=$("#usersId").val();
	var message=$("#message").val();

	var reply={
			   replytype:rtype,
			   replytypeId:replytypeId,
			   replyId:replyId,
			   usersId:usersId,
			   finallyPhoto:fileDataURL,
			   message:message		
	}
	var replyjson=JSON.stringify(reply);
	//console.log(rtype+" "+replytypeId+" "+replyId+" "+usersId+" "+message);	
	$.ajax({
		url:"${contextRoot}/reply/insert",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){	
			var replydata="";
			$.each(result,function(index,value){
				replydata+=
					"留言Id:"+value.replyId+"<br/>"
					+"<img src='${contextRoot}/image/users/"+value.userPhoto+"' class='userimg'/>"
					+"留言者Id:"+value.userId+"_"
					+"留言者:"+value.userName+"<br/>"
				    +"留言圖片:<img src='"+value.finallyPhoto+"'/>"
					+"留言內容:"+value.message+"<br/>"			    
				    +"留言時間:"+value.uploadTime;
				if(value.userId==${usersId}){
					replydata+="<button onclick='update("+value.replyId+")'>修改</button>";
					replydata+="<button onclick='del("+value.replyId+")'>刪除</button>";
				}
				replydata+="<br/>-----------------------------------------<br/></div>";
			})
			$("#showmsg").html(replydata);
		},
		error:function(err){
			console.log(err);
		}
	});
	$("#senddata").hide();
	document.getElementById("message").value="";
	document.getElementById("finallyPhoto").remove();
	$("#imgView").attr('src','${contextRoot}/image/step/file.jpg');
	$("#replyId").val(1);
	$("#userId").val(${usersId});
	//$("#fileload").append('<img src="${contextRoot}/image/step/file.jpg" id="imgView"/>');
	$("#fileload").append('<input type="file" id="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)">');

});

//步驟圖片顯示用(跟步驟一樣)+抓url
function imgview(event,imgid){   
  const fr = new FileReader();
  //抓url
  let fPhoto=document.getElementById("finallyPhoto").files;
  if(fPhoto.length>0){//有圖
	let fileToLoad=fPhoto[0];//取得檔案詳細資料
    fr.onload = function (e) {
    	fileDataURL=e.target.result
		$('#'+imgid.id+'').attr('src', fileDataURL);//img預覽
	};
	console.log(fileToLoad);
	fr.readAsDataURL(event.target.files[0]);//img預覽
  }
}
$("#message").blur(function(){//避免送出空白留言
	if($("#message").val()==""){
		$("#senddata").hide();
	}else{
		$("#senddata").show();
	}
});
//修改
function update(replyId){
	var replyjson=JSON.stringify(replyId);
	$.ajax({
		url:"${contextRoot}/reply/update",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){			
			$("#replyId").val(result.replyId);
			$("#userId").val(result.userId);
			$("#imgView").attr("src","${contextRoot}/image/reply/"+result.finallyPhoto);
			$("#message").val(result.message);
			//測試
			$("#a").text(result.reply);
			$("#b").text(result.replyTypeId);
			$("#c").text(result.replyId);
		},
		error:function(err){
			console.log(err);
		}
	});
}
//刪除
function del(replyId){
	var r = confirm("您確定要刪除嗎?");
	if (r == true) {
		console.log("del");
		alert('刪除成功');
	var replyjson=JSON.stringify(replyId);
 	$.ajax({
 		url:"${contextRoot}/reply/delete",
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
	 $(location).prop("href", "http://localhost:8090/cookblog/reply/page");
}
</script>
</body>
</html>