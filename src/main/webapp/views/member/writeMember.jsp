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
	<div class="modal fade text-left" id="writeMember" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">직원 등록</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="memberWriteForm">
		            <div class="modal-body">
						<div class="writeLeft">
<!-- 							<p id="thIdx" style="display: none;"></p> -->
							<p class="writeArea"><span id="WriteName">이름 : </span> 
								<input type="text" name="memName" style="width:200px;height:30px;font-size:12px;" value="" placeholder="이름을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">사번 : </span> 
								<input type="text" name="memId" style="width:200px;height:30px;font-size:12px;" value="" placeholder="사번을 입력해 주세요">
							</p> <br>
							<p class="writeArea">
							<span id="WriteName">담당부서 : </span>
							<select name="departName" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="요양보호팀">요양보호팀</option>
									<option value="사회복지팀">사회복지팀</option>
									<option value="간호조무팀">간호조무팀</option>
									<option value="조리팀">조리팀</option>
									<option value="사무국">사무국</option>
									<option value="총괄">총괄</option>
								</select> 
							</p> <br>
							<p class="writeArea"><span id="WriteName">입사일 : </span> 
								<input type="date" name="memIndate" style="width:200px;height:30px;font-size:12px;" value="" placeholder="입사일을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">생년월일 : </span> 
								<input type="text" name="memBirth" style="width:200px;height:30px;font-size:12px;" value="" placeholder="생년월일을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">주소 : </span> 
								<input type="text" name="memAddr" id="mem_add" value="" readonly placeholder="주소찾기를 해주세요" style="width:200px;height:30px;font-size:12px;">
								<input type="button" id="findAdd" onclick="whatadd()" style="cursor: pointer; height: 34px;" value="주소찾기">
							</p> <br>
							<p class="writeArea" style="margin-bottom: 0px;"><span id="WriteName" style="text-align: left;">사진 : </span></p>																												
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
							<p class="writeArea"><span id="WriteName">비밀번호 : </span> 
								<input type="text" name="memPw" style="width:200px;height:30px;font-size:12px;" value="" placeholder="비밀번호를 입력해 주세요">
							</p> <br>
							<p class="writeArea">
							<span id="WriteName">담당직종 : </span>
							<select name="partName" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="요양보호사">요양보호사</option>
									<option value="사회복지사">사회복지사</option>
									<option value="간호조무사">간호조무사</option>
									<option value="조리사">조리사</option>
									<option value="없음">없음</option>
							</select> 
							</p> <br>
							<p class="writeArea"><span id="WriteName">번호 : </span> 
								<input type="text" name="memPnum" style="width:200px;height:30px;font-size:12px;" value="" placeholder="번호를 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">성별 : </span> 
								<input type="text" name="memGender" style="width:200px;height:30px;font-size:12px;" value="" placeholder="성별을 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">상세주소 : </span> 
								<input type="text" name="memDaddr" id="mem_detailAdd" style="width:200px;height:30px;font-size:12px;" value="" placeholder="상세주소를 입력해 주세요">
							</p> <br>	
							<p class="writeArea"><span id="WriteName">이메일 : </span> 
								<input type="text" name="memEmail" style="width:200px;height:30px;font-size:12px;" value="" placeholder="이메일을 입력해 주세요">
							</p> <br>
																												
						</div>
						<div>
							<!-- 사진 -->
							<input name="memPhoto" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)">
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="memRegist">
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

// 주소 api
function whatadd() {
    new daum.Postcode({
        oncomplete: function(data) {
        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R' || data.userSelectedType === 'J') { // 사용자가 주소를 선택했을 경우
                addr = data.roadAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            } 
            
            var zoneCode = '(' + data.zonecode + ') ';
            
            addr = zoneCode + addr + extraAddr;
            document.getElementById("mem_add").value = addr;
            document.getElementById("mem_detailAdd").focus();
        }
    }).open();
}

// 파일 검사
function fileCheck(obj) {
	console.log(obj.value)
    pathpoint = obj.value.lastIndexOf('.');
    filepoint = obj.value.substring(pathpoint+1,obj.length);
    filetype = filepoint.toLowerCase();
    if(filetype!='jpg' && filetype!='gif' && filetype!='png' && filetype!='jpeg') {
        alert('1MB 이하의 이미지 파일만 선택할 수 있습니다. \n지원하는 형식 : jpg, jpeg, png, gif');
        obj.value = null;
        return false;
    }
}



// 직원 등록 유효성 검사
$("#memRegist").click(function(){
	
	/* Left */
	var $memName = $('#memberWriteForm input[name=memName]');
	var $memId = $('#memberWriteForm input[name=memId]');
	var $departName = $('#memberWriteForm select[name=departName]');
	var $memIndate = $('#memberWriteForm input[name=memIndate]');
	var $memBirth = $('#memberWriteForm input[name=memBirth]');
	var $memAddr = $('#memberWriteForm input[name=memAddr]');
	/* Right */
	var $posName = $('#memberWriteForm select[name=posName]');
	var $memPw = $('#memberWriteForm input[name=memPw]');
	var $partName = $('#memberWriteForm select[name=partName]');
	var $memPnum = $('#memberWriteForm input[name=memPnum]');
	var $memGender = $('#memberWriteForm input[name=memGender]');
	var $memDaddr = $('#memberWriteForm input[name=memDaddr]');	
	var $memEmail = $('#memberWriteForm input[name=memEmail]');	
	/* 날짜 정규식 */
	var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($memName.val()==''){
			alert("이름을 입력해 주세요");
			$memName.focus();
		}else if($memId.val()==''){
			alert("사번을 입력해 주세요");
			$memId.focus();
		}else if($departName.val()==''){
			alert("담당부서를 선택해 주세요");
			$departName.focus();
		}else if($memIndate.val()==''){
			alert("입사일을 입력해 주세요");
			$memIndate.focus();
		}else if($memIndate.val().match(regex) == null){
			alert("입사일을 형식에 맞게 입력해 주세요 \n형식 : yyyy-mm-dd\n예)2023-01-08");
			$memIndate.focus();			
		}else if($memBirth.val()==''){
			alert("생년월일을 선택해 주세요");
			$memBirth.focus();
		}else if($memAddr.val()==''){
			alert("주소를 입력해 주세요");
			$memAddr.focus();
		}else if($posName.val()==''){
			alert("직급을 선택해 주세요");
			$posName.focus();
		}else if($memPw.val()==''){
			alert("비밀번호를 입력해 주세요");
			$memPw.focus();
		}else if($partName.val()==''){
			alert("담당 직종을 선택해 주세요");
			$partName.focus();
		}else if($memPnum.val()==''){
			alert("번호를 입력해 주세요");
			$memPnum.focus();
		}else if($memGender.val()==''){
			alert("성별을 입력해 주세요");
			$memGender.focus();
		}else if($memDaddr.val()==''){
			alert("상세주소를 입력해 주세요");
			$memDaddr.focus();
		}else if($memEmail.val()==''){
			alert("이메일을 입력해 주세요");
			$memEmail.focus();
		}else{
			$('#memberWriteForm input').each(function(){
				var key = $(this).attr('name');
				var key2 = $departName.attr('name');
				var key3 = $posName.attr('name');
				var key4 = $partName.attr('name');
				if(key == 'memPhoto'){
					formData.append(key,$(this)[0].files[0]);
				}else{
					formData.append(key, $(this).val());
					formData.append(key2, $departName.val());
					formData.append(key3, $posName.val());
					formData.append(key4, $partName.val());
				}
			})
			
			$.ajax({
				type:'POST',
				url:'memberWrite.do',
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