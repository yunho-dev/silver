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
<link rel="stylesheet" href="res/style.css" />
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
	src='richtexteditor/plugins/all_plugins.js'></script>
	
</head>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- 여기 안에서 개발  -->
			<div class="page-heading">
				<h3>카테고리명 상세보기</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card">
						<div class="card-body py-4 px-5">
						<form action="programDetailUpdate" method="post">
							<input type="hidden" name="pr_idx" value="${list.pr_idx}">
								<div class="d-flex align-items-center">
									<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">프로그램명</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_name" value="${list.pr_name}" autofocus>
									</div>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">강사명</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_teacher" value="${list.pr_teacher}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">시작시간</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_start" value="${list.pr_start}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">끝시간</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_end" value="${list.pr_end}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">내용</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_content" value="${list.pr_content}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">목표</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_goal" value="${list.pr_goal}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">장소</span> 
										<input type="text" class="form-control" aria-label="Username" 
											aria-describedby="basic-addon1" name="pr_place" value="${list.pr_place}" autofocus>
								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">상태</span> 
										
										<select name="pr_state">
												<option
												<c:if test="${list.pr_state eq '진행예정'}">selected</c:if>>
													진행예정
												</option>
												<option
													<c:if test="${list.pr_state eq '진행중'}">selected</c:if>>
													진행중
												</option>
												<option
													<c:if test="${list.pr_state eq '종료'}">selected</c:if>>
													종료
												</option>
										</select>

								</div>
								<div class="input-group mb-3">
										<span class="input-group-text" id="basic-addon1">카테고리번호</span> 
										
									<select name="pc_idx">
										<option
										<c:if test="${list.pc_idx == 1}">selected</c:if>>
										사고능력향상
										</option>
										<option
										<c:if test="${list.pc_idx == 2}">selected</c:if>>
										운동능력향상
										</option>
										<option
										<c:if test="${list.pc_idx == 3}">selected</c:if>>
										인지능력향상
										</option>
									</select>
									<input type="hidden" name="pc_idxTwo" value="${list.pc_idx}">
									<!-- name이랑 value를 사용자에게 보여주지 않고 넘길때 hidden 사용 -->
								</div>
									
							<!-- 바텀 버튼 -->	
							<button type="submit" class="btn btn-primary">수정완료</button>
							<button type="button" class="btn btn-secondary"
								onclick="location.href='programList'">뒤로가기</button>
							</form>
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


</script>
</html>