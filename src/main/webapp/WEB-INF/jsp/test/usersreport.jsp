<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html>
<head>
<meta charset="UTF-8">
<title>檢舉頁面</title>
</head>
<body>


<form action="${contextRoot}/users/reportSuccess" method="get">
被檢舉者ID:<input name="getAuthorUser" type="text" value="${getAuthorUser.userId }"><br>
檢舉者ID:<input name="usering" type="text" value="${usering.userId }"><br>
檢舉時間:<input name="reportTime" type="text" value=" ${date }"><br>
檢舉類型:<select name="reportType" >
  <option selected>請選擇</option>
  <option value="1-不實料理">不實料理</option>
  <option value="2-完成度困難">完成度困難</option>
  <option value="3-不雅照片" >不雅照片</option>
</select><br>
檢舉內容:<div ><textarea name="reportContext" ></textarea></div><br>
<button>送出</button><br>



</form>
被檢舉者資料這裡:${getAuthorUser }<br>

 檢舉者資料Session!!!!!!!!!!!!!!!!!!!這裡喔:${usering }<br>
 
 
</body>
</html>