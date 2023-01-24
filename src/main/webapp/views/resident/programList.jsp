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
<script src="assets/js/jquery.twbsPagination.js"></script>

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
				<h3>입소자 프로그램</h3>
			</div>
			
			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<input id="programwritebutton" type="button" class="btn btn-primary" value="프로그램 등록" style="margin-bottom:10px;" onclick='programWrite()'>
							<div class="d-flex align-items-center">
								<table class="table table-bordered table-hover"
									style="text-align: center;">
									<thead>
										<tr>
											<th>순번</th>
											<th>프로그램명</th>
											<th>강사명</th>
											<th>시작시간</th>
											<th>종료시간</th>
											<th>카테고리</th>
											<th></th>
										</tr>
									</thead>
									<tbody id="list">

									</tbody>
								</table>
							</div>
						</div>
						
						<!-- pagination -->
						<div class="card-body py-4 px-5" style="margin:0 auto;">
							<div id="pagint">
								<div class="container">
									<nav aria-label="Page navigation" style="text-align: center;">
										<ul class="pagination" id="pagination"></ul>
									</nav>
								</div>
							</div>
						</div>
						<!-- pagination -->
						
						

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
var page = 1;

//프로그램 리스트뽑기
AjaxCall(page);

//프로그램 리스트를 불러오는 ajax함수
function AjaxCall(page) {
	$.ajax({
		type : 'get',
		url : 'ProgramListCall.ajax',
		dataType : 'json',
		data : {
			"page" : page
		},
		success : function(data) {
			drawList(data.list);//Controller 에서 put으로 list라는 이름에 담아줄걸 가져온다
// 			btnChk(data.sessionLevel);
			session=data.SessionID;
			$("#pagination").twbsPagination({
				startPage : 1 // 시작 페이지
				,totalPages : data.page_idx // 총 페이지 수
				,visiblePages : 4 // 기본으로 보여줄 페이지 수
				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
					AjaxCall(page);
				}
			});
		},
		error : function(e) {
			console.log(e);
		}
	});

}

//프로그램 리스트를 그리는 함수
function drawList(list){
	var content = '';
	for(var i=0;i<list.length;i++){
		content +='<tr>';
		content +='<td>'+list[i].pr_idx+'</td>';
		content +='<td>'+list[i].pr_name+'</td>';
		content +='<td>'+list[i].pr_teacher+'</td>';
		
		var date = new Date(list[i].pr_start);
		content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ 
		date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
		
		var date = new Date(list[i].pr_end);
		content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ 
		date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
		
		content +='<td>'+list[i].pc_cate+'</td>';
		content += '<td>'
			+ "<button class='btn btn-primary btn-sm' onclick=location.href='programDetail?page=resident&pr_idx="+list[i].pr_idx+"'>상세보기/수정</button>"
			+ "</td>";
			//&는 연결해주는 거임
		content +='</tr>';
	}
	$("#list").empty();
	$("#list").append(content);
}




// listCall();

// function listCall(){
// 	$.ajax({
// 		type:'GET',
// 		url:'ProgramlistCall',
// 		data:{},
// 		dataType:'JSON',
// 		success:function(data){
// 				console.log(data);
// 				console.log("여기는 리스트콜입니다");
// 				drawList(data.programlist);//data에 있는 programlist를 전달받을거다
// 		},
// 		error:function(e){
// 			console.log(e);
// 		}
// 	});
// }

// function drawList(list){
// 	var content = '';
// 	for(var i=0;i<list.length;i++){
// 		content +='<tr>';
// 		content +='<td>'+list[i].pr_idx+'</td>';
// 		content +='<td>'+list[i].pr_name+'</td>';
// 		content +='<td>'+list[i].pr_teacher+'</td>';
		
// 		var date = new Date(list[i].pr_start);
// 		content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ 
// 		date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
		
// 		var date = new Date(list[i].pr_end);
// 		content += "<td>" + date.toLocaleDateString("ko-KR") + " "+ 
// 		date.toLocaleTimeString("en-US", {hour12 : false}) + "</td>";
		
// 		content +='<td>'+list[i].pc_cate+'</td>';
// 		content += '<td>'
// 			+ "<button class='btn btn-primary btn-sm' onclick=location.href='programDetail?pr_idx="+list[i].pr_idx+"'>상세보기/수정</button>"
// 			+ "</td>";
		
// 		content +='</tr>';
// 	}
// 	$("#list").empty();
// 	$("#list").append(content);
// }

function programWrite(){
	console.log("프로그램 등록 버튼 누르셧죠?");
	location.href='programWrite?page=resident';
}

</script>

</html>