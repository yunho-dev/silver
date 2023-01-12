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
	<div class="modal fade text-left" id="mypageChange" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">개인정보 수정</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="mypageChangeForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<p id="memId" style="display: none;"></p> 
							<input type="hidden" name='memId'>
							<p class="writeArea"><span id="WriteName">주소 : </span> 
								<input type="text" name="memAddr" id="zealot" value="" readonly placeholder="주소찾기를 해주세요" style="width:200px;height:30px;font-size:12px;">
								<input type="button" id="findAdd" onclick="placeadd()" style="cursor: pointer; height: 34px;" value="주소찾기">
							</p> <br>
							<br>
							<br>
							<br>
							<br>
							<p class="writeArea" style="margin-bottom: 0px;"><span id="WriteName" style="text-align: left;">사진 : </span></p>																												
						</div>
						<div class="writeRight">

							<p class="writeArea"><span id="WriteName">번호 : </span> 
								<input type="text" name="memPnum" style="width:200px;height:30px;font-size:12px;" value="" placeholder="번호를 입력해 주세요">
							</p> <br>
							<p class="writeArea"><span id="WriteName">상세주소 : </span> 
								<input type="text" name="memDaddr" id="dragon" style="width:200px;height:30px;font-size:12px;" value="" placeholder="상세주소를 입력해 주세요">
							</p> <br>	
							<p class="writeArea"><span id="WriteName">이메일 : </span> 
								<input type="text" name="memEmail" style="width:200px;height:30px;font-size:12px;" value="" placeholder="이메일을 입력해 주세요">
							</p> <br>																										
						</div>
						<div>
							<!-- 사진 -->
							<input name="memPhoto" class="form-control" type="file" id="formFile" accept="image/gif, image/jpeg, image/png" onchange="fileCheck(this)">
							<span>기존 사진 : </span><span class="mypagePhotoOri"></span>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="mypageUpdateRegist">
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
//주소 api
function placeadd() {
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
            document.getElementById("zealot").value = addr;
            document.getElementById("dragon").focus();
        }
    }).open();
}

//파일 검사
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


// 마이페이지 업데이트 유효성 검사
$("#mypageUpdateRegist").click(function(){
	
	var $memId = $('#mypageChangeForm input[name=memId]');
	
	/* Left */
	var $memAddr = $('#mypageChangeForm input[name=memAddr]');
	/* Right */
	var $memPnum = $('#mypageChangeForm input[name=memPnum]');
	var $memDaddr = $('#mypageChangeForm input[name=memDaddr]');	
	var $memEmail = $('#mypageChangeForm input[name=memEmail]');
	
	var formData = new FormData(); // 파일 + 텍스트 전송을 위한 FormData 객체
	
	
		if($memAddr.val()==''){
			alert("주소를 입력해 주세요");
			$memAddr.focus();
		}else if($memPnum.val()==''){
			alert("번호를 입력해 주세요");
			$memPnum.focus();
		}else if($memDaddr.val()==''){
			alert("상세주소를 입력해 주세요");
			$memDaddr.focus();
		}else if($memEmail.val()==''){
			alert("이메일을 입력해 주세요");
			$memEmail.focus();
		}else{
			$('#mypageChangeForm input').each(function(){
				var key = $(this).attr('name');
				if(key == 'memPhoto'){
					formData.append(key,$(this)[0].files[0]);
				}else{
					formData.append(key, $(this).val());
				}
			})
			
			$.ajax({
				type:'POST',
				url:'mypageUpdate.do',
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