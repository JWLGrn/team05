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
<h1>顯示食譜</h1>
食譜編號:${recipeid}<br/>
發文者:${users}<br/>
食譜圖:<img src="<c:url value='/image/recipe/${cookphoto}'/>"/><br/>
食譜名稱:${cooktitle}<br/>
 介紹:${cookdescription}<br/>
 烹調時間:${cooktime}分鐘<br/>
 幾人份:${cookserve}人<br/>
<!-- 步驟	 -->
<h1>Do</h1>
<form method='post' action='insertfile' enctype='multipart/form-data' id='uploadform'>"		





</form>
</div>
 <script type="text/javascript">
	var tableele = document.getElementById("step");
			
	let count = 0; //步驟
	var fileele = document.getElementById("file");
	function newstep() {
			count = count + 1;
			var step = document.getElementById("step");
			var newstep ="<form method='post' action='insertfile' enctype='multipart/form-data' id='uploadform'>"
				+"step:"+count
				+"<input type='hidden' name='photoName' id='photoName' value='${fk_recipestep_recipe}_"+count+"' />"
				+"<label><input type='file' style='display: none;' name='file' id='file"+count+"' accept='image/jpeg' />"
				+"<img id='photo"+count+"' src='${contextRoot}/img/cook.jpg' width='150' /></label>"
				+"step_description:<textarea name='step_description' id='step_description'></textarea>"
				+"<input type='submit' value='送出' /></form>";
			step.innerHTML += newstep;
			//當選擇檔案改變,預覽突改變
			$("#file"+count).change(function(){
	 			readURL(this,count);
	 		});	
			//隱藏新增紐
			document.getElementById("newstep").setAttribute("style","display:none");		
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
	
	//上傳步驟
	$(function(){
		tableele.innerHTML+="<input type='button' onclick='newstep()' value='新增食譜' id='newstep'/>"	
	});
	 </script>	
</body>
</html>