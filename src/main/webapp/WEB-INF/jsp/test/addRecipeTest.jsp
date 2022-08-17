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
</head>
<body>
<form action="add" method="POST" enctype="multipart/form-data">
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
    <td><input type="file" name="photo"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>步驟：</td>
    <td><input type="text" name="stepDescript"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>圖片：</td>
    <td><input type="file" name="stepPhoto"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>步驟：</td>
    <td><input type="text" name="stepDescript"></td>
    <td></td>
    <td></td>
    <td></td>
</tr>
<tr>
    <td>圖片：</td>
    <td><input type="file" name="stepPhoto"></td>
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
    <td><select class="foods" name="foods" aria-valuenow="食材1"></select></td>
    <td>重量：</td>
    <td><input type="number" name="gram" step="0.01">克</td>
    <td><button type="button" class="removeFood">-</button></td>
</tr>
</table>
<!------------------------------>

<!------------標籤區------------>
<table class="tagtable">
<tr>
    <td>標籤：</td>
    <td>
        <select class="tags" multiple style="width: 300px"  data-placeholder="請選擇標籤" name="tags">
        </select>   
    </td>
    <td></td>
    <td></td>
    <td></td>
</tr>
</table>
<!------------------------------>
</table>
<button type="button" id="addFood">新增食材+</button>
<br>
    
<button type="submit">送出</button>
</form>
<script>

//增加食材標籤
$("#addFood").click(function(){
    var t = '<tr>'
        +'<td>名稱：</td>'
        +'<td><select class="foods" name="foods">'+foodList+'</select></td>'
        +'<td>重量：</td>'
        +'<td><input type="number" name="gram" step="0.01">克</td>'
        +'<td><button type="button" class="removeFood">-</button></td>'
        +'</tr>'
    $(".foodtable").append(t);
    $(".foods").chosen({
        no_results_text:"查無結果",
    search_contains:true
  });
})

$(".removeFood").click(function(){
    $(this).parents("tr").remove();
})

//新增foodList
var foodSettings = {
  "url": "http://localhost:8090/cookblog/find/foods/all",
  "method": "GET",
  "timeout": 0,
};
var foodList = '';
$.ajax(foodSettings).done(function (response) {
  
  for(i in response){
    foodList += '<option value="'+ response[i].foodsName +'">'+ response[i].foodsName +'</option>';
  }
  $(".foods").append(foodList);
  $(".foods").chosen({
    no_results_text:"查無結果",
    search_contains:true
  });
});

//新增KeywordList
var keywordSettings = {
  "url": "http://localhost:8090/cookblog/find/keyword/all",
  "method": "GET",
  "timeout": 0,
};
$.ajax(keywordSettings).done(function (response) {
    var keywordList = '';
    for(i in response){
        keywordList += '<option value="'+ response[i].keyword +'">'+ response[i].keyword +'</option>';
  }
  $(".tags").append(keywordList);
  $(".tags").chosen({
    no_results_text:"查無結果",
    search_contains:true
  });
});

</script>
</body>
</html>