<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="add" method="POST">
<table>
<tr>
    <td>使用者ID：</td>
    <td><input type="number" name="userId"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>標題：</td>
    <td><input type="text" name="title"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>描述：</td>
    <td><input type="text" name="descript"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>份數(人)：</td>
    <td><input type="number" name="people"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>時間：</td>
    <td><input type="number" name="time"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>圖片：</td>
    <td><input type="text" name="photo"></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>食材1：</td>
    <td><input type="text" name="foods"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01"></td>
</tr>
<tr>
    <td>食材2：</td>
    <td><input type="text" name="foods"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01"></td>
</tr>
<tr>
    <td>食材3：</td>
    <td><input type="text" name="foods"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01"></td>
</tr>
<tr>
    <td>食材4：</td>
    <td><input type="text" name="foods"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01"></td>
</tr>
<tr>
    <td>食材5：</td>
    <td><input type="text" name="foods"></td>
    <td>克數：</td>
    <td><input type="number" name="gram" step="0.01"></td>
</tr>

</table>
<button type="submit">送出</button>
</form>
</body>
</html>