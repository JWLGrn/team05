<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="chosen.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="chosen.jquery.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
	<div>紅色->已點讚的狀態(資料庫有關聯)，再點擊會取消讚</div>     
	<div>白色->未點讚的狀態(資料庫無關聯)，點擊資料庫會新增關聯</div>
	<img src="${contextRoot}/checkfavor/1/1" id="favor" data-user="1"
		data-recipe="1">
		
		
	<script>
	$("#favor").click(function(e){
    let userid = $(this).data("user");
    console.log(userid)
    let recipeid = $(this).data("recipe");
    console.log(recipeid)

    let settings = {
        "url": "${contextRoot}/pressfavor/"+userid+"/"+recipeid,
        "method": "POST",
        "timeout": 0,
    };

    	$.ajax(settings).done(function(response){
		var imgUrl = "${contextRoot}/checkfavor/"+userid+"/"+recipeid+"?time="+Math.random()
    	console.log(imgUrl)
    	$(e.target).attr("src",imgUrl);
    	
    })
})


</script>
</body>
</html>