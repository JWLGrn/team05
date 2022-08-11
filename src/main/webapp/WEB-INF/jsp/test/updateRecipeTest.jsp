<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<h3>修改頁面</h3>
<form action="updateTest" method="POST">
<table>

<tr>
    <td>使用者ID：</td>
    <td><input type="text" name="userId" value="${recipe.users.userId}" readonly></td>
    <td>(不可修改)</td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>食譜ID：</td>
    <td><input type="text" name="recipeId" value="${recipe.recipeId}" readonly></td>
    <td>(不可修改)</td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>標題：</td>
    <td><input type="text" name="title" value="${recipe.cookTitle}"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>描述：</td>
    <td><input type="text" name="descript" value="${recipe.cookDescription}"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>份數(人)：</td>
    <td><input type="number" name="people" value="${recipe.cookServe}"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>時間：</td>
    <td><input type="number" name="time" value="${recipe.cookTime}"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>圖片：</td>
    <td><input type="text" name="photo" value="${recipe.cookPhoto}"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>食材：</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
</table>
<table class="foodtable">
<c:forEach items="${recipe.recipeFoods}" var="rf">
<tr>
    <td>名稱：</td>
    <td><input type="text" name="foods" value="${rf.foods.foodsName}"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01" value="${rf.gram}"></td>
    <td><button class="removeFood">-</button></td>
</tr>
</c:forEach>
</table>
<tr>
    <td>標籤：</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<table class="tagtable">
<c:forEach items="${recipe.recipeKeyword}" var="rk">
<tr>
    <td><input type="text" name="tags" value="${rk.keyword.keyword}"></td>
    <td><button class="removeTags">-</button></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
</c:forEach>
</table>
<button type="button" id="addFood">新增食材+</button> <button type="button" id="addTag">新增標籤+</button>


<button type="submit">送出</button>
</form>
<script>

$("#addFood").click(function(){
   let food = '<tr>'
    +'<td>名稱：</td>'
    +'<td><input type="text" name="foods"></td>'
    +'+<td>克數：</td>'
    +'<td><input type="number" name="gram" step="0.01""></td>'
    +'<td><button class="removeFood">-</button></td>'
    +'</tr>'
    $(".foodtable").append(food);
})

$("#addTag").click(function(){
    let tags = '<tr>'
        +'<td><input type="text" name="tags" value="${rk.keyword.keyword}"></td>'
        +'<td><button class="removeTags">-</button></td>'
        +'<td></td>'
        +'<td></td>'
        +'<td></td></tr>'
    $(".tagtable").append(tags);
})

$(".removeTags").click(function(){
    $(this).parents("tr").remove();
})

$(".removeFood").click(function(){
    $(this).parents("tr").remove();
})

</script>
</body>
</html>