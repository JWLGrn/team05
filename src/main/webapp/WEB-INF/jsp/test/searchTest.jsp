<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="chosen.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="chosen.jquery.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/6202e6a882.js" crossorigin="anonymous"></script>
</head>
<body>
<form action="">
<select name="classify" id="">
    <option value="1">找食譜</option>
    <option value="2">找作者</option>
</select>
<input type="text" name="keywords">
<button>查詢</button>
</form>

<form action="find/recipe/food" method="get">
    <input type="checkbox" id="vehicle1" name="foods" value="肉類">
    <label for="vehicle1"> 肉類</label><br>
    <input type="checkbox" id="vehicle2" name="foods" value="魚貝類">
    <label for="vehicle2"> 魚貝類</label><br>
    <input type="checkbox" id="vehicle3" name="foods" value="蔬菜類">
    <label for="vehicle3"> 蔬菜類</label><br><br>
<br>
    <input type="checkbox" id="keywords1" name="keywords" value="中式">
    <label for="keywords1"> 中式</label><br>
    <input type="checkbox" id="keywords2" name="keywords" value="美式">
    <label for="keywords2"> 美式</label><br>
    <input type="checkbox" id="keywords3" name="keywords" value="日式">
    <label for="keywords3"> 日式</label><br><br>
<button>查詢</button>
</form>

<i class="fa-solid fa-cloud-hail-mixed"></i>
</body>
<script>


</script>
</html>