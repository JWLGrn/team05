<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有食材</title>
</head>
<body>

<select>
<c:forEach items="${option}" var="f">
 <option>${f}</option>
</c:forEach>
</select>

<c:forEach items="${page.content}" var="f">
<div>
<form class="form" method="post" action="${contextRoot}/editFoods">
<input  type="hidden" name="foodsId" value="${f.foodsId}"/>
<input  name="foodsName" value="${f.foodsName}" />
<input  name="foodsType" value="${f.foodsType}" />
<input  name="calorie" value="${f.calorie}" />
<button type="submit" class="btn btn-primary">送出</button>
<a href="${contextRoot}/deleteFood/${f.foodsId}"><button  type="button" class="btn btn-primary btn-sm">刪除</button></a>
						
</form>
</div>
</c:forEach>


<div class="row justify-content-center">
			<div class="col-8">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
				<c:choose>
					<c:when  test="${page.number != pageNumber -1}">
					<a href="${contextRoot}/showAllFoods123?p=${pageNumber}">
							${pageNumber} </a>
					</c:when>
					<c:otherwise>
				       ${pageNumber}
				    </c:otherwise>
				</c:choose>
				</c:forEach>
			</div>
		</div>

</body>
</html>