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
	div.writeLeft {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    div.writeRight {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }
    #WriteName {
    	font-weight: bolder;
    	font-size: large;
    }
    .writeArea{
    	margin-top: 5px;
        margin-bottom: 5px;
    }
    .writeAreaSpon{
    	margin-top: 5px;
        margin-bottom: 5px;
    }
    .bottom {
	    position: absolute;
	    bottom: 2px;
	}
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="thingHistoryWrite" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 사용 내역 등록</h4>
	                <button type="button" class="close" onclick="closeModal(1)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="writeForm">
		            <div class="modal-body">
						<div class="writeLeft">
<!-- 							<p id="thIdx" style="display: none;"></p> -->
							<p class="writeArea"><span id="WriteName">품명 : </span> 
								<input type="text" name="thName" readonly="readonly" placeholder="클릭해 주세요" onclick="popThingHistory()" style="cursor: pointer;">&nbsp;
							</p> <br>
							<p class="writeArea"><span id="WriteName">사용 목적 : </span> 
								<input type="text" name="hisGoal">
							</p> <br>
						</div>
						<div class="writeRight">
							<p class="writeArea"><span id="WriteName">사용자 : </span> 
								<input type="text" name="hisName">
							</p> <br>
							<p class="writeArea">
								<span id="WriteName">대여 날짜 : </span> 
								<input type="text" name="hisRent" id="writeRentDate"><br>
								<span style="color: gray; font-size: small;">반납 날짜는 수정에서 등록 가능합니다.</span>
							</p>
						</div>
							<span id="WriteName">비고</span> 
							<textarea class="form-control" id="hisBigo"
										rows="3" style="resize: none;"></textarea>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="regist">
			                    <span class="d-none d-sm-block">등록하기</span>
			                </button>
			                <button type="button" class="btn btn-light-secondary"
			                    onclick="closeModal(1)">
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
	$('#regist').click(function(){
		/* 요소 */
		/* Left */
		var $thName = $('#writeForm input[name=thName]');
		var $hisGoal = $('#writeForm input[name=hisGoal]');
		/* Right */
		var $hisName = $('#writeForm input[name=hisName]');
		var $hisRent = $('#writeForm input[name=hisRent]');
		/* Bottom */
		var $hisBigo = $('#writeForm #hisBigo');
		/* 날짜 정규식 */
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		
		if($thName.val()==''){
			alert("품명을 입력해 주세요");
			$thName.focus();
		}else if($hisGoal.val()==''){
			alert("사용 목적을 입력해 주세요");
			$hisGoal.focus();
		}else if($hisName.val()==''){
			alert("사용자를 입력해 주세요");
			$hisName.focus();
		}else if($hisRent.val()==''){
			alert("대여날짜를 입력/선택해 주세요");
			$hisRent.focus();
		}else if($hisRent.val().match(regex) == null){
			alert("취득 일자를 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$hisRent.focus();
		}else{
			$.ajax({
				type:'POST',
				url:'thingHistoryWrite.do',
				data:{thName:$thName.val(), hisGoal:$hisGoal.val(), hisName:$hisName.val(), hisRent:$hisRent.val(), hisBigo:$hisBigo.val()},
				dataType:'JSON',
				success:function(data){
					if(data.finish == 1){
						location.reload();
					}else{
						alert('서버와 통신은 했으나 등록중 오류가 발생했습니다 \n다시 시도해 주세요 \n현상이 지속되면 새로고침 후 진행해 주세요')
					}
				},
				error:function(e){
					console.log(data)
				}
			});
		}
	})
	
	function popThingHistory(){
		var url = "popThingHistoryList.go";
        var name = "popThingHistoryList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}
	
	function choiceRow(name){
		$('#thingHistoryWrite input[name=thName]').val(name)
	}
	
</script>
</html>