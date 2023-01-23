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
	<div class="modal fade text-left" id="carHisotryModifyModal" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">차량 운행기록 수정</h4>
	                <button type="button" class="close" onclick="closeModal(3)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="carHistoryModfyForm">
		            <div class="modal-body">
						<div class="left">
							<input type="hidden" name="chisIdx">
							<p class="writeArea"><span id="WriteName">운행일 : </span> 
								<input type="text" name="chisDate" id="chisDateModify" autocomplete="off">
							</p><br>
							<p class="writeArea"><span id="WriteName">운행지역 : </span> 
								<input type="text" name="chisPlace">
							</p><br>
							<p class="writeArea"><span id="WriteName">운행거리 : </span> 
								<input type="text" name="chisKm"><span id="WriteName">&nbsp;km</span>
							</p><br>
							<p class="writeArea"><span id="WriteName">운행목적 : </span> 
								<input type="text" name="chisReason">
							</p><br>
					</div>
						<div class="right">
							<p class="writeArea"><span id="WriteName">운전자 : </span> 
								<input type="text" name="chisDriver">
							</p><br>
							<p class="writeArea"><span id="WriteName">주유량 : </span> 
								<input type="text" name="chisLiter"><span id="WriteName">&nbsp;L</span>
							</p><br>
							<p class="writeArea"><span id="WriteName">비고 : </span><br>
								<textarea id="chisBigo" name="chisBigo"
									rows="3" style="resize: none;"></textarea>
							</p><br>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="carHistoryModifySaveBtn">
			                    <span class="d-none d-sm-block">저장</span>
			                </button>
			                <button type="button" class="btn btn-light-secondary"
			                    onclick="closeModal(3)">
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
	$('#carHistoryModifySaveBtn').click(function(){
		var $chisIdx = $('#carHistoryModfyForm input[name=chisIdx]');
		var $chisDate = $('#carHistoryModfyForm input[name=chisDate]');
		var $chisPlace = $('#carHistoryModfyForm input[name=chisPlace]');
		var $chisKm = $('#carHistoryModfyForm input[name=chisKm]');
		var $chisReason = $('#carHistoryModfyForm input[name=chisReason]');
		var $chisDriver = $('#carHistoryModfyForm input[name=chisDriver]');
		var $chisLiter = $('#carHistoryModfyForm input[name=chisLiter]');
		var $chisBigo = $('#carHistoryModfyForm #chisBigo');
		
		if($chisDate.val().match(dateRegex) == null){
			alert('운행일을 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08')
			$chisDate.focus();
		}else if($chisPlace.val()==''){
			alert("운행지역을 입력해 주세요");
			$chisPlace.focus();
		}else if($chisKm.val()==''){
			alert("운행거리를 입력해 주세요");
			$chisKm.focus();
		}else if($chisKm.val().match(numRegex) == null){
			alert("운행거리는 숫자만 입력해 주세요");
			$chisKm.focus();
		}else if($chisReason.val()==''){
			alert("운행목적을 입력해 주세요");
			$chisReason.focus();
		}else if($chisDriver.val()==''){
			alert("운전자를 입력해 주세요");
			$chisDriver.focus();
		}else if($chisLiter.val() != '' && $chisLiter.val().match(numRegex) == null){
			alert("주유량은 숫자만 입력해 주세요");
			$chisLiter.focus();
		}else{
			var formData = new FormData();
			$('#carHistoryModfyForm input').each(function(){
				var key = $(this).attr('name');
				var key2 = $chisBigo.attr('name');
				var key3 = 'carNum';
				formData.append(key, $(this).val())
				formData.append(key2, $chisBigo.val())
				formData.append(key3, carNum)
			})
			$.ajax({
				type:'POST',
				url:'carHistoryModify.do',
				processData:false, // 객체를 문자열로 바꾸지 않음
				contentType:false, // 컨텐트 타입을 객체로 함
				data: formData,
				success:function(data){
					if(data.finish == 1){
						alert('수정 완료')
						$("#carHistoryModfyForm")[0].reset();
						closeModal(3);
						getHistoryList(showPage);
					}else{
						alert('서버와 통신은 했으나 데이터 전송중 문제가 발생했습니다. \n다시 시도해 주세요. \n현상이 지속되면 새로고침 후 진행해 주세요')
					}
				},
				error:function(e){
					console.log(e)
				}
			});
			
		}
	});
</script>
</html>