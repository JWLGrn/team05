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
.check{
	color:red;
}

  </style>
</head>
<body>

<h3>留言</h3>
<%-- <form action="insert" method="post" enctype="multipart/form-data" > --%>
<!--   <input type="hidden" value="1" name="replytype">訊息類型 1為recipe           自行設定 -->
<!--   <input type="hidden" value="2" name="replytypeId">訊息id replytypeId= recipeId或postsId      自行設定 -->
<!--   <input type="hidden" value="3" name="replyId">假id設1為新增 -->
<%--   留言者:${usersId}<input type="text" value="${usersId}" name="usersId"/> --%>
<%--   圖片:<label><img src="${contextRoot}/image/step/file.jpg" id="imgView"/> --%>
<!--       <input type="file" name="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label> -->
<!--   留言:<textarea name="message" id="message">留言內容</textarea> -->
<!--   <button>送出</button> -->
<%-- </form> --%>

  <input type="hidden" value="1" id="replytype"><!-- 訊息類型 1為recipe           自行設定-->
  <input type="hidden" value="2" id="replytypeId"><!-- 訊息id replytypeId= recipeId或postsId      自行設定-->
  <input type="hidden" value="3" id="replyId"><!-- 假id設1為新增 -->
  留言者:${usersId}<input type="text" value="${usersId}" id="usersId"/>
  圖片:<label><img src="${contextRoot}/image/step/file.jpg" id="imgView"/>
      <input type="file" name="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label>
  留言:<textarea name="message" id="message">留言內容</textarea>

  <button id="btn1">送出</button>


<h3>顯示留言</h3>
留言者:
圖片:
留言:


<!-- js                                          -->
<script type="text/javascript">
$("#btn1").click(function(){
	console.log($("#replytype").val());
	console.log($("#replytypeId").val());
	console.log($("#replyId").val());
	console.log($("#usersId").val());
	console.log($("#message").text());
	
	
	var reply={
			"replytype":$("#replytype").text(),
			"replytypeId":$("#replytypeId").text(),
			"replyId":$("#replyId").text(),
			"usersId":$("#usersId").text(),
			//"finallyPhoto":$("#replytype").text(),
			"message":$("#message").text()		
	}
	var replyjson=JSON.stringify(reply);
	
	$.ajax({
		url:"${contextRoot}/reply/ajaxinsert",
		contentType:'application/json',//送出資料型態
		dataType:'json',//回傳資料型態
		method:'post',
		data:replyjson,
		success:function(result){
			console.log("00");
		},
		error:function(err){
			console.log(err);
		}
	});
});
	






//步驟圖片顯示用(跟步驟一樣)
function imgview(event,imgid){   
   //img預覽
  console.log(imgid.id);
  const fr = new FileReader();
  fr.onload = function (e) {
    $('#'+imgid.id+'').attr('src', e.target.result);
  };
  fr.readAsDataURL(event.target.files[0]);
}
</script>
</body>
</html>