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
<link rel="stylesheet" href="richtexteditor/rte_theme_default.css" />
<script type="text/javascript" src="richtexteditor/rte.js"></script>
<script type="text/javascript"
		src='richtexteditor/plugins/all_plugins.js'></script>
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
			<!-- 여기 안에서 개발  -->
			<div class="page-heading">
				<h3>결재 양식 수정</h3>
			</div>
			<div class="page-content">
				<section class="row">
				
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<form action="payformupdate.do" method="post">
						<input type="hidden" name="pf_idx" value="${payformUpdate.pf_idx}">
							<div class="d-flex align-items-center">
							 <table class="table table-bordered table-hover" style="text-align: center;">
								<tbody id="allpaydetail">
										<tr>
											<th class="col-md-2">결재 양식</th>
											<td>
											<select id="selected" name="selected">
												<option
													<c:if test="${payformUpdate.pf_cate eq '휴가'}">selected</c:if>>
													휴가
												</option>
												<option
													<c:if test="${payformUpdate.pf_cate eq '지출결의서'}">selected</c:if>>
													지출결의서
												</option>
												<option
													<c:if test="${payformUpdate.pf_cate eq '품의서'}">selected</c:if>>
													품의서
												</option>
												<option
													<c:if test="${payformUpdate.pf_cate eq '경위서'}">selected</c:if>>
													경위서
												</option>
											</select>
											
											</td>
										</tr>
										<tr>
											<th class="col-md-2">제목</th>
											<td>
										<input type="text" class="form-control" aria-label="Username" 
										aria-describedby="basic-addon1" name="pf_title" value="${payformUpdate.pf_subject}">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<div id="div_editor"></div>
												<div id="content" style="display: none;">${payformUpdate.pf_content}</div>
											<input type="hidden" style="display: none;" name="pf_content" value='${payformUpdate.pf_content}'/>
											</td>
										</tr>
								</tbody>
							 </table>
<!-- 								 <div id="content" style="display: none;"> -->
<!-- 								</div> -->
							</div>
							<button type="button" class="btn btn-primary" onclick="save()">수정하기</button>
							<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
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
var config = {};
config.editorResizeMode = "none"; // 에디터 크기조절 안됨

config.file_upload_handler = function(file, pathReplace) {
	console.log(file); // 파일 정보 확인 가능
	if (file.size > (1 * 1024 * 1024)) { // 1MB 이상의 사진일 경우..
		alert("1MB 이상의 사진은 올릴 수 없습니다.");
		pathReplace("/img/noimage.png"); // data:image 경로를 변경
	}
}

var editor = new RichTextEditor("#div_editor", config);
editor.setHTMLCode($("#content").html());
function save() {
	$("input[name='pf_content']").val(editor.getHTMLCode());
	console.log($("#selected").val());
	$("form").submit();
}
</script>
</html>