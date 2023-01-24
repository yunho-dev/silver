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
   
   
  <div class="card-body">
         <form action="residentUpdatedetail.do" method="POST" class="form form-horizontal">
            <div class="form-body">
                <div class="row">                                              
                    <div class="col-md-8 form-group">
                        <h5>약품</h5>
                           <input type="hidden" name="re_idx" value="${rd.re_idx}"/>
                    </div>
                  <table>
                     <tr>
                        <td>담당자</td>
                        <td>
                           <input type="text" name="me_write" placeholder="담당자" value="${rd.me_write}">
                                                             <input type="hidden" name="cc_idx" value="${rd.cc_idx}"/>
                        </td>
                     </tr>
                     <tr>
                        <td>시작시간</td>
                        <td>
                           <input type="datetime" name="me_start" value="${rd.me_start}">
                        </td>
                     </tr>
                     <tr>
                        <td>끝난시간</td>
                        <td>
                           <input type="datetime" name="me_end" value="${rd.me_end}">
                        </td>
                     </tr>
                     <tr>
                        <td>약품명</td>
                        <td>
                            <input type="datetime" name="me_name" placeholder="약품명" value="${rd.me_name}">
                        </td>
                     </tr>
                     <tr>
                        <td>투여량</td>
                        <td>
                           <input type="datetime" name="me_volume" placeholder="투여량" value="${rd.me_volume}">
                        </td>
                     </tr>
                     <tr>
                        <td>투여방법</td>
                        <td>
                             <input type="text" name="me_way" placeholder="투여방법" value="${rd.me_way}">
                        </td>
                     </tr>
                     <tr>
                        <td>특이사항</td>
                        <td>
                             <input type="text" name="me_event" placeholder="특이사항" value="${rd.me_event}">
                        </td>
                     </tr>
                  </table>
         
                                                                                              
                           <div class="col-sm-12 d-flex justify-content-end">
                         <a href="residentCategory" class="btn btn-primary">취소</a>         
                                <button >등록</button>
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