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
	#checkPwd{
  		color : red;
  		font-size: 12px;
	}       
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="ChangePassword" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비밀번호 변경</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="ChangePasswordForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<input type="hidden" name='memId' value="${info.mem_id}">
						<p id="memId" style="display: none;"></p> 
<!-- 							<p class="writeArea"><span id="WriteName">기존 비밀번호 : </span> 
								<input type="text" name="memPw" style="width:200px;height:30px;font-size:12px;" value="" placeholder="기존 비밀번호를 입력해 주세요">
							</p> <br> -->
																									
							<p class="writeArea"><span id="WriteName">새 비밀번호: </span> 
								<input type="text" id="memNpw" name="memNpw" style="width:200px;height:30px;font-size:12px;" value="" placeholder="비밀번호를 확인해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">새 비밀번호 확인: </span> 
								<input type="text" id="memNApw" name="memNApw" style="width:200px;height:30px;font-size:12px;" onkeyup="checkPwd()" value="" placeholder="새로운 비밀번호를 입력해 주세요">
								<span id="checkPwd"></span>
							</p> <br>
						</div>
						<div class="writeRight">
																											
						</div>
						<div>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="mypagePasswordUpdate">
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

//비밀번호 확인 실시간 검증
function checkPwd(){
	var pw = document.getElementById('memNpw').value;
	var pwChk = document.getElementById('memNApw').value;
	
	if(pw!=pwChk){
		document.getElementById('checkPwd').style.color = 'red';
		document.getElementById('checkPwd').innerHTML = "! 동일한 암호를 입력하세요.";
	}else{
		document.getElementById('checkPwd').style.color = "green";
		document.getElementById('checkPwd').innerHTML = "암호가 일치합니다."; 
	}
}

// 비밀번호 수정 유효성 검사 
$("#mypagePasswordUpdate").click(function(){
	var $memId = $('#ChangePasswordForm input[name=memId]');

	var $memNpw = $('#ChangePasswordForm input[name=memNpw]');
	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($memNpw.val()==''){
			alert("새 비밀번호를 입력해 주세요");
			$memNpw.focus();
		}else{
			$('#ChangePasswordForm input').each(function(){
				var key = $(this).attr('name');


				formData.append(key, $(this).val());
				
			})
			
			$.ajax({
				type:'POST',
				url:'ChangePassword.do',
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