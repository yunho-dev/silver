<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
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
</head>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- 여기 안에서 개발  -->
			<div class="page-heading">
				<h3>공지사항 상세보기</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card">
						<div class="card-body py-4 px-5">
							<div class="d-flex align-items-center">
								<table class="table table-bordered table-hover"
									style="text-align: center;">
									<tbody id="list">
										<tr>
											<th></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>


				</section>
			</div>
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
		</div>
	</div>

	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/pages/dashboard.js"></script>
	<script src="assets/js/main.js"></script>
</body>
<script>
	AjaxCall();
function AjaxCall(){
	$.ajax({
		type:'get'
		,url:'notice/list.ajax'
		,dataType:'json'
		,success:function(data){
			console.log(data);
			listCall(data.list);
		}
		,error:function(e){
			console.log(e);
		}
	});
	
	
function listCall(list){
	var content='';
	for (var i = 0; i < list.length; i++) {
		content += "<tr>";
		content += "<td>"+ list[i].bd_idx+ "</td>";
		content += "<td id='id'><a href='notice/detail?bd_idx='"+list[i].bd_idx+">" + list[i].bd_title+ "</td>";
		content += "<td>"+ list[i].mem_name+"</td>";
		var date=new Date(list[i].bd_date);
		content += "<td>" + date.toLocaleDateString("ko-KR")+" "+date.toLocaleTimeString("en-US",{hour12:false}) + "</td>";
		content += "<td>"+"<button class='btn btn-primary' name='update' value="+list[i].bd_idx+">수정하기</button>"+"</td>";
		content += "</tr>";
	}
	$("#list").empty();
	$("#list").append(content);
}
	
	
	
}
</script>
</html>