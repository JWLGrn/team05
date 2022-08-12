<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<h1>顯示食譜</h1>
<form action="insertRecipe" method="post" enctype="multipart/form-data" id="insertform">
食譜編號:<span>${recipe.recipeId}</span><br/>
發文者: <span>${userId}</span><br/>
食譜圖:<img id="recipt" src="<c:url value='/image/recipe/${recipe.cookPhoto}'/>"/><br/>
食譜名稱:<span id="s1">${recipe.cookTitle}</span><br/>
介紹:<span id="s2">${recipe.cookDescription}</span><br/>
烹調時間:<span id="s3">${recipe.cookTime}</span>分鐘<br/>
幾人份:<span id="s4">${recipe.cookServe}</span>人<br/>
<button id="updateSubmitBtn" onclick="updateRecipt(this)" hidden="hidden">送出</button>
</form>
<button id="updateBtn" onclick="updateRecipt(this)">修改</button>
<h1>Do</h1>


<script type="text/javascript">
function updateRecipt() {
	$("#s1").before('<input type="text" value='+$("#s1").text()+' name="rtitle">');	
	$("#s2").before('<textarea name="rdescript">'+$("#s2").text()+'</textarea>');
	$("#s3").before('<input type="text" value='+$("#s3").text()+' name="rtime">');
	$("#s4").before('<input type="text" value='+$("#s4").text()+' name="rpeople">');	
	$("img").after('<input type="file" id="rfile" name="rfile" onchange="photochange(event,recipt)" accept=".png, .jpg, .jpeg"/>');
	$("span").remove();
	$("#updateBtn").hide();
	$("#updateSubmitBtn").show();
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
// 	var tableele = document.getElementById("step");
			
// 	let count = 0; //步驟
// 	var fileele = document.getElementById("file");
// 	function newstep() {
// 			count = count + 1;
// 			var step = document.getElementById("step");
// 			var newstep ="<form method='post' action='insertfile' enctype='multipart/form-data' id='uploadform'>"
// 				+"step:"+count
// 				+"<input type='hidden' name='photoName' id='photoName' value='${fk_recipestep_recipe}_"+count+"' />"
// 				+"<label><input type='file' style='display: none;' name='file' id='file"+count+"' accept='image/jpeg' />"
// 				+"<img id='photo"+count+"' src='${contextRoot}/img/cook.jpg' width='150' /></label>"
// 				+"step_description:<textarea name='step_description' id='step_description'></textarea>"
// 				+"<input type='submit' value='送出' /></form>";
// 			step.innerHTML += newstep;
// 			//當選擇檔案改變,預覽突改變
// 			$("#file"+count).change(function(){
// 	 			readURL(this,count);
// 	 		});	
// 			//隱藏新增紐
// 			document.getElementById("newstep").setAttribute("style","display:none");		
// 	}



	
// 	//上傳步驟
// 	$(function(){
// 		tableele.innerHTML+="<input type='button' onclick='newstep()' value='新增食譜' id='newstep'/>"	
// 	});
	 </script>	
</body>
</html>