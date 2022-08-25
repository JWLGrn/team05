<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextRoot" value="${pageContext.request.contextPath }" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者檢舉信件瀏覽</title>
</head>
<body>

<button type="button" onclick="reportReply()">檢舉信件</button>
<div id="adminReport"></div>
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
}

</script>

</body>
</html>