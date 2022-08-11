<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
</head>
<body>
<form action="add" method="POST">
<table>
<tr>
    <td>使用者ID：</td>
    <td><input type="number" name="userId"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>標題：</td>
    <td><input type="text" name="title"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>描述：</td>
    <td><input type="text" name="descript"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>份數(人)：</td>
    <td><input type="number" name="people"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>時間：</td>
    <td><input type="number" name="time"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>圖片：</td>
    <td><input type="text" name="photo"></td>
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
<!------------食材區------------>
</table>
<table class="foodtable">
<tr>
    <td>名稱：</td>
    <td><input type="text" name="foods" id="autoc"></td>
    <td>重量：</td>
    <td><input type="number" name="gram" step="0.01">克</td>
    <td><button class="removeFood">-</button></td>
</tr>
</table>
<!------------------------------>

<!------------標籤區------------>
<table class="tagtable">
<tr>
    <td>標籤：</td>
    <td><input type="text" name="tags"></td>
    <td><button class="removeTags">-</button></td>
    <td></td>
    <td></td>
</tr>
</table>
<!------------------------------>
</table>
<button type="button" id="addFood">新增食材+</button> <button type="button" id="addTag">新增標籤+</button>
<br>
<button type="submit">送出</button>
</form>
<script>

$("#addFood").click(function(){
   let food = '<tr>'
    +'<td>名稱：</td>'
    +'<td><input type="text" name="foods"></td>'
    +'<td>重量：</td>'
    +'<td><input type="number" name="gram" step="0.01">克</td>'
    +'<td><button class="removeFood">-</button></td></tr>'
    $(".foodtable").append(food);
})

$("#addTag").click(function(){
    let tags = '<tr>'
    +'<td>標籤：</td>'
    +'<td><input type="text" name="tags"></td>'
    +'<td><button class="removeTags">-</button></td>'
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