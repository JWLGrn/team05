<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
</head>
<body>
${result.userName}
<img  src="users/${result.userPhoto}" width="300"><br>

${loginUser.getUserName() }

<a href="${pageContext.request.contextPath }/users/logout"><input type="button" value="登出" ></a>
註冊成功<br>

<%--  <div id="love"><a href="${contextRoot}/heart"><img src="break.jpg" onclick="heart()"></a></div>  --%>
 <div id="love"><img src="break.jpg" onclick="heart()"></div> 
<!-- /groupfive/src/main/webapp/image/break.jpg -->
<!-- http://localhost:8090/webapp/image/break.jpg -->
<script>
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