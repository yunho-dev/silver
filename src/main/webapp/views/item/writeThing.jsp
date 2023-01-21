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
        margin-top: 10px;
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
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="writeThing" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 등록</h4>
	                <button type="button" class="close" onclick="closeModal(1)"
	                    aria-label="Close" style="font-size: 22pt;" >
	                    &times;
	                </button>
	            </div>
	            <form id="writeForm">
		            <div class="modal-body">
						<div class="writeLeft">
							<p class="writeArea"><span id="WriteName">품명 : </span> 
								<input type="text" name="thName">&nbsp;<a class="btn btn-primary" id="thingCheck">중복검사</a>
							</p> <br>
							<p class="writeArea"><span id="WriteName">모델 : </span> 
								<input type="text" name="thModel">
							</p> <br>
							<p class="writeArea"><span id="WriteName">금액 : </span> 
								<input type="text" name="thMoney" onkeyup="inputNumberFormat(this)"> &#8361;
							</p> <br>
							<p class="writeArea" style="margin-bottom: 0px;"><span id="WriteName" style="text-align: left;">사진 : </span></p>
						</div>
						<div class="writeRight">
							<p class="writeArea"><span id="WriteName">카테고리 : </span> 
								<input type="text" id='writeCate' name="thCateFake" placeholder="클릭해 주세요" style="cursor: pointer;" onclick="clickCate(this.id)" readonly>
								<input type="hidden" name="thCateReal" readonly>
							</p> <br>
							<p class="writeArea"> 
								<span id="WriteName">구분 : </span>
								<select name="thPart" onchange="changePart($(this))">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="후원">후원</option>
									<option value="렌탈">렌탈</option>
									<option value="직접 구매">직접 구매</option>
								</select>
							</p> <br>
							<p class="writeArea"><span id="WriteName">취득일자 : </span>
								<input type="text" name="thDate" id="getDate">
							</p> <br>
							<p class="writeAreaSpon" style="display: none;">
								<span id="WriteName">후원자 : </span>
								<input name="thSpon" type="text">
							</p> <br>
						</div>
						<div>
							<!-- 사진 -->
							<input name="thPhoto" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck($(this))">
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
	var thingCheck = false;
	
	/* 품명 중복검사 */
	$('#thingCheck').click(function(){
		var thName = $(this).siblings('input[name=thName]');
		if(thName.val() == ''){
			alert("품명을 입력해 주세요");
			thName.focus();
		}else{
			$.ajax({
				type:'GET',
				url:'thingCheck.do',
				data:{'thName':thName.val()},
				dataType:'JSON',
				success:function(data){
					if(data.thingCheck){ //T
						alert('이미 사용 중인 품명입니다.');
					}else{ //F
						thingCheck=true
						alert('사용 가능한 품명입니다.');
						$('input[name=thModel]').focus();
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	});

	function changePart(selected){
		if(selected.val()==='후원'){
			$('.writeAreaSpon').css('display', 'block')
		}else{
			$('.writeAreaSpon').css('display', 'none')
			$('.writeAreaSpon input[name=thSpon]').val(null)
		}
	}
	
	/* 등록하기 버튼 */
	$('#regist').click(function(){
		/* 요소 */
		/* Left */
		var $thName = $('#writeForm input[name=thName]');
		var $thModel = $('#writeForm input[name=thModel]');
		var $thMoney = $('#writeForm input[name=thMoney]');
		/* Right */
		var $thCateReal = $('#writeForm input[name=thCateReal]');
		var $thPart = $('#writeForm select[name=thPart]');
		var $thDate = $('#writeForm input[name=thDate]');
		var $thSpon = $('#writeForm input[name=thSpon]');
		/* 날짜 정규식 */
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		
		var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
		
		if(thingCheck == true){ // 중복 X
			if($thName.val()==''){
				alert("품명을 입력해 주세요");
				$thName.focus();
			}else if($thModel.val()==''){
				alert("모델을 입력해 주세요");
				$thModel.focus();
			}else if($thMoney.val()==''){
				alert("금액을 입력해 주세요");
				$thMoney.focus();
			}else if($thCateReal.val()==''){
				alert("카테고리를 선택해 주세요");
				$thCateReal.focus();
			}else if($thPart.val()==''){
				alert("구분을 선택해 주세요");
				$thPart.focus();
			}else if($thDate.val()==''){
				alert("취득일자를 입력/선택해 주세요");
				$thDate.focus();
			}else if($thDate.val().match(regex) == null){
				alert("취득 일자를 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
				$thDate.focus();
			}else if($thPart.val()=='후원' && $thSpon.val()==''){
				alert("구분을 후원으로 선택하셨습니다. 후원자를 입력해 주세요");
				$thPart.focus();
			}else{
				$('#writeForm input').each(function(){
					var key = $(this).attr('name');
					var key2 = $thPart.attr('name');
					if(key == 'thPhoto'){
						formData.append(key,$(this)[0].files[0]);
					}else{
						formData.append(key, $(this).val())
						formData.append(key2, $thPart.val())
					}
				})
				
				$.ajax({
					type:'POST',
					url:'thingWrite.do',
					processData:false, // 객체를 문자열로 바꾸지 않음
					contentType:false, // 컨텐트 타입을 객체로 함
					data: formData,
					success:function(data){
						if(data.check==1){
							alert('등록 완료')
							location.reload();
						}else{
							alert('등록을 시도했으나 실패했습니다.\n중복된 ID이거나 서버 문제일 수 있습니다. \n이름을 바꿔 다시 시도해 주세요')
						}
					},
					error:function(e){
						console.log(e)
					}
				});
				
			} // end of if
		
		}else{ //중복 O - end of if
			alert("품명 중복 검사를 해 주세요");
		}
		
	});
</script>
</html>