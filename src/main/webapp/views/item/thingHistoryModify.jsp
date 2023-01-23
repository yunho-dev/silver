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
	div.modifyLeft {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    div.modifyRight {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }
    #modifyName {
    	font-weight: bolder;
    	font-size: large;
    }
    .modifyArea{
    	margin-top: 5px;
        margin-bottom: 5px;
    }
    .modifyAreaSpon{
    	margin-top: 5px;
        margin-bottom: 5px;
    }
    
    .returnDay{
    	display: none;
    }
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="thingHistoryModify" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 사용내역 수정</h4>
	                <button type="button" class="close" onclick="closeModal(2)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="updateForm">
		            <div class="modal-body">
						<div class="modifyLeft">
							<input type="hidden" name='hisIdx'>
							<p class="modifyArea"><span id="modifyName">품명 : </span>
							<span id="thName"></span>
							</p> <br>
							<p class="modifyArea"><span id="modifyName">사용자 : </span> 
								<input type="text" name="hisName">
							</p> <br>
							<p class="modifyArea"><span id="modifyName">사용 목적 : </span> 
								<input type="text" name="hisGoal">
							</p> <br>
						</div>
						<div class="modifyRight">
							<p class="modifyArea"><span id="modifyName">대여 날짜 : </span>
								<input type="text" name="hisRent" id="modiRentDate"> <!-- date picker -->
							</p> <br>
							<p class="modifyArea">
								<span id="modifyName">반납 여부 : </span>
								<input type="checkbox" id="returnCheck" class="form-check-input" onchange="checkReturn($(this))">
								<br>
								<span id="modifyName" class="returnDay">반납 날짜 : </span>
								<input type="text" class="returnDay" name="hisReturn" id="modiReturnDate"> <!-- date picker -->
							</p> <br>
							<p class="modifyArea"> 
								<span id="modifyName">상태 : </span>
								<select name="thState">
									<option value="사용중">사용중</option>
									<option value="비사용중">비사용중</option>
									<option value="고장">고장</option>
								</select>
							</p> <br>
						</div>
						<div>
						<span id="WriteName">비고</span> 
							<textarea class="form-control" id="hisBigo" name="hisBigo"
										rows="3" style="resize: none;"></textarea>
						</div>
		            </div>
		            <div class="modal-footer" >
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
	            </form>
	        </div>
		</div>
	</div>
</body>
<script>
	function checkReturn(checkBox){
		if(checkBox.is(":checked")){
			$('.returnDay').css('display', 'inline-block')
		}else{
			$('.returnDay').css('display', 'none')
		}
	}
	
	/* 수정하기 */
	$('#update').click(function(){
		var check = 0;
		
		if($('#thingHistoryModify #returnCheck').is(":checked")){
			check = 1;
		}else{
			check = 0;
		}
		/* 요소 */
		/* Left */
		var $hisIdx = $('#updateForm input[name=hisIdx]');
		var $hisName = $('#updateForm input[name=hisName]');
		var $hisGoal = $('#updateForm input[name=hisGoal]');
		/* Right */
		var $hisRent = $('#updateForm input[name=hisRent]');
		var $hisReturn = $('#updateForm input[name=hisReturn]');
		var $thState = $('#updateForm select[name=thState]');
		var $hisBigo = $('#updateForm textarea[name=hisBigo]');
		/* 날짜 정규식 */
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		if($hisName.val()==''){
			alert("사용자를 입력해 주세요");
			$hisName.focus();
		}else if($hisGoal.val()==''){
			alert("사용 목적을 입력해 주세요");
			$hisGoal.focus();
		}else if($hisRent.val()==''){
			alert("대여 날짜를 입력/선택해 주세요");
			$hisRent.focus();
		}else if($hisRent.val().match(regex) == null){
			alert("대여 날짜를 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$hisRent.focus();
		}else if(check == 1 && $hisReturn.val() == ''){
			alert("반납 날짜를 입력/선택해 주세요");
			$hisReturn.focus();
		}else if(check == 1 && $hisReturn.val() == '' || $hisReturn.val().match(regex) == null){
			alert("반납 날짜를 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$hisReturn.focus();
		}else if(check == 1 && $thState.val() == '사용중'){
			alert("반납 여부를 체크한 경우, 상태를 '사용중'으로 할 수 없습니다.")
		}else if(check == 0 && $thState.val() != '사용중'){
			alert("반납 여부를 체크하지 않은 경우, 상태를 '사용중'으로 해주세요")
		}
		else{
			$.ajax({
				type:'POST',
				url:'updateThingHistory.do',
				data:{check:check, hisIdx:$hisIdx.val(), hisName:$hisName.val(), hisGoal:$hisGoal.val(), hisRent:$hisRent.val(), hisReturn:$hisReturn.val(), thState:$thState.val(), hisBigo:$hisBigo.val()},
				dataType:'JSON',
				success:function(data){
					//left
					$('#thingHistoryDetail .left .his_name').text(data.detail.his_name)
					$('#thingHistoryDetail .left .his_goal').text(data.detail.his_goal)
					//right
					$('#thingHistoryDetail .right .his_rent').text(data.detail.his_rent)
					$('#thingHistoryDetail .right .his_return').text(data.detail.his_return)
					$('#thingHistoryDetail .th_state').text(data.detail.th_state)
					//bottom
					$('#thingHistoryDetail .his_bigo').text(data.detail.his_bigo)
					closeModal(2);
					$('#updateForm')[0].reset();
				},
				error:function(e){
					console.log(e)
				}
			});
		}
	})
</script>
</html>