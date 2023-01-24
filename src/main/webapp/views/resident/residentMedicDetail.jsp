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
			$('#residentUpdatedetailBtn').click(function()
			{
				if($('#me_write').val() == '')
				{
					alert('담당자를 입력하세요');
					$('#me_write').focus();
					return;
				}else if($('#me_start').val() == '')
				{
					alert('시작시간을 입력하세요');
					$('#me_start').focus();
					return;
				}else if($('#me_end').val() == '')
				{
					alert('종료시간을 입력하세요');
					$('#me_end').focus();
					return;
				}else if($('#me_name').val() == '')
				{
					alert('약품명을 입력하세요');
					$('#me_name').focus();
					return;
				}else if($('#me_volume').val() == '')
				{
					alert('투여량을 입력하세요');
					$('#me_volume').focus();
					return;
				}else if($('#me_way').val() == '')
				{
					alert('투여방법을 입력하세요');
					$('#me_way').focus();
					return;
				}else if($('#me_event').val() == '')
				{
					alert('특이사항을 입력하세요');
					$('#me_event').focus();
					return;
				}

				$('#residentUpdatedetailForm').submit();
			});
				//취소 버튼 클릭시 이전페이지로			
				$('#cancleBtn').click(function(){
					location.href = 'residentCategory';
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
            <h3>약품</h3>
      </div>
   
   
  <div class="page-content">
            <section class="row">
               <div class="card">
                  <div class="card-body py-4 px-5">
         <form action="residentUpdatedetail.do" method="POST" class="form form-horizontal" iclass="form form-horizontal" id="residentUpdatedetailForm">
            <div class="d-flex align-items-center">
               <div class="input-group mb-3">
                           <input type="hidden" name="re_idx" value="${rd.re_idx}"/>
                           <input type="hidden" name="cc_idx" value="${rd.cc_idx}"/>
                           <input type="hidden" name="me_num" value="${rd.me_num}"/>
                    </div>
               </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">담당자</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_write" placeholder="담당자" value="${rd.me_write}" id="me_write" autofocus>
              </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">시작시간</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_start" placeholder="시작시간" value="${rd.me_start}" id="me_start" autofocus>
              </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">끝난시간</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_end" placeholder="끝난시간" value="${rd.me_end}" id="me_end" autofocus>
              </div>
                <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">약품명</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_name" placeholder="약품명" value="${rd.me_name}" id="me_name" autofocus>
              </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">투여량</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_volume" placeholder="투여량" value="${rd.me_volume}" id="me_volume" autofocus>
              </div>
              <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">투여방법</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_way" placeholder="투여방법" value="${rd.me_way}" id="me_way" autofocus>
              </div>
                <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">특이사항</span> 
                            <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="me_event" placeholder="특이사항" value="${rd.me_event}" id="me_event" autofocus>
              </div>
               
               
         
                                                                                              
                           <div class="col-sm-12 d-flex justify-content-end">
                                 <button type="button" id="cancleBtn" class="btn btn-primary">취소</button>
                               <button type="button" id="residentUpdatedetailBtn" class="btn btn-primary">등록</button>
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


</script>
</html>