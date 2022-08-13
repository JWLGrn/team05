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
</head>
<body>
會員名稱: ${result.userName}
<img  src="users/${result.userPhoto}" width="300"><br>

${loginUser.getUserName() }

<a href="${pageContext.request.contextPath }/users/logout"><input type="button" value="登出" ></a><br>
<button type="button" onclick="loadXMLDoc()" >食譜ID</button>
<div  id="myDiv"></div>
 
查看資料:${result }<br>
 
 <a href="users/updatemember?user_id=${result.userId }">修改會員資料</a>
<!--  目前沒有recipeid -->
  <div id="love"><img src="break.jpg" onclick="heart()"></div>  
<script>
function loadXMLDoc()
{
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
var content ='';
             var recipe=JSON.parse(xhr.responseText);
             for(var i =0;i<recipe.length;i++){
            	 content+= '<a href="' + "${contextRoot}/favorite?recipe_id="+recipe[i].recipeId+"&&user_id=${result.userId }" + '">' + 
            	 recipe[i].cookTitle + '</a><br>';
            	 console.log(recipe[i].recipeId);
             }
             document.getElementById("myDiv").innerHTML=content;
//     console.log(this.responseText);
  }
});

xhr.open("GET", "http://localhost:8090/cookblog/finder",true);

xhr.send();
}
////////////////
function heart()
{
	var xhttp = new XMLHttpRequest();	
	xhttp.onreadystatechange=function()
	{
		if (xhttp.readyState==4 && xhttp.status==200)
		{
			document.getElementById("love").innerHTML=xhttp.responseText;
			
		}
	}
	xhttp.open("GET","${contextRoot}/heart",true);
	xhttp.send();
}



</script>
</body>
</html>