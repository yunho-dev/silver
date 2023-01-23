<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 api -->
<script src="assets/js/jquery.twbsPagination.js"></script>
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
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="EduUpdate" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">학력 등록</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="memberEduUpdateForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<input type="hidden" name='memId' value="${info.mem_id}">
						<input type="hidden" name='eduIdx' >
						<p id="memId" style="display: none;"></p> 
							<p class="writeArea"><span id="WriteName">학교명 : </span> 
								<input type="text" name="eduName" style="width:200px;height:30px;font-size:12px;" value="" placeholder="학교명을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">전공분야 : </span> 
								<input type="text" name="eduPass" style="width:200px;height:30px;font-size:12px;" value="" placeholder="전공분야 입력해 주세요">
							</p> <br>

							<p class="writeArea">
							<span id="WriteName">졸업유무 : </span>
							<select name="eduSuccess" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="졸업">졸업</option>
									<option value="졸업예정">졸업예정</option>
									<option value="휴학중">휴학중</option>
									<option value="재학중">재학중</option>
									<option value="자퇴">자퇴</option>
								</select> 
							</p> <br>																										
						</div>
						<div class="writeRight">
							<p class="writeArea"><span id="WriteName">입학일 : </span> 
								<input type="date" name="eduStart" style="width:200px;height:30px;font-size:12px;" value="" placeholder="입학일 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">졸업일 : </span> 
								<input type="date" name="eduEnd" style="width:200px;height:30px;font-size:12px;" value="" placeholder="졸업일 입력해 주세요">
							</p> <br>																												
						</div>
						<div>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="mypageEduUpdate">
			                    <span class="d-none d-sm-block">수정하기</span>
			                </button>
			                <button type="button" class="btn btn-light-secondary"
			                    data-bs-dismiss="modal">
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
//학력 수정 유효성 검사
$("#mypageEduUpdate").click(function(){
	var $memId = $('#memberEduUpdateForm input[name=memId]');
	var $eduIdx = $('#memberEduUpdateForm input[name=eduIdx]');
	/* Left */
	var $eduName = $('#memberEduUpdateForm input[name=eduName]');
	var $eduPass = $('#memberEduUpdateForm input[name=eduPass]');
	var $eduSuccess = $('#memberEduUpdateForm select[name=eduSuccess]');

	/* Right */
	var $eduStart = $('#memberEduUpdateForm input[name=eduStart]');
	var $eduEnd = $('#memberEduUpdateForm input[name=eduEnd]');

	/* 날짜 정규식 */
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($eduName.val()==''){
			alert("학교명을 입력해 주세요");
			$eduName.focus();
		}else if($eduPass.val()==''){
			alert("전공분야를 입력해 주세요");
			$eduPass.focus();
		}else if($eduSuccess.val()==''){
			alert("졸업유무를 선택해 주세요");
			$eduSuccess.focus();
		}else if($eduStart.val()==''){
			alert("입학일을 입력해 주세요");
			$eduStart.focus();
		}else if($eduStart.val().match(regex) == null){
			alert("입학일을 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$eduStart.focus();			
		}else if($eduEnd.val()==''){
			alert("졸업일 입력해 주세요");
			$eduEnd.focus();
		}else if($eduEnd.val().match(regex) == null){
			alert("졸업일을 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$eduEnd.focus();			
		}else{
			$('#memberEduUpdateForm input').each(function(){
				var key = $(this).attr('name');
				var key2 = $eduSuccess.attr('name');

				formData.append(key, $(this).val());
				formData.append(key2, $eduSuccess.val());

				
			})
			
			$.ajax({
				type:'POST',
				url:'EduUpdate.do',
				processData:false, // 객체를 문자열로 바꾸지 않음
				contentType:false, // 컨텐트 타입을 객체로 함
				data: formData,
				success:function(data){
					if(data.memId != null){
						location.reload();
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