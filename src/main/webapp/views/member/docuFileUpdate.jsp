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
	<div class="modal fade text-left" id="docuFileUpdate" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">서류파일 수정</h4>
	                <button type="button" class="close" data-bs-dismiss="modal"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="memberdocuFileUpdateForm">
		            <div class="modal-body">
						<div class="writeLeft">
						<p id="memId" style="display: none;"></p> 
						<input type="hidden" name='memId' value="${info.mem_id}">
						<input type="hidden" name="FpIdx">					
							<p class="writeArea">
							<span id="WriteName">파일분류 : </span>
							<select name="fpcCate" onchange="changePart($(this))" style="width:200px;height:30px;font-size:12px;">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="학력">학력</option>
									<option value="자격증">자격증</option>
									<option value="경력">경력</option>
									<option value="기타">기타</option>
								</select> 
							</p> <br>
							
							<p class="writeArea" style="margin-bottom: 0px;"><span id="WriteName" style="text-align: left;">서류파일 : </span></p>																												
						</div>
						<div class="writeRight">																												
						</div>
						<div>
							<input name="memPhoto" class="form-control" type="file" id="formFile" onchange="fileCheck(this)">
							<span>기존 서류파일 : </span><span class="memdocumentOri"></span>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="memDocumentFileUpdate">
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
function fileCheck(obj) {
	console.log(obj.value)
    pathpoint = obj.value.lastIndexOf('.');
    filepoint = obj.value.substring(pathpoint+1,obj.length);
    filetype = filepoint.toLowerCase();

    }


// 서류파일 수정 유효성 검사
$("#memDocumentFileUpdate").click(function(){
	
	var $memId = $('#memberdocuFileUpdateForm input[name=memId]');
	var $FpIdx = $('#memberdocuFileUpdateForm input[name=FpIdx]');

	var $fpcCate = $('#memberdocuFileUpdateForm select[name=fpcCate]');

	
	var formData = new FormData(); 
	
	if($fpcCate.val()==''){
		alert("파일분류를 선택해 주세요");
		$fpcCate.focus();
	}else{
		
			$('#memberdocuFileUpdateForm input').each(function(){
				var key = $(this).attr('name');
				var key2 = $fpcCate.attr('name');

				if(key == 'memPhoto'){
					formData.append(key,$(this)[0].files[0]);
				}else{
					formData.append(key, $(this).val());
					formData.append(key2, $fpcCate.val());
				}
			});
			
			$.ajax({
				type:'POST',
				url:'memberdocuFileUpdateForm.do',
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