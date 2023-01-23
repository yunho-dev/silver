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
        margin-top: 10px;
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
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="modifyThing" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 수정</h4>
	                <button type="button" class="close" onclick="closeModal(2)"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="updateForm">
		            <div class="modal-body">
						<div class="modifyLeft">
							<input type="hidden" name='thIdx'>
							<p class="modifyArea"><span id="modifyName">품명 : </span>
							<span id="thName"></span>
							</p> <br>
							<p class="modifyArea"><span id="modifyName">모델 : </span> 
								<input type="text" name="thModel">
							</p> <br>
							<p class="modifyArea"><span id="modifyName">금액 : </span> 
								<input type="text" name="thMoney" onkeyup="inputNumberFormat(this)">&#8361;
							</p> <br>
							<p class="modifyArea" style="margin-bottom: 0px;"><span id="modifyName" style="text-align: left;">사진 : </span></p>
						</div>
						<div class="modifyRight">
							<p class="modifyArea"><span id="modifyName">카테고리 : </span> 
								<input type="text" id='modifyCate' name="thCateFake" placeholder="클릭해 주세요" style="cursor: pointer;" onclick="clickCate(this.id)" readonly>
								<input type="hidden" name="thCateReal" readonly>
							</p> <br>
							<p class="modifyArea"> 
								<span id="modifyName">구분 : </span>
								<select name="thPart" onchange="changePartUp($(this))">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="후원">후원</option>
									<option value="렌탈">렌탈</option>
									<option value="직접 구매">직접 구매</option>
								</select>
							</p> <br>
							<p class="modifyArea"><span id="modifyName">취득일자 : </span>
								<input type="text" name="thDate" id="modiDate"> <!-- date picker -->
							</p> <br>
							<p class="modifyAreaSpon" style="display: none;">
								<span id="modifyName">후원자 : </span>
								<input name="thSpon" type="text">
							</p> <br>
						</div>
						<div>
							<!-- 사진 -->
							<input name="thPhoto" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck($(this))">
							<span>기존 사진 : </span><span class="thPhotoOri"></span>
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
	function changePartUp(selected){
		if(selected.val()=='후원'){
			$('.modifyAreaSpon').css('display', 'block')
		}else{
			$('.modifyAreaSpon').css('display', 'none')
		}
	}

	/* 수정하기 */
	$('#update').click(function(){
		/* 요소 */
		/* Left */
		var $thModel = $('#updateForm input[name=thModel]');
		var $thMoney = $('#updateForm input[name=thMoney]');
		/* Right */
		var $thCateReal = $('#updateForm input[name=thCateReal]');
		var $thPart = $('#updateForm select[name=thPart]');
		var $thDate = $('#updateForm input[name=thDate]');
		var $thSpon = $('#updateForm input[name=thSpon]');
		/* 날짜 정규식 */
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		
		var formData = new FormData();
		
		if($thModel.val()==''){
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
			$('#updateForm input').each(function(){
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
				url:'thingUpdate.do',
				processData:false, // 객체를 문자열로 바꾸지 않음
				contentType:false, // 컨텐트 타입을 객체로 함
				data: formData,
				success:function(data){
					closeModal(2);
					$('#updateForm')[0].reset();
					//left
					$('#detailThing .left .th_name').text(data.detail.th_name)
					$('#detailThing .left .th_model').text(data.detail.th_model)
					$('#detailThing .left .th_money').text(comma(uncomma(data.detail.th_money)))
					$('#detailThing .left .th_write').text(data.detail.th_write)
					//right
					$('#detailThing .right .th_part').text(data.detail.th_part)
					$('#detailThing .right .th_date').text(data.detail.th_date)
					$('#detailThing .right .th_state').text(data.detail.th_state)
					$('#detailThing .right .th_spon').text(data.detail.th_spon)
					//photo
					if(data.detailPhoto != null){
						$('#detailThing #nonPhoto').css('display', 'none');
						$('#detailThing .th_photo').css('display', 'block');
						$('#detailThing .th_photo').attr('src', '/filephoto/'+data.detailPhoto.fp_newFileName)
					}else{
						$('#detailThing #nonPhoto').css('display', 'block');
						$('#detailThing .th_photo').css('display', 'none');
					}
				},
				error:function(e){
					console.log(e)
				}
			});
			
		}// end of if
	});

</script>
</html>