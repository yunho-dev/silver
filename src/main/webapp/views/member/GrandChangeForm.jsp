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
	<div class="modal fade text-left" id="GrandChangeForm" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">직원 수정</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="memberGrandChangeForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<p id="memId" style="display: none;"></p> 
							<p class="writeArea"><span id="WriteName">이름 : </span> 
								<input type="text" name="memName" style="width:200px;height:30px;font-size:12px;" value="" placeholder="이름을 입력해 주세요" readonly>
							</p> <br>
							<p class="writeArea"><span id="WriteName">사번 : </span> 
								<input type="text" name="memId" style="width:200px;height:30px;font-size:12px;" value="" placeholder="사번을 입력해 주세요" readonly>
							</p> <br>
																											
						</div>
						<div class="writeRight">
							<p class="writeArea">
							<span id="WriteName">직급 : </span> 
							<select name="posName" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
									<option value="" selected="selected" style="display: none;" >선택</option>
									<option value="원장">원장</option>
									<option value="사무국장">사무국장</option>
									<option value="팀장">팀장</option>
									<option value="주임">주임</option>
									<option value="사원">사원</option>
							</select> 
							</p> <br>
																										
						</div>

		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="GrandChange">
			                    <span class="d-none d-sm-block">변경하기</span>
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

// 직책 변경 유효성 검사
$("#GrandChange").click(function(){
	
	/* Left */
	var $memName = $('#memberGrandChangeForm input[name=memName]');
	var $memId = $('#memberGrandChangeForm input[name=memId]');

	/* Right */
	var $posName = $('#memberGrandChangeForm select[name=posName]');


	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($memName.val()==''){
			alert("이름을 입력해 주세요");
			$memName.focus();
		}else if($memId.val()==''){
			alert("사번을 입력해 주세요");
			$memId.focus();
		}else if($posName.val()==''){
			alert("직급을 선택해 주세요");
			$posName.focus();
		}else{
			$('#memberGrandChangeForm input').each(function(){
				var key = $(this).attr('name');
				var key3 = $posName.attr('name');
				
					formData.append(key, $(this).val());
					formData.append(key3, $posName.val());				
			})
			
			$.ajax({
				type:'POST',
				url:'GradeUpdateDay.do',
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