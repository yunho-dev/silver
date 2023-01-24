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
				if($('#co_write').val() == '')
				{
					alert('담당자를 입력하세요');
					$('#co_write').focus();
					return;
				}else if($('#co_start').val() == '')
				{
					alert('시작시간을 입력하세요');
					$('#co_start').focus();
					return;
				}else if($('#cu_content').val() == '')
				{
					alert('내용을 입력하세요');
					$('#cu_content').focus();
					return;
					
				}else if($('#co_event').val() == '')
				{
					alert('특이사항를 입력하세요');
					$('#co_event').focus();
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
            <h3>치료</h3>
      </div>
         
         
         
         
         
         <div class="page-content">
            <section class="row">
               <div class="card">
                  <div class="card-body py-4 px-5">
               <form action="residentUpdatedetail.do" method="POST" class="form form-horizontal" id="residentUpdatedetailForm">
                  <div class="d-flex align-items-center">
               <div class="input-group mb-3">
                           
                           <input type="hidden" name="re_idx" value="${rd.re_idx}">
                           <input type="hidden" name="cc_idx" value="${rd.cc_idx}">
                           <input type="hidden" name="cu_num" value="${rd.cu_num}">
                        </div>
               </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">담당자</span> 
                                 <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="co_write" placeholder="담당자" value="${rd.co_write}" id="co_write" autofocus>
                              </div>
                    
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">시작시간</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="co_start" placeholder="시작시간" value="${rd.co_start}" id="co_start" autofocus>
                    </div>
                   <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">종료시간</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="co_end" placeholder="종료시간" value="${rd.co_end}" id="co_end" autofocus>
                    </div> 
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">담당자</span> 
                                 <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="co_write" placeholder="담당자" value="${rd.co_write}" id="co_write" autofocus>
                     </div>
               <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">내용</span> 
                                 <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="cu_content" placeholder="내용" value="${rd.cu_content}" id="cu_content" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">특이사항</span> 
                                 <input type="text"   class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="co_event" placeholder="특이사항" value="${rd.co_event}" id="co_event" autofocus>
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
                     
                     <%--   <div class="col-md-8 form-group">
                           <label>담당자 : </label>
                           <input type="text" name="co_write" placeholder="담당자" value="${rd.co_write}">
                       </div>
                        <div class="col-md-8 form-group">
                       </div>
                     
                       <div class="col-md-8 form-group">
                           <label>시작시간 : </label>
                          <input type="time" name="co_start" placeholder="2022-12-20 19:00:00.000" value="${rd.co_start}">
                       </div>
                     
                       <div class="col-md-8 form-group">
                           <label>끝난시간</label>
                           <input type="time" name="co_end" placeholder="2022-12-20 19:00:00.000" value="${rd.co_start}">
                       </div>
                      
                       <div class="col-md-8 form-group">
                          <label>내용</label>
                           <input type="text" name="cu_content" placeholder="내용" value="${rd.cu_content}">
                       </div>
                       
                        <div class="col-md-8 form-group">
                           <label>특이사항</label>
                           <input type="text" name="co_event" placeholder="특이사항" value="${rd.co_event}">
                       </div> --%>
                       
                       
                       <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
                       
</body>

<script>


</script>
</html>