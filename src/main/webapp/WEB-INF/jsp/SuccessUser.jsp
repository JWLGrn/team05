<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊成功</title>
<link rel="stylesheet" href="chosen.min.css">
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="chosen.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="chosen.jquery.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body onload="Favorite();report()" >
會員名稱: ${result.userName}
<img  src="users/${result.userPhoto}" width="300"><br>
${loginUser.getUserName() }
<div ></div>
<!-- <button type="button" onclick="Favorite()" >食譜ID</button> -->
案讚測試功能:<div  id="myDiv"></div>
檢舉測試功能:<div id="findUser"></div>
 
查看User資料測試:${result }<br>
查看資料測試怎麼看不到?:${result.recipe }<br>
查看資料測試怎麼看不到02?:${result.favorite }<br>
 
<a href="users/updatemember?user_id=${result.userId }">修改會員資料</a>
<a href="${pageContext.request.contextPath }/users/logout"><input type="button" value="登出" ></a><br>
<script>
function Favorite()
{
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
var content ='';
             var recipe=JSON.parse(xhr.responseText);
             for(var i =0;i<recipe.length;i++){
            	 content+= '<a href="' + "${contextRoot}/favorite?recipe_id="+recipe[i].recipeId+"&&user_id=${result.userId }" + '">'
            	 +'<img src="break.jpg" width="40">'+ 
            	 recipe[i].cookTitle + '</a>';
            	 console.log(recipe[i].recipeId);
             }
             document.getElementById("myDiv").innerHTML=content;
  }
});

xhr.open("GET", "http://localhost:8090/cookblog/finder",true);

xhr.send();
}

function report(){
	var xhr = new XMLHttpRequest();
	xhr.withCredentials = true;

	xhr.addEventListener("readystatechange", function() {
	  if(this.readyState === 4) {
		  var content ='';
		  var report=JSON.parse(xhr.responseText);
		  for(var i =0;i<9;i++){
		  content+= '<a href="' + "${contextRoot}/users/report?user_id="+report[i].userId+"&&user_id=${result.userId }" + '">'
     	 +'<img src="report.jpg" width="40">'+ 
     	report[i].userName + '</a>';
	    console.log(this.responseText);
	    content+='<a>'
	    document.getElementById("findUser").innerHTML=content;
		  }
	  }
	});

	xhr.open("GET", "http://localhost:8090/cookblog/findUsers",true);

	xhr.send();
}
</script>


</body>
</html>