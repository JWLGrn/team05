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
h1 {
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
    height: 150px;
}
input {
  margin:3pt;
  width: 20%;
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
	<div class="container">
	
<h1>新增食譜</h1>
<form action="insertRecipe" method="post" enctype="multipart/form-data" id="insertform">
 發文者:${userId}<br/>
 食譜圖:<img id="recipt"/>
      <input type="file" id="rfile" name="rfile" onchange="photochange(event,recipt)" accept=".png, .jpg, .jpeg"/><br/>
 食譜名稱:<input type="text" name="rtitle" id="rtitle"/><span id="titlecheck" 	class="check"></span><br/>
 介紹:<textarea name='rdescript' id="rdescript"></textarea><span id="rdescriptcheck" 	class="check"></span><br/>
 烹調時間:<input type="Number" name="rtime" id="rtime" min="0"/>分鐘<span id="rtimecheck" 	class="check"></span><br/><br/>
 幾人份:<input type="Number" name="rpeople" id="rpeople" min="0"/>人<span id="rpeoplecheck" 	class="check"></span><br/>
<button id="submit"  onclick="submitBtn()">送出</button>
</form>
<button onclick="recipetest()">快捷鍵</button>
</div>
 <script type="text/javascript">
//網頁載入時

$(document).ready(function(){
//	$("#submit").hide();
	
	
});
//測試
function recipetest(){
	rtitle.value="牛肉麵";
 	rdescript.innerHTML="好吃";
 	rtime.value=10;
	rpeople.value=4;
}
//檔案發生改變
function photochange(event,imgid){
	//預覽圖
	var img=document.getElementById(imgid.id);
	var reader = new FileReader();
	img.src = URL.createObjectURL(event.target.files[0]);
	img.onload = function() {
      URL.revokeObjectURL(img.src) // free memory
    }
}
//輸入字串檢查
$("#rtitle").blur(function(){
	var str=rtitle.value;
		if(str.length>11 || str.length<1){
			document.getElementById("titlecheck").innerText="字數超過10個,也不可為空值";
			rtitle.value="";
		}else{
			document.getElementById("titlecheck").innerText="";
		}
});
$("#rdescript").blur(function(){
	var str=rdescript.value;
	if(str.length>160 || str.length<1){
		document.getElementById("rdescriptcheck").innerText="字數超過150個,也不可為空值";
		rtitle.value="";
	}else{
		document.getElementById("rdescriptcheck").innerText="";
	}
});
$("#rtime").blur(function(){
	var num=document.getElementById("rtime").value;
	if(num<=0||num>180){
		document.getElementById("rtimecheck").innerText="數值不可小於0,也不可以大於180";
		document.getElementById("rtime").value="";
	}else{
		document.getElementById("rtimecheck").innerText="";
	}
	console.log(num);	
});
$("#rpeople").blur(function(){
	var num=document.getElementById("rpeople").value;
	if(num<=0||num>20){
		document.getElementById("rpeoplecheck").innerText="數值不可小於1,也不可以大於20";
		document.getElementById("rpeople").value="";
	}else{
		document.getElementById("rpeoplecheck").innerText="";
	}	
});
</script>
</body>
</html>


