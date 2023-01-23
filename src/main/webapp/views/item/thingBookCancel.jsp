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
</head>
<body>
	<!--Danger theme Modal -->
	<div class="modal fade text-left" id="thingBookCancel" tabindex="-1"
	    role="dialog" aria-labelledby="myModalLabel120"
	    aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header bg-danger">
	                <h5 class="modal-title white" id="myModalLabel120">
	                    비품 예약 취소
	                </h5>
	                <button type="button" class="close" onclick="closeModal(2)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="cancleForm">
		            <div class="modal-body">
		            	<input type="hidden" class="canceIdx">
		                <span id="WriteName">취소 사유</span> 
						<textarea class="form-control" id="b_content"
							rows="3" style="resize: none;"></textarea>
		            </div>
	            </form>
	            <div class="modal-footer">
	                <div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="update">
			                    <span class="d-none d-sm-block">저장</span>
			                </button>
			                <button type="button" class="btn btn-light-secondary"
		                    onclick="closeModal(2)" >
		                    <i class="bx bx-x d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">닫기</span>
		                </button>
		                </div>
	            </div>
	        </div>
	    </div>
	</div>
</body>
<script>
	$('#update').click(function(){
		var cbIdx = $('#cancleForm .canceIdx').val();
		var bContent = $('#cancleForm  #b_content').val();
		if(bContent == ''){
			alert("취소 사유를 입력해 주세요");
			$('#b_content').focus();
		}else{
			if(confirm("정말로 예약을 취소하시겠습니까? \n취소 후에는 되돌리기가 불가능합니다.")){
				$.ajax({
					type:'POST',
					url:'bookCancel.do',
					data:{cbIdx:cbIdx, bContent:bContent},
					dataType:'JSON',
					success:function(data){
						if(data.update==1){
							alert('예약이 취소되었습니다.')
							location.reload();
						}else{
							alert('서버와 통신은 했으나 수정이 올바르게 되지 않았습니다.\n다시 시도해 주세요 \n현상이 계속되면 새로고침 후 다시 진행해 주세요')
						}
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		}
	})
</script>
</html>