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
	<div class="modal fade text-left" id="thingBookWrite" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 사용 예약 등록</h4>
	                <button type="button" class="close" onclick="closeModal(1)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="writeForm">
		            <div class="modal-body">
						<div class="writeLeft">
							<p class="writeArea"><span id="WriteName">품명 : </span> 
							 	<input type="text" name="thName" placeholder="클릭해 주세요" readonly="readonly" onclick="popThing()" style="cursor: pointer;">
							 	<input type="hidden" name="thIdx" readonly="readonly">
							</p> <br>
							<p class="writeArea">
								<span id="WriteName">사용자 구분 : </span> 
								<select name="userSel" onchange="changeUser($(this))">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="입소자">입소자</option>
									<option value="직원">직원</option>
								</select><br>
							</p> <br>
							<p class="writeArea">
								<span id="WriteName">사용자 : </span> 
								<input type="text" name="user" readonly="readonly" onclick="alert('사용자 구분을 먼저 선택해 주세요')" placeholder="클릭해 주세요" style="cursor: pointer;">
								<input type="hidden" name="userid" readonly="readonly">
							</p>
						</div>
						<div class="writeRight">
							<p class="writeArea">
								<span id="WriteName">예약 시작 날짜 : </span> 
								<input type="text" name="bStart" id="bookStart" onchange="dateCheck()" readonly="readonly" placeholder="품명을 먼저 선택해 주세요" autocomplete="off"><br>
							</p><br>
							<p class="writeArea">
								<span id="WriteName">예약 끝날 날짜 : </span> 
								<input type="text" name="bEnd" id="bookEnd" onchange="dateCheck()" readonly="readonly" placeholder="품명을 먼저 선택해 주세요" autocomplete="off"><br>
							</p>
							<p class="writeArea">
								<span id="dateCheck" style="color: #B1B1B1; font-size: medium;">예약 시작 날짜와 끝날 날짜를 선택해 주세요</span>
							</p>
						</div>
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
	/* 날짜 정규식 */
	const regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	function changeUser(selected){
		selVal = selected.val();
		$('#writeForm input[name=user]').val('')
		$('#writeForm input[name=userid]').val('')
		if(selVal === '입소자'){
			$('#writeForm input[name=user]').attr('onclick','selectResident()')
		}else{
			$('#writeForm input[name=user]').attr('onclick','selectMember()')
		}
	}
	
	function selectResident(){
		var url = "thingResidentList.go";
        var name = "thingResidentList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option)
	}
	
	function selectMember(){
		var url = "thingMemberList.go";
        var name = "thingMemberList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option)
	}
	
	function choiceRow(idx, name, judge){
		var $bStart = $('#writeForm input[name=bStart]');
		var $bEnd = $('#writeForm input[name=bEnd]');
		
		if(judge == 0){
			$('.writeLeft input[name=user]').val(name)
			$('.writeLeft input[name=userid]').val(idx)
		}else{
			$('.writeLeft input[name=thName]').val(name)
			$('.writeLeft input[name=thIdx]').val(idx)
			
			$bStart.attr('readonly', false)
			$bEnd.attr('readonly', false)
			$('#bookStart').datepicker('option','disabled',false); //datepicker 켬
			$('#bookEnd').datepicker('option','disabled',false); //datepicker 켬
			$('#bookStart').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			$bStart.removeAttr("placeholder")
			$bEnd.removeAttr("placeholder")
		}
		
	}
	
	function popThing(){
		var url = "popThList.go";
        var name = "popThList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no";
		window.open(url, name, option);
	}
	
	function dateCheck(){
		var $thIdx = $('#writeForm input[name=thIdx]');
		var $bStart = $('#writeForm input[name=bStart]');
		var $bEnd = $('#writeForm input[name=bEnd]');
		
		var dateCheck = $('#writeForm #dateCheck');
		
		if($thIdx.val()!='' && $bStart.val().match(regex) != null && $bEnd.val().match(regex) != null){
			$.ajax({
				type:'GET',
				url:'thingBookRealTimeCheck.do',
				data:{thIdx:$thIdx.val(), bStart:$bStart.val(), bEnd:$bEnd.val()},
				dataType:'JSON',
				success:function(data){
					if(data.check === 0){
						dateCheck.text('중복된 예약 날짜가 없습니다.')
						dateCheck.css('color', 'green')
					}else{
						dateCheck.text('중복된 예약 날짜가 '+data.check+'개 있습니다.')
						dateCheck.css('color', 'red')
					}
				},
				error:function(e){
					console.log(data)
				}
			});
		}
	}
	
	$('#regist').click(function(){
		var $thIdx = $('#writeForm input[name=thIdx]');
		var $thName = $('#writeForm input[name=thName]');
		
		var $select = $('#writeForm select[name=userSel]');
		var $user = $('#writeForm input[name=user]');
		var $userId = $('#writeForm input[name=userid]');
		
		var $bStart = $('#writeForm input[name=bStart]');
		var $bEnd = $('#writeForm input[name=bEnd]');
		
		if($thName.val()==''){
			alert("품명을 선택해 주세요");
			$thName.focus();
		}else if($select.val() == ''){
			alert("사용자 구분을 선택해 주세요");
			$select.focus();
		}else if($select.val() != '' && $user.val() == ''){
			alert("사용자를 선택해 주세요");
			$user.focus();
		}else if($bStart.val() == ''){
			alert("예약 시작 날짜를 선택/입력해 주세요");
			$bStart.focus();
		}else if($bEnd.val() == ''){
			alert("예약 끝날 날짜를 선택/입력해 주세요");
			$bEnd.focus();
		}else if($bStart.val().match(regex) == null || $bEnd.val().match(regex) == null){
			alert("날짜를 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
		}else{
			$.ajax({
				type:'POST',
				url:'thingBookWrite.do',
				data:{thIdx:$thIdx.val(), select:$select.val(), userId:$userId.val(), bStart:$bStart.val(), bEnd:$bEnd.val()},
				dataType:'JSON',
				success:function(data){
					console.log(data)
					if(data.check > 0){
						alert('시간이 겹치는 예약이 '+data.check+'건 있습니다. \n예약 시간을 바꿔서 다시 시도해 주세요')
					}
					if(data.check == 0 && data.affect > 0){
						alert('예약이 등록되었습니다.')
						location.reload();
					}
				},
				error:function(e){
					console.log(data)
				}
			});
		}
	})
	
</script>
</html>