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
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins">
<!-- Favicon -->
<link rel="icon" href="${contextRoot}/css/favicon.png">
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
<link rel="stylesheet"
	href="${contextRoot}/css/owl.theme.default.min.css">
<!-- Select 2 CSS -->
<link rel="stylesheet" href="${contextRoot}/css/select2.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">
<!-- Modernizr Js -->
<script src="${contextRoot}/js/modernizr-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- //CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">

<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Poppins", sans-serif
}

body {
	font-size: 16px;
}

.w3-half img {
	margin-bottom: -6px;
	margin-top: 16px;
	opacity: 0.8;
	cursor: pointer
}

.w3-half img:hover {
	opacity: 1
}
</style>
<style type="text/css">
.userimg {
	width: 100px;
	height: 100px;
}
</style>

<title>Memeber Manage</title>
</head>
<body>
	<div id="preloader"></div>
	<jsp:include page="layout/navbar.jsp" />
<div class="container-fluid">
<div class="row">
<jsp:include page="adminMenu.jsp"/>
<div class="col-lg-9" style="height:calc(100vh);margin:auto;padding-top:30px;margin-left:300px">
		<label>???????????????:</label> <input id="userName" placeholder="????????????????????????" />
		<table id="userTable" class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th scope="col">???????????????</th>
					<th scope="col">???????????????</th>
					<th scope="col">???????????????</th>
					<th scope="col">???????????????</th>
					<th scope="col">???????????????</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody id="userbody">

				<c:forEach items="${allUsers}" var="u">

					<form class="form" method="get">
						<tr>
							<td><input type="hidden" id="userId${u.userId}" name="userId${u.userId}" value="${u.userId}" /></td>
							<td><img class="userimg" alt=""
								src="${contextRoot}/users/${u.userPhoto}"></td>
							<td>${u.email}</td>
							<td>${u.password}</td>
							<td>${u.userName}</td>
							<td>
								<%
								String[] per = {"??????", "????????????", "?????????"};
								request.setAttribute("per", per);
								%> <select name="permission${u.userId}"
								id="permission${u.userId}">
									<c:forEach begin="0" end="2" step="1" var="i">
										<c:choose>
											<c:when test="${i==u.permission}">
												<option value="${i}" selected>${per[i]}</option>
											</c:when>
											<c:otherwise>
												<option value="${i}">${per[i]}</option>'
									</c:otherwise>
										</c:choose>

									</c:forEach>
							</select>
							</td>
							<td><button type="button"
									class="btn-fill  btn-danger" onclick="sendfromUpdateData(${u.userId})">??????</button></td>
							<td>
								<button type="button" class="btn-fill  btn-danger"
									onclick="deleteUser(${u.userId})">??????</button>
							</td>
						</tr>
					</form>

				</c:forEach>

			</tbody>
		</table>
	</div></div></div>
	<!-- Jquery Js -->
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextRoot}/js/popper.min.js"></script>
	<!-- Bootstrap Js -->
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<!-- Plugins Js -->
	<script src="${contextRoot}/js/plugins.js"></script>
	<!-- Owl Carousel Js -->
	<script src="${contextRoot}/js/owl.carousel.min.js"></script>
	<!-- Summernote JS -->
	<script src="${contextRoot}/js/summernote.min.js"></script>
	<!-- Select 2 Js -->
	<script src="${contextRoot}/js/select2.full.min.js"></script>
	<!-- Smoothscroll Js -->
	<script src="${contextRoot}/js/smoothscroll.min.js"></script>
	<!-- Custom Js -->
	<script src="${contextRoot}/js/main.js"></script>

		<script
			src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready( function () {
	    $('#userTable').DataTable({
	    	"ordering": false,
	    	"searching": false,
	    	language: {
	            "lengthMenu": "?????? _MENU_ ?????????",
	            "sProcessing": "?????????...",
	            "sZeroRecords": "??????????????????",
	            "sInfo": "????????? _MAX_ ?????????",
	            "sInfoEmpty": "???????????? 0 ?????????",
	            "sInfoFiltered": " ",
	            "sInfoPostFix": "",
	            "sSearch": "??????:",
	            "sUrl": "",
	            "sEmptyTable": "???????????????????????????",
	            "sLoadingRecords": "???????????????...",
	            "sInfoThousands": ",",
	            "oPaginate": {
	                "sFirst": "??????",
	                "sPrevious": "?????????",
	                "sNext": "?????????",
	                "sLast": "??????"
	            },
	            "order": [[0, "desc"]],
	            "oAria": {
	                "sSortAscending": ": ?????????????????????",
	                "sSortDescending": ": ?????????????????????"
	            }
	        },
	    });
	} );
		$("#userName").keyup(
						function() {
							let usernameValue = $('#userName').val();
							console.log(usernameValue)
							let urlStr = "${contextRoot}/find/searchUser/" + usernameValue;
							$.ajax({
										url : urlStr,
										type : 'Get',
										datatype : 'text',
										success : function(data) {
											var append1;
											$('#userbody').empty();
											for (var i = 0; i < data.length; i++) {
												const item = data[i];
												console.log(i, item);
												
												
												// ???????????????
												var per = item.permission;
												var selectList = '<select name="permission" id="permission'+item.userId+'">'
												var selectArray = ["??????","????????????","?????????"]
												for(let j=0;j<=2;j++){
													if(j == per){
														selectList += '<option value=' + j + ' selected>' + selectArray[j] + '</option>'
													}else{
														selectList += '<option value=' + j + '>' + selectArray[j] + '</option>'
													}
												}
												selectList += '</select>'
												
												var text = '<tr id="userTr">'+
														 '<form  id="formUser"  class="form" method="get" action="${contextRoot}/editAdminUsers">'
														+ '<td><input  type="hidden" id="userId'+item.userId+'" name="userId" value="'+item.userId+'"/></td>'
														+ '<td><img class="userimg" alt="" src="${contextRoot}/users/'+item.userPhoto+'"></td>'
														+ '<td>'+item.email+'</td>'
														+ '<td>'+item.password+'</td>'
														+ '<td>'+item.userName+'</td>'
														+ '<td>'+selectList+'</td>'
														+ '<td><button id="formButton" onclick="sendfromUpdateData('
														+ item.userId
														+ ')"  class="w3-button w3-red w3-hover-black">??????</button></td>'
														+ '<td><a onclick="deleteUser('+item.userId+')"><button  type="button" class="w3-button w3-red w3-hover-black">??????</button></a></td>'
														+ '</form>' + '</tr>'
												console.log("text", text);
												$("#userbody").append(text);
											}
											console.log("data", data);
										}
									});
						});
		function sendfromUpdateData(userId) {
			const url = "${contextRoot}/editAdminUsers?"
					+"userId="+ $("#userId" + userId).val() + "&"
					+"permission="+ $("#permission" + userId).val()
					console.log($("#userId" + userId).val())
					console.log($("#permission" + userId).val())
					//+ $("#userPhoto" + userId).val() + "/";
			window.location.href = url;
		}
		
		// ?????????????????????
	    function deleteUser(userId){
			Swal.fire({
	        title: '??????',
	    	text: "??????????????????????????????",
	    	icon: 'warning',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: '??????',
	    	cancelButtonText: '??????',
	    }).then((result) => {
	         if (result.isConfirmed) {
	             Swal.fire({
	                title: '??????',
	    	    	text: "?????????????????????",
	    	    	icon: 'success',
	    	    	confirmButtonText: '?????????????????????'
	            }).then((success) => {
	    	    	 if (success.isConfirmed) {
	    		    	 window.location.href = "${contextRoot}/deleteUser/"+userId;
	    	    	 }
	    		 })
	          }
	      })
	    }
	</script>
</body>
</html>