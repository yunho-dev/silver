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
	<div class="modal fade text-left" id="writeCareer" tabindex="-1" role="dialog"
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
	            <form id="memberCareerWriteForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<input type="hidden" name='memId' value="${info.mem_id}">
						<p id="memId" style="display: none;"></p> 
							<p class="writeArea"><span id="WriteName">직장명 : </span> 
								<input type="text" name="careerName" style="width:200px;height:30px;font-size:12px;" value="" placeholder="직장명을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">담당업무 : </span> 
								<input type="text" name="careerWork" style="width:200px;height:30px;font-size:12px;" value="" placeholder="담당업무를 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">직책 : </span> 
								<input type="text" name="careerPos" style="width:200px;height:30px;font-size:12px;" value="" placeholder="직책을 입력해 주세요">
							</p> <br>							
																										
						</div>
						<div class="writeRight">
							<p class="writeArea"><span id="WriteName">입사일 : </span> 
								<input type="date" name="careerStart" style="width:200px;height:30px;font-size:12px;" value="" placeholder="입사일을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">퇴사일 : </span> 
								<input type="date" name="careerEnd" style="width:200px;height:30px;font-size:12px;" value="" placeholder="퇴사일을 입력해 주세요">
							</p> <br>																												
						</div>
						<div>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="mypageCareerRegist">
			                    <span class="d-none d-sm-block">등록하기</span>
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


//경력 등록 유효성 검사
$("#mypageCareerRegist").click(function(){
	var $memId = $('#memberCareerWriteForm input[name=memId]');
	/* Left */
	var $careerName = $('#memberCareerWriteForm input[name=careerName]');
	var $careerWork = $('#memberCareerWriteForm input[name=careerWork]');
	var $careerPos = $('#memberCareerWriteForm input[name=careerPos]');

	/* Right */
	var $careerStart = $('#memberCareerWriteForm input[name=careerStart]');
	var $careerEnd = $('#memberCareerWriteForm input[name=careerEnd]');

	/* 날짜 정규식 */
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($careerName.val()==''){
			alert("직장명을 입력해 주세요");
			$careerName.focus();
		}else if($careerWork.val()==''){
			alert("담당업무를 입력해 주세요");
			$careerWork.focus();
		}else if($careerPos.val()==''){
			alert("직책을 선택해 주세요");
			$careerPos.focus();
		}else if($careerStart.val()==''){
			alert("입사일을 입력해 주세요");
			$careerStart.focus();
		}else if($careerStart.val().match(regex) == null){
			alert("입사일 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$careerStart.focus();			
		}else if($careerEnd.val()==''){
			alert("퇴사일 입력해 주세요");
			$careerEnd.focus();
		}else if($careerEnd.val().match(regex) == null){
			alert("퇴사일 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$careerEnd.focus();			
		}else{
			$('#memberCareerWriteForm input').each(function(){
				var key = $(this).attr('name');


				formData.append(key, $(this).val());
				
			})
			
			$.ajax({
				type:'POST',
				url:'CareerWrite.do',
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