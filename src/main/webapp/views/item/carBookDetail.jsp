<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 은빛 우산 부트스트랩 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<script src="assets/js/jquery.twbsPagination.js"></script>
<!-- datePicker -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- dateTimePicker -->
<link rel="stylesheet" href="assets/css/jquery.datetimepicker.min.css" />
<script src="assets/js/jquery.datetimepicker.full.min.js"></script>
</head>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="carBookDetail" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">차량 사용 예약 상세 보기</h4><br>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <div class="modal-body">
					<div class="left">
						<p>
							<input id="cbIdx" type="hidden">
						</p>
						<p><span id="detailName">이용 시작 시간 : </span><span class="b_start"></span></p>
						<p><span id="detailName">등록자 : </span><span class="b_writer"></span></p>
						<p><span id="detailName">취소 여부 : </span><span class="b_cancel"></span></p>
					</div>
					<div class="right" style="margin-top: 20px">
						<p><span id="detailName">이용 끝날 시간 : </span><span class="b_end"></span></p>
						<p><span id="detailName">사용자 : </span><span class="bMem"></span></p>
					</div>
					<div id="hideComent" style="float: left; width: 100%; display: inline-block;">
					<p><span id="detailName">취소 사유 : </span><span class="b_coment"></span></p>
					</div>
	            </div>
	            <div class="modal-footer" >
	            	<div style="margin: auto;">
	            		<button type="button" class="btn btn-primary ml-1"  id="bookCancel" data-bs-target="#carBookCancel" data-bs-toggle="modal">
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">예약 취소</span>
		                </button>
		                <button type="button" class="btn btn-light-secondary"
		                    data-bs-dismiss="modal">
		                    <i class="bx bx-x d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">닫기</span>
		                </button>
	                </div>
	                <!-- 취소 모달 -->
	                 <jsp:include page="carBookCancel.jsp"></jsp:include>
	            </div>
	        </div>
		</div>
	</div>
</body>
<script>
	$('#bookCancel').click(function(){
		var cbIdx = $('#carBookDetail #cbIdx').val();
		$('#carBookCancel #cancleForm .canceIdx').val(cbIdx);
	})
</script>
</html>