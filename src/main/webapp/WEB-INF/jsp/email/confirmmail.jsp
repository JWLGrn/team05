<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
         <c:set var="contextRoot" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認驗證碼</title>
</head>
<body>
<form action="${contextRoot}/users/confirm/email" method="post">
驗證碼:<input type="text" name="code">
<button>檢驗</button>
</form>
<br>
偷看驗證碼:<br>
${verificationCode}


</body>
</html>