<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>測試追蹤功能</title>
</head>
<body>
	<div>追蹤者</div>
	
	<img src="${contextRoot}/checkfavor/4/6" id=follow data-user="4"
		data-follow="6">



	<script>
	${"#follow"}.click(function(e){
		let userid =$(this).data("userid");
		consolg.log(userid);
		let userid =$(this).data("trackid");
		consolg.log(followid);
	})
	
	
	
	
	</script>


</body>
</html>