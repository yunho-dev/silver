<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>은빛 우산</title>


<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">

<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg"
	type="image/x-icon">

</head>

<body>
<%
int hope = (int)session.getAttribute("hope");
System.out.println(hope);
%>
    <div id="app">
	<c:set var = "power" scope = "session" value = "${hope}"/>
		<c:choose>
		<c:when test="${power == 1}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:when test="${power == 2}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
		<jsp:include page="../sidebar.jsp"></jsp:include>
		</c:otherwise>
		</c:choose>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>

			<div class="page-heading">
				<h3>프로그램 카테고리</h3>

			</div>

			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<input id="writebutton" type="button" class="btn btn-primary" value="카테고리 등록" style="margin-bottom:10px;" onclick='categoryWrite()'>
							<div class="d-flex align-items-center">
								<table class="table table-bordered table-hover"
									style="text-align: center;">
									<thead>
										<tr>
											<th>순번</th>
											<th class="col-md-6">카테고리이름</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="list">

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</section>
			</div>

			<!--footer-->
			<footer>
				<div class="footer clearfix mb-0 text-muted">
					<div class="float-start">
						<p>2023 Final Project</p>
					</div>
					<div class="float-end">
						<p>
							Create With <span class="text-danger"><i
								class="bi bi-heart"></i></span> by <a href="http://ahmadsaugi.com">Gudi</a>
						</p>
					</div>
				</div>
			</footer>
			<!--footer-->
		</div>
	</div>
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendors/apexcharts/apexcharts.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>

<script>
//프로그램카테고리 리스트 뽑기
listCall();

//프로그램카테고리 리스트 불러오는 ajax함수
function listCall(){
	$.ajax({
		type:'GET',
		url:'listCall',
		data:{},
		dataType:'JSON',
		success:function(data){
				console.log(data);
				console.log("11");
				drawList(data.list);//data에 있는 list를 전달받을거다
		},
		error:function(e){
			console.log(e);
		}
	});
	
}

//프로그램카테고리 그리는 함수
function drawList(list){
	var content = '';
	for(var i=0;i<list.length;i++){
		content +='<tr>';
		content +='<td>'+list[i].pc_idx+'</td>';
		content +='<td>'+list[i].pc_cate+'</td>';
		content += "<td>"
			+ "<button class='btn btn-primary btn-sm' onclick=location.href='CategoryUpdate?pc_idx="+list[i].pc_idx+"'>수정하기</button>"
			+ "</td>";
		content +='</tr>';
	}
	$("#list").empty();
	$("#list").append(content);
}
//글쓰기버튼 클릭시 페이지 이동
function categoryWrite(){
	console.log('글쓰기 버튼 누르셧죠?');
	location.href='categoryWrite';
}



</script>

</html>