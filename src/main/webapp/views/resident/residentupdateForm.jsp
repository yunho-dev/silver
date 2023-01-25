<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">



   <script>
      $(document).ready(function() {
         
         //문의사항 답변 수정 유효성 검사
         $('#residentupdateFormBtn').click(function()
         {
            if($('#re_name').val() == '')
            {
               alert('이름을 입력하세요');
               $('#re_name').focus();
               return;
            }else if($('#re_jumin').val() == '')
            {
               alert('주민번호를 입력하세요');
               $('#re_jumin').focus();
               return;
            }else if($('#re_pnum').val() == '')
            {
               alert('연락처를 입력하세요');
               $('#re_pnum').focus();
               return;
            }else if($('#re_addr').val() == '')
            {
               alert('주소를 입력하세요');
               $('#re_addr').focus();
               return;
            }else if($('#re_daddr').val() == '')
            {
               alert('상세주소를 입력하세요');
               $('#re_daddr').focus();
               return;
            }else if($('#ro_name').val() == '')
            {
               alert('생활실을 입력하세요');
               $('#ro_name').focus();
               return;
            }else if($('#re_sick').val() == '')
            {
               alert('주요질환을 입력하세요');
               $('#re_sick').focus();
               return;
            }else if($('#re_text').val() == '')
            {
               alert('비고를 입력하세요');
               $('#re_text').focus();
               return;
            }

            $('#residentupdateForm').submit();
         });
            //취소 버튼 클릭시 이전페이지로         
            $('#cancleBtn').click(function(){
               location.href = 'resident';
            });
      });
      </script>

</head>
<body>
<%
int hope = (int)session.getAttribute("hope");
System.out.println(hope);
%>
    <div id="app">
	<c:set var = "power" scope = "session" value = "${hope}"/>
		<c:choose>
		<c:when test="${power == 1}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:when test="${power == 2}">
			<jsp:include page="../adminsidebar.jsp"></jsp:include>
		</c:when>
		<c:otherwise>
		<jsp:include page="../sidebar.jsp"></jsp:include>
		</c:otherwise>
		</c:choose>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
         <!-- 여기 안에서 개발  -->         
      <div class="page-heading">
            <h3>입소자 수정</h3>
      </div>

      
      
      
<div class="page-content">
            <section class="row">
               <div class="card">
                  <div class="card-body py-4 px-5">
         <form action="residentupdate.do" method="POST" enctype="multipart/form-data" class="form form-horizontal" id="residentupdateForm">
               <div class="d-flex align-items-center">
               <div class="input-group mb-3">
                           <span class="input-group-text" id="basic-addon1">입소자</span> 
                           <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="re_name" placeholder="입소자" value="${rd.re_name}" id="re_name" autofocus>
                            <input type="hidden" name="re_idx" value="${rd.re_idx}"/>
                     </div>
               </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">주민번호</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="re_jumin" placeholder="주민번호" value="${rd.re_jumin}" id="re_jumin" autofocus>
                    </div>
                    <div class="input-group mb-3">
                          <span class="input-group-text" id="basic-addon1">변경 전 성별</span> 
                          <span class="input-group-text" >${rd.re_gender}</span>
                          <span class="input-group-text" id="basic-addon1">변경 후 성별</span> 
                          <select id="re_gender" name="re_gender">               
                     <option value="남">남</option>
                     <option value="여">여</option>
                  </select>
                    </div>
                       <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">휴대폰</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="re_pnum" placeholder="휴대폰" value="${rd.re_pnum}" id="re_pnum" autofocus>
                     </div>
                      <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">주소</span> 
                         <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="re_addr" placeholder="주소" value="${rd.re_addr}" id="re_addr" autofocus>
                     </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">상세주소</span> 
                         <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="re_daddr" placeholder="상세주소" value="${rd.re_daddr}" id="re_daddr" autofocus>
                     </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">변경 전 생활실</span> 
                     <span class="input-group-text" >${rd.ro_name}</span>
                     <span class="input-group-text" id="basic-addon1">변경 할 생활실</span> 
                     <span id="room">
					</span> 
                     </div>
                      <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">변경 전 등급</span>
                     <span class="input-group-text" >${rd.re_grade}</span>
                     <span class="input-group-text" id="basic-addon1">변경 할 등급</span> 
                         <select id="re_grade" name="re_grade">               
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                     </select>
                     </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">변경 전 현황</span>
                      <span class="input-group-text" >${rd.re_state}</span>
                     <span class="input-group-text" id="basic-addon1">변경 후 현황</span> 
                         <select id="re_state" name="re_state">               
                        <option value="입소중">입소중</option>
                        <option value="외출">외출</option>
                        <option value="외박">외박</option>
                        <option value="퇴소">퇴소</option>
                     </select>
                     </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">주요질환</span> 
                         <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="re_sick" placeholder="주요질환" value="${rd.re_sick}" id="re_sick" autofocus>
                     </div>
                      <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">비고</span> 
                         <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="re_text" placeholder="비고" value="${rd.re_text}" id="re_text" autofocus>
                     </div>
                      <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">사진</span> 
                         <input type="file"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1"  name="photo_fp_oriFileName" accept="image/gif, image/jpeg, image/png" placeholder="사진" value="${rd.fp_oriFileName}" id="photo_fp_oriFileName" autofocus>
                     </div>
                                                    
                                                    

                     
                                                                       
                   <div class="col-sm-12 d-flex justify-content-end">
                           <button type="button" id="cancleBtn" class="btn btn-primary">취소</button>
                         <button type="button" id="residentupdateFormBtn" class="btn btn-primary">등록</button>
                   
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
      
      
      
       </div>
</div>

 <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
</body>
<script>

roomListCall();
function roomListCall() { 
    	$.ajax({
    		type : 'get',
    		url : 'roomListCall.go',
    		data : {
    		},
    		dataType : 'json',
    		success : function(data) {
    			console.log("roomListCall ajax");
    			console.log(data);
    			roomList(data);
    		},
    		error : function(e) {
    			console.log(e);
    		}
    	});
    }


function roomList(room) {
	var content = '';
		content+='<select id="ro_name" name="ro_name">';
	for (var i = 0; i < room.rd.length; i++) {
		console.log("dddd");
		content+='<option value="'+room.rd[i].ro_name+'">'+room.rd[i].ro_name+'</option>';
	}
	content+='</select>';
	$("#room").empty();
	$("#room").append(content);

}

</script>
</html>