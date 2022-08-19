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
<h3>活動新增</h3>
<div id="newevent">
活動id<br/>
活動內容<textarea></textarea><br/>
開始<input type="date"/>
結束<input type="date"/><br/>
圖片<label id="fileload"><img src="${contextRoot}/image/step/file.jpg" id="imgView"/>
   <input type="file" id="finallyPhoto" accept=".png, .jpg, .jpeg" style="display:none;" onchange="imgview(event,imgView)"></label><br/>
	
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
$(document).ready(function(){
	$("#senddata").hide();
	showMyRecipe();
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
					"食譜Id:"+value.recipeId+"_"
					+"食譜名稱:"+value.cookTitle+"_"
					+"<img src='${contextRoot}/image/recipe/"+value.cookPhoto+"' class='img'/>"
					+"敘述:"+value.cookDescription+"<br/>"
				    +"烹調時間:"+value.cookTime+"分鐘_"
					+"食用人數:"+value.cookServe+"人<br/>"			    
				    +"時間:"+value.date; 
					+"卡洛里:"+value.totalCal;	
				replydata+="<button onclick='participate("+value.recipeId+")'>參加活動</button><br/>-----------------------------------------<br/></div>";
			})
			$("#myRecipe").html(replydata);
		});	
}
function participate(recipeId){
	//判斷是否有參加
	//以參加,按鈕必須顯示已參加
	console.log("participate");
}
</script>
</body>
</html>