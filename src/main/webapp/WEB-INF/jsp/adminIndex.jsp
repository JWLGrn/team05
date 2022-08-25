<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="bootstrap.min.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<!-- Favicon -->
    <link rel="shortcut icon" href="favicon.png">
    <!-- Normalize Css -->
    <link rel="stylesheet" href="${contextRoot}/css/normalize.css">
    <!-- Main Css -->
    <link rel="stylesheet" href="${contextRoot}/css/main.css">
    <!-- Bootstrap Css -->
    <link rel="stylesheet" href="${contextRoot}/css/bootstrap.min.css">
    <!-- Animate CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/animate.min.css">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/fontawesome-all.min.css">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/flaticon.css">
    <!-- Summernote CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/summernote.css">
    <!-- Owl Carousel CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextRoot}/css/owl.theme.default.min.css">
    <!-- Select 2 CSS -->
    <link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
    <!-- Custom Css -->
    <link rel="stylesheet" href="${contextRoot}/css/style.css">
    <!-- Modernizr Js -->
    <script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}
</style>
<title>系統管理首頁</title>
</head>
<body >
<jsp:include page="layout/navbar.jsp"/>
<jsp:include page="adminMenu.jsp"></jsp:include>
<div class="w3-main" style="margin-left:220px;">
<h1>系統管理首頁</h1>
</div>
<div class="row justify-content-center w3-main" style="margin-left:220px;">
<button type="button" onclick="reportReply()">檢舉信件</button>
<button onclick="chartjstest02()">切換長條圖</button>
<button onclick="chartjstest()" >切換圓餅圖</button>
<canvas id="myChart" width="200" height="100"  class="float" style="display:none;"></canvas>
<canvas id="myChart2" width="450" height="100"  class="float" style="display:none;"></canvas>
<div id="adminReport" style="display:none; width: 20; height: 10" ></div>
</div>
<script >
var content =[];

function chartjstest(){
	var ctx = document.getElementById('myChart');
	var count=0;
	var xhr = new XMLHttpRequest();
	xhr.withCredentials = true;

	xhr.addEventListener("readystatechange", function() {
	  if(this.readyState === 4) {
		  var data = JSON.parse(this.responseText);
		  for(var i =0;i<1000;i++){
			   content +=data[i].foodsName;
			   console.log(data[i].foodsName+"1");
			   count=count+1;
			   
		  }
		  
		  console.log(count+"1");
		  console.log(data[i].foodsName+"2");
	 
		var myChart = new Chart(ctx, {
		  type: 'pie',
		  data: {
		     labels: ['一月', '二月', '三月','四月','五月','六月'], //橫軸
		     datasets: [{
		       backgroundColor: [
		         'rgba(255, 99, 132, 0.2)',
		         'rgba(54, 162, 235, 0.2)',
		         'rgba(255, 206, 86, 0.2)'
		       ],
		       borderColor: [
		         'rgba(255,99,132,1)',
		         'rgba(54, 162, 235, 1)',
		         'rgba(255, 206, 86, 1)',
		         'rgba(75, 192, 192, 1)'
		       ],
		       borderWidth: 1,
		       label: '銷售業績(百萬)',
		       data: [count, 49, 72,50,588,55]  //縱軸
		     }]
		  }
		})
		  
	  }	  
	});
	xhr.open("GET", "http://localhost:8090/cookblog/find/foods/all",true);
	xhr.send();
	$("#myChart").show();
	$("#myChart2").hide();
	$("#adminReport").hide();
}
</script>
<%-- <canvas id="example" width="800" height="100"></canvas> --%>
  <script>
  function chartjstest02(){
  	var ctx = document.getElementById( "myChart2" ),
  		example = new Chart(ctx, {
  			// 參數設定[註1]
  			type: "bar", // 圖表類型
  			data: {
  				labels: [ "Red", "Green", "Blue" ], // 標題
  				datasets: [{
  					label: "# of Votes", // 標籤
  					data: [ 12, 19, 3 ], // 資料
  					backgroundColor: [ // 背景色
  					"#ff6384",
  					"#36A2EB",
  					"#FFCE56",
  					],
  					borderWidth: 1 // 外框寬度
  				}]
  			}
  		});
  	$("#myChart2").show();
  	$("#myChart").hide();
  	$("#adminReport").hide();
  }
  </script>
  <script type="text/javascript">
function reportReply(){
var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
	  var content = "<table border='1'>";
	  var reportreply=JSON.parse(xhr.responseText);
	  content += "<tr><th>檢舉ID</th><th>檢舉內容</th><th>檢舉時間</th><th>檢舉類型</th>" 
			 + "<th>處理狀態</th><th>寄送信箱</th></tr>";
	  for(var i =0;i<reportreply.length;i++){
	  content += "<tr><td align='center'>" + reportreply[i].reportId + "</td>" 
		+ "<td>" + reportreply[i].reportContext + "</td>"
		+ "<td>" + reportreply[i].reportTime + "</td>"
		+ "<td align='right'>" + reportreply[i].reportType + "</td>" 
		+ "<td>" + reportreply[i].reportStatus + "</td>"
		+ "<td align='center'>"	+ "<a href='${contextRoot}/adminReplyReportToSendMail?report_id="+reportreply[i].reportId+"'><div >"+'回覆檢舉'+"</div></a>"
		+ "</td>" + "<td></tr>";
	  
	    
	  
	  }
    console.log(this.responseText);
    console.log(reportreply.length);
    document.getElementById("adminReport").innerHTML=content;
  }
});


xhr.open("GET", "http://localhost:8090/cookblog/adminReplyReport",true);

xhr.send();
$("#adminReport").show();
$("#myChart").hide();
$("#myChart2").hide();
}

</script>
</body>
</html>