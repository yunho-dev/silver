<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }
    #detailName {
    	font-weight: bolder;
    	font-size: large;
    }
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="detailThing" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 상세보기</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <div class="modal-body">
					<!-- div 영역 나누기 -->
					<div class="left">
						<p id="thIdx" style="display: none;"></p>
						<span id="detailName">품명 : </span><span class="th_name"></span> <br>
						<span id="detailName">모델 : </span><span class="th_model"></span> <br>
						<span id="detailName">금액 : </span><span class="th_money"></span>&#8361; <br>
						<span id="detailName">등록자 : </span><span class="th_write"></span> <br>
						<span id="detailName">사진 : </span> <br>
						<span id="nonPhoto" style="display: none; font-weight: bold; color: red;">사진이 없습니다.</span>
					</div>
					<div class="right">
						<span id="detailName">구분 : </span><span class="th_part"></span> <br>
						<span id="detailName">취득일자 : </span><span class="th_date"></span> <br>
						<span id="detailName">상태 : </span><span class="th_state"></span> <br>
						<p class='hiddenSpon' style="display: none;"><span id="detailName">후원자 : </span><span class="th_spon"></span></p> <br>
					</div>
					<div class="bottom" style="width: 100%; float: left;">
						<img class="th_photo" style="width: 25%; display: none;"/>
					</div>
	            </div>
	            <div class="modal-footer" >
	            	<div style="margin: auto;">
	            		<button type="button" class="btn btn-primary ml-1"  id="modify" data-bs-target="#modifyThing" data-bs-toggle="modal">
		                    <i class="bx bx-check d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">수정하기</span>
		                </button>
		                <button type="button" class="btn btn-light-secondary"
		                    data-bs-dismiss="modal">
		                    <i class="bx bx-x d-block d-sm-none"></i>
		                    <span class="d-none d-sm-block">닫기</span>
		                </button>
	                </div>
	                <!-- 수정 -->
	                <jsp:include page="modifyThing.jsp"></jsp:include>
	            </div>
	        </div>
		</div>
	</div>
</body>
<script>
	$('#modify').click(function(){
		var thIdx = $('#thIdx').text();
		//$('.modifyRight input[name=thCateFake]').val()
		
		$.ajax({
			type:'GET',
			url:'getThingDetail.do',
			data:{thIdx:thIdx},
			dataType:'JSON',
			success:function(data){
				$(".modifyLeft input[name=thIdx]").val(data.detail.th_idx)
				$(".modifyLeft span[id=thName]").text(data.detail.th_name)
				$(".modifyLeft input[name=thModel]").val(data.detail.th_model)
				$(".modifyLeft input[name=thMoney]").val(comma(uncomma(data.detail.th_money)))
				$(".modifyRight input[name=thCateFake]").val(data.detail.it_name)
				$(".modifyRight input[name=thCateReal]").val(data.detail.it_idx)
				$(".modifyRight select[name=thPart]").val(data.detail.th_part)
				$(".modifyRight input[name=thDate]").val(data.detail.th_date)
				$(".modifyRight input[name=thSpon]").val(data.detail.th_spon)
				
				var fileName = data.detailPhoto;
				if(fileName != null && fileName != ''){
					$("#updateForm .thPhotoOri").text(data.detailPhoto.fp_newFileName)
				}else{
					$("#updateForm .thPhotoOri").text('없음')
				}
				//part 체크
				var modyPart = $('.modifyArea select[name=thPart]');
				changePartUp(modyPart);
				
			},
			error:function(e){
				console.log(e);
			}
		});
		
	});
	
	
</script>
</html>