<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
<body>

<form action="addStep" method="post" enctype="multipart/form-data">
<div class="step-group">
<div class="step-single">
照片:<img id="stepImg"/>
     <input name="stepPhoto" type="file" onchange="photochange(event,stepImg)" accept=".png, .jpg, .jpeg"/> 
     敘述<textarea name="stepDescript">敘述</textarea>
     </div> 
    </div>
    <button>送出</button>    
  </form>
<button id="addstep">新增步驟</button>  

<script type="text/javascript">
var singlestep = '<div class="step-single">'
				+'照片:<img id="stepImg"/>'
				+'<input name="stepPhoto" type="file" onchange="photochange(event,stepImg)" accept=".png, .jpg, .jpeg"/>'
				+'敘述<textarea name="stepDescript">敘述</textarea>'
				+' </div>'
$("#addstep").click(function(){
	$(".step-group").append(singlestep);
})

</script>
</body>
</html>