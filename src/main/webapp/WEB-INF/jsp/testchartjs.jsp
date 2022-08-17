<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>測試報表圖</title>
 <!-- Chart.js v2.4.0 要加入這段 才可以使用 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>

<body>
<canvas id="example" width="400" height="200"></canvas>
  <script>
  	var ctx = document.getElementById( "example" ),
  		example = new Chart(ctx, {
  			// 參數設定[註1]
  			type: "bar", // 圖表類型
  			data: {
  				labels: [ "Red", "Green", "Blue" ], // 標題
  				datasets: [{
  					label: "# of Votes", // 標籤
  					data: [ 12, 19, 3 ], // 資料
  					backgroundColor: [ // 背景色
  					"#FF0000",
  					"#00FF00",
  					"#0000FF",
  					],
  					borderWidth: 1 // 外框寬度
  				}]
  			}
  		});
  </script>
</body>
</html>