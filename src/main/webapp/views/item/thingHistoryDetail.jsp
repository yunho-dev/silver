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
<style>
	div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
        margin-top: 0;
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
        margin-top: 20px;
    }
    #detailName {
    	font-weight: bolder;
    	font-size: large;
    }
</style>
<body>
	<!-- thingHistoryDetail -->
	<!--large size Modal -->
	<div class="modal fade text-left" id="thingHistoryDetail" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 사용 내역 상세 보기</h4><br>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <div class="modal-body">
	            	<p class="noData" style="color: red; display: none;">사용 이력이 없는 데이터는 조회할 수 없습니다.</p>
					<!-- div 영역 나누기 -->
<!-- 					<p class='hiddenSpon' style="display: none;"><span id="detailName">후원자 : </span><span class="th_spon"></span></p> <br> -->
					<div class="left">
						<p>
							<input id="hisIdx" type="text" style="display: none;">
						</p>
						<p><span id="detailName">품명 : </span><span class="th_name"></span></p>
						<p><span id="detailName">모델 : </span><span class="th_model"></span></p>
						<p><span id="detailName">금액 : </span><span class="th_money"></span></p>
						<p><span id="detailName" class='hiddenSpon'>후원자 : </span><span class="th_spon"></span></p>
						<p><span id="detailName">사용자 : </span><span class="his_name"></span></p>
						<p><span id="detailName">사용 목적 : </span><span class="his_goal"></span></p>
					</div>
					<div class="right">
						<p><span id="detailName">구분 : </span><span class="th_part"></span></p>
						<p><span id="detailName">상태 : </span><span class="th_state"></span></p>
						<p><span id="detailName">취득 일자 : </span><span class="th_date"></span></p>
						<p><span id="detailName">대여 날짜 : </span><span class="his_rent"></span></p>
						<p><span id="detailName">반납 날짜 : </span><span class="his_return"></span></p>
						<p><span id="detailName">등록자 : </span><span class="his_write"></span></p>
					</div>
					<div style="width: 100%; float: left;">
						<p><span id="detailName">비고 : </span><span class="his_bigo"></span></p>
					</div>
	            </div>
	            <div class="modal-footer" >
	            	<div style="margin: auto;">
	            		<button type="button" class="btn btn-primary ml-1"  id="modify" data-bs-target="#thingHistoryModify" data-bs-toggle="modal"> <!-- data-bs-dismiss="modal" -->
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">수정하기</span>
		                </button>
		                <button type="button" class="btn btn-light-secondary"
		                    data-bs-dismiss="modal">
		                    <i class="bx bx-x d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">닫기</span>
		                </button>
	                </div>
	                <!-- 수정 모달 -->
	                <jsp:include page="thingHistoryModify.jsp"></jsp:include>
	            </div>
	        </div>
		</div>
	</div>
</body>
<script>
	$('#modify').click(function(){
		var hisIdx = $('#hisIdx').val();
		if(hisIdx==''){
			alert('수정이 불가능한 품목입니다.')
			location.reload();
		}else{
			$.ajax({
				type:'GET',
				url:'getThingHistoryDetail.do',
				data:{hisIdx:hisIdx},
				dataType:'JSON',
				success:function(data){
					$(".modifyLeft input[name=hisIdx]").val(data.detail.his_idx)
					$(".modifyLeft span[id=thName]").text(data.detail.th_name)
					$(".modifyLeft input[name=hisName]").val(data.detail.his_name)
					$(".modifyLeft input[name=hisGoal]").val(data.detail.his_goal)
					$(".modifyRight input[name=hisRent]").val(data.detail.his_rent)
					if(data.detail.his_return === '1900-01-01'){
						$('.returnDay').css('display', 'none')
						$(".modifyRight #returnCheck").prop("checked", false);
						$(".modifyRight input[name=hisReturn]").val('');
					}else{
						$(".modifyRight input[name=hisReturn]").val(data.detail.his_return)
						$('.returnDay').css('display', 'inline-block')
						$(".modifyRight #returnCheck").prop("checked", true);
					}
					$(".modifyRight select[name=thState]").val(data.detail.th_state).attr("selected", "selected");
					if(data.detail.his_bigo === '없음'){
						$(".modal-body textarea[name=hisBigo]").val('')
					}else{
						$(".modal-body textarea[name=hisBigo]").val(data.detail.his_bigo)
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});
</script>
</html>