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
  </style>
</head>
<body>
	<div class="container">
	
<h1>新增食譜</h1>
<form action="insertRecipe" method="post" enctype="multipart/form-data" id="insertform">
 發文者:${users}<br/>
 食譜圖:<img id="cook_photo_img"/>
        <input type="file" id="cook_photo" name="cook_photo" onchange="photoview(event,cook_photo_img)"/><br/>
 食譜名稱:<input type="text" name="cook_title" id='cook_title'/><br/>
 介紹:<textarea name='cook_description' id='cook_description'>cook_description</textarea><br/>
 烹調時間:<input type="Number" name="cook_time" id="cook_time" min="0"/>分鐘<br/>
 幾人份:<input type="Number" name="cook_serve" id="cook_serve" min="0"/>人<br/>
<input type="submit" value="送出"/>
</form>
<button onclick="recipetest()">快捷鍵</button>

 <script type="text/javascript">
//測試
function recipetest(){
	cook_title.value="牛肉麵";
 	cook_description.innerHTML="好吃";
 	cook_time.value=10;
	cook_serve.value=4;
}


//預覽圖
function photoview(event,imgid){
	var img=document.getElementById(imgid.id);
	var reader = new FileReader();
	img.src = URL.createObjectURL(event.target.files[0]);
	img.onload = function() {
      URL.revokeObjectURL(img.src) // free memory
    }
	console.log(cook_photo.revokeObjectURL);
}
</script>
</body>
</html>
