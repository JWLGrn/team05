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
    height: 50px;
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
.btn{
	background-color: olive;
}
</style>
</head>
<body>

<h1>Step</h1>
<button onclick="addStep()">新增步驟</button>
<form action="addStep" method="post" enctype="multipart/form-data">
食譜Id:<input name="recipeId" type="hidden" value="${recipeId}" /><br/>
步驟:<input name="step" type="hidden" value="1"/>1
照片:<label id="a"><img id="stepImg" src="${contextRoot}/image/step/file.jpg"/>
    <input name="stepPhoto" type="file" onchange="stepchange(event,stepImg)" accept=".png, .jpg, .jpeg" style="display:none;"/></label> 
敘述<textarea name="stepDescript">敘述</textarea><br/>
<div id="step"></div>
<button>送出</button>
</form>

<h1>顯示步驟</h1>
<button id="stepupdate">修改</button>
<% int count=0; %>
<form action="addStep" method="post" enctype="multipart/form-data">
<input name="recipeId" type="hidden" value="${recipeId}" />
<c:forEach var="stepdata" items="${allStep}">
<% count++; %>
步驟:<span id="a<%=count%>">${stepdata.step}</span>
圖片:<span id="b<%=count%>"><img src="${contextRoot}/image/step/${stepdata.stepPhoto}"></span>
敘述:<span id="c<%=count%>">${stepdata.stepDescription}</span>
<br/>
</c:forEach>
<button id="stepsubmit">送出</button>
</form>




<script type="text/javascript">
let count = 2; //步驟
function addStep(){
var addsteps='<div id="step'+count+'">步驟:<input name="step" type="hidden" value="'+count+'"/>'+count
 +'照片:<label><img id="stepImg'+count+'" src="${contextRoot}/image/step/file.jpg"/>'
 +'<input name="stepPhoto" type="file" onchange="stepchange(event,stepImg'+count+')" accept=".png, .jpg, .jpeg" style="display:none;"/></label>'
 +'敘述<textarea name="stepDescript">敘述</textarea><br/>'
 +'<span class="btn" onclick="removestep('+count+')">移除</span><div>';
 $("#step").append(addsteps);
 count++;
}
//步驟圖片顯示用(跟步驟一樣)
function stepchange(event,imgid){   
   //img預覽
  console.log(imgid.id);
  const fr = new FileReader();
  fr.onload = function (e) {
    $('#'+imgid.id+'').attr('src', e.target.result);
  };
  fr.readAsDataURL(event.target.files[0]);
}
//移除步驟
function removestep(step){
	console.log("step"+step);
	var i=document.getElementById("step"+step);
	console.log(i.id);
	document.getElementById("step").removeChild(i);
	count--;
}
//網頁載入
$(document).ready(function(){	
	$("#stepsubmit").hide();
});
//修改
$("#stepupdate").click(function(){
  $("#stepupdate").hide();
  $("#stepsubmit").show();
  let stepcount="<%=count%>";
  for(let i=1;i<=stepcount;i++){
    $("#a"+i).before('<input type="hidden" value=" '+$("#a"+i).text()+' " name="step">');
    $("#b"+i).before('<input type="file" name="stepPhoto">');
    $("#c"+i).before('<textarea name="stepDescript">'+$("#c"+i).text()+'</textarea>');
    $("#c"+i).remove();
  }
 // console.log("<%=count%>");
  
});
//修改後送出
$("#stepsubmit").click(function(){
});
</script>	
</body>
</html>