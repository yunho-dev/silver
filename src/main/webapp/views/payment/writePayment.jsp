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
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		<div id="main">
			<jsp:include page="../upbar.jsp"></jsp:include>
			<!-- 여기 안에서 개발  -->
			<div class="page-heading">
				<h3>결재 문서 등록</h3>
			</div>
			<div class="page-content">
				<section class="row">
					<div class="card" id="table">
						<div class="card-body py-4 px-5">
						<form action="" method="post">
							<div class="d-flex align-items-center">
							<div class="container">
							 <div class="row justify-content-between">
							<table class="table table-bordered table-hover row" style="width: 400px;">
								<tbody>
									<tr>
										<th>결재 양식</th>
										<td></td>
										<td>
										<button type="button" class="btn btn-sm btn-primary"
										data-bs-toggle="modal" data-bs-target="#PayFormCallList">불러오기</button>
										</td>
									</tr>
									<tr>
										<th>팀 공개</th>
										<td colspan="2" style="text-align: center">
											<input class="form-check-input" type="checkbox" value="" id="openchk">
<!-- 											  <label class="form-check-label" for="flexCheckDefault"> -->
<!-- 											    Default checkbox -->
<!-- 											  </label> -->
										</td>
									</tr>
									<tr>
										<th>참조자</th>
										<td></td>
										<td><input type="button" value="참조자 선택" class="btn btn-sm btn-primary"></td>
									</tr>
								</tbody>
							</table>
								 <div class="col-md-auto align-self-center">
								 	<input id="pmline" type="button" class="btn btn-sm btn-primary" value="결재라인 추가"
								 	style="float: right;">
								 	<div>
								 		<table class="table table-bordered table-hover">
								 			<thead>
								 				<tr id="pmsignName">
								 					<th>오현민</th>
								 				</tr>
								 			</thead>
								 			<tbody>
								 				<tr id="pmsign">
								 					<td>본인 사인란</td>
								 				</tr>
								 			</tbody>
								 		</table>
								 	</div>
							    </div>
							</div>
							
							</div>	
								
							</div>
							
						</form>
						<div id="div_editor"></div>
						<input type="hidden" name="wp_content"/>
							<div style="text-align: center;margin-top: 30px;">
								<button type="button" class="btn btn-primary" onclick="save()">등록하기</button>
								<button type="button" class="btn btn-secondary" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
					</div>
				</section>
			</div>
			
			<div class="modal fade" id="PayFormCallList" tabindex="-1" role="dialog" 
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
			   <div class="modal-content">
			   	 <div class="modal-header">
			   	 	결재 양식 선택
			   	 </div>
			   	  <div class="modal-body">
			   	  	<table class="table table-bordered table-hover">
			   	  		<thead>
			   	  			<tr>
			   	  				<th></th>
			   	  				<th>결재 양식</th>
			   	  				<th>등록자</th>
			   	  				<th>제목</th>
			   	  				<th>양식 사용 횟수</th>
			   	  			</tr>
			   	  		</thead>
			   	  		<tbody id="PayFormListBody">
			   	  			
			   	  		</tbody>
			   	  	</table>
     			 </div>
			   </div>
			</div>
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
var count=0;
$(document).on('click','#pmline',function(){
	if($("#pmsignName th").length == 4){
		alert('결재 라인 지정은 최대 3명만 가능합니다.');
		return;
	}
	count++;
	var content1='';
	content1 +='<th>결재 라인<input style="margin-left:11px;width:5px;"'; 
	content1 +='type="button" id="'+count+'" value="-" class="btn btn-sm btn-secondary" onclick="pmlinedel(this)"></th>';
	var content2='';
	count++;
	content2 +='<td><input type="button" value="결재자 추가" id="'+count+'"></td>';
	$("#pmsignName").append(content1);
	$("#pmsign").append(content2);
});

function pmlinedel(e){
	var idx=$(e).attr("id");
	$("#"+idx).parent().remove();
	idx++;
	$("#"+idx).parent().remove();
	
}





















var config = {};
config.editorResizeMode = "none"; // 에디터 크기조절 안됨

config.file_upload_handler = function(file, pathReplace) {
	console.log(file); // 파일 정보 확인 가능
	if (file.size > (1 * 1024 * 1024)) { // 1MB 이상의 사진일 경우..
		alert("1MB 이상의 사진은 올릴 수 없습니다.");
		pathReplace("/filephoto/noimage.png"); // data:image 경로를 변경
	}
}

var editor = new RichTextEditor("#div_editor", config);
function save() {
	$("input[name='wp_content']").val(editor.getHTMLCode());
	if($("input[name='wp_content']").val().length < 11){
		alert('최소 10글자 입력 해주세요.');
	}else{
		$("form").submit();
	}
}
</script>
</html>