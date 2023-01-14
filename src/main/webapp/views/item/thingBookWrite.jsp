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
    .bottom {
	    position: absolute;
	    bottom: 2px;
	}
</style>
<body>
	<!--large size Modal -->
	<div class="modal fade text-left" id="thingBookWrite" tabindex="-1" role="dialog"
	    aria-labelledby="myModalLabel17" aria-hidden="true">
	    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
	        role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title" id="myModalLabel17">비품 사용 예약 등록</h4>
	                <button type="button" class="close" onclick="closeWriteModal()"
	                    aria-label="Close" style="font-size: 22pt;">
	                    &times;
	                </button>
	            </div>
	            <form id="writeForm">
		            <div class="modal-body">
						<div class="writeLeft">
							<p class="writeArea"><span id="WriteName">품명 : </span> 
								<input type="text" name="thName">&nbsp;
							</p> <br>
							<p class="writeArea">
								<span id="WriteName">사용자 구분 : </span> 
								<select name="user" onchange="changeUser($(this))">
									<option value="" selected="selected" style="display: none;">선택</option>
									<option value="입소자">입소자</option>
									<option value="직원">직원</option>
								</select><br>
							</p> <br>
							<p class="writeArea">
								<span id="WriteName">사용자 : </span> 
								<input type="text" name="user" readonly="readonly" onclick="alert('사용자 구분을 먼저 선택해 주세요')" style="cursor: pointer;">
							</p>
						</div>
						<div class="writeRight">
							<p class="writeArea">
								<span id="WriteName">예약 시작 날짜 : </span> 
								<input type="text" name="hisRent"><br>
							</p><br>
							<p class="writeArea">
								<span id="WriteName">얘약 끝날 날짜 : </span> 
								<input type="text" name="hisRent"><br>
							</p>
						</div>
		            </div>
		            <div class="modal-footer" >
		            	<div style="margin: auto;">
		            		<button type="button" class="btn btn-primary ml-1" id="regist">
			                    <span class="d-none d-sm-block">등록하기</span>
			                </button>
			                <button type="button" class="btn btn-light-secondary"
			                    onclick="closeWriteModal()">
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
	function closeWriteModal(){
		$('#thingBookWrite').modal('hide');
		$('#writeForm')[0].reset();
	}
	
	function changeUser(selected){
		var selVal = selected.val();
		if(selVal === '입소자'){
			$('#writeForm input[name=user]').attr('onclick','selectResident()')
		}else{
			$('#writeForm input[name=user]').attr('onclick','selectMember()')
		}
	}
	
	function selectResident(){
		var url = "thingResidentList.go";
        var name = "thingResidentList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option)
	}
	
	function selectMember(){
		var url = "thingMemberList.go";
        var name = "thingMemberList";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option)
	}
	
</script>
</html>