<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>測試追蹤功能</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
<body>
	<div>追蹤者</div>
	<div>白色 未點讚</div>
	<div >黃色 已點讚</div>
	
	<img src="${contextRoot}/imagefollow/4/6" id="follow" data-user="4"
		data-track="6" width="200">
	<div id="aaa"></div>



	<script>
	$("#follow").click(function(e){
		let userid =$(this).data("user");
		console.log(userid);
		let trackid =$(this).data("track");
		console.log(trackid);
		
	    let settings = {
	            "url": "${contextRoot}/associationfollow/"+userid+"/"+trackid,
	            "method": "POST",
	            "timeout": 0,
	        };

	        	$.ajax(settings).done(function(response){
	    		var imgUrl = "${contextRoot}/imagefollow/"+userid+"/"+trackid+"?time="+Math.random()
	        	console.log(imgUrl)
	        	$(e.target).attr("src",imgUrl);
	        	
	        })
	})
	$("#follow").mouseover(function(){
		$("#aaa").html("hello")
	})
	
	
	
	
	</script>


</body>
</html>