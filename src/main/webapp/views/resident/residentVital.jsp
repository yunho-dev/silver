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
			$('#residentwriteVitalFormBtn').click(function()
			{
				if($('#vi_write').val() == '')
				{
					alert('담당자를 입력하세요');
					$('#vi_write').focus();
					return;
				}else if($('#vi_start').val() == '')
				{
					alert('시작시간을 입력하세요');
					$('#vi_start').focus();
					return;
				}else if($('#vi_end').val() == '')
				{
					alert('종료시간을 입력하세요');
					$('#vi_end').focus();
					return;
				}else if($('#vi_blood').val() == '')
				{
					alert('혈압을 입력하세요');
					$('#vi_blood').focus();
					return;
				}else if($('#vi_heart').val() == '')
				{
					alert('맥박을 입력하세요');
					$('#vi_heart').focus();
					return;
				}else if($('#vi_temp').val() == '')
				{
					alert('체온을 입력하세요');
					$('#vi_temp').focus();
					return;
				}else if($('#vi_breath').val() == '')
				{
					alert('호흡을 입력하세요');
					$('#vi_breath').focus();
					return;
				}else if($('#vi_sugar').val() == '')
				{
					alert('혈당을 입력하세요');
					$('#vi_sugar').focus();
					return;
				}else if($('#vi_weight').val() == '')
				{
					alert('체중을 입력하세요');
					$('#vi_weight').focus();
					return;
				}else if($('#vi_event').val() == '')
				{
					alert('특이사항를 입력하세요');
					$('#vi_event').focus();
					return;
				}

				$('#residentwriteVitalForm').submit();
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
               <form action="residentwriteVital.do" method="POST" class="form form-horizontal" id="residentwriteVitalForm">
                  <div class="form-body">
                     <div class="row">                                              
                        <div class="col-md-8 form-group">
                           <h5>바이탈</h5>
                           <input type="hidden" name="re_idx" value="${rd.re_idx}"/>
                        </div>
                        <table  class="table mb-0" >
                           <tr>
                              <td>담당자</td>
                                 <td>
                                     <input type="text" name="vi_write" placeholder="담당자" value="${rd.vi_write}" id="vi_write">
                                 </td>
                              </tr>
                           <tr>
                              <td>시작시간</td>
                              <td>
                                   <input type="time" name="vi_start" placeholder="2022-12-20 19:00:00.000" value="${rd.vi_start}" id="vi_start">
                              </td>
                           </tr>
                           <tr>
                              <td>끝난시간</td>
                              <td>
                                 <input type="time" name="vi_end" placeholder="2022-12-20 19:00:00.000" value="${rd.vi_end}" id="vi_end">
                              </td>
                           </tr>
                           <tr>
                              <td>혈압(mm/Hg)</td>
                              <td>
                                 <input type="number" name="vi_blood" placeholder="혈압" id="vi_blood" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>맥박(회/분)</td>
                              <td>
                                  <input type="number" name="vi_heart" placeholder="맥박" id="vi_heart" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>체온(°C)</td>
                              <td>
                                 <input type="number" name="vi_temp" placeholder="체온" id="vi_temp" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>호흡(회/분)</td>
                              <td>
                                  <input type="number" name="vi_breath" placeholder="호흡" id="vi_breath" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>혈당(mg/dL)</td>
                              <td>
                                   <input type="number" name="vi_sugar" placeholder="혈당" id="vi_sugar" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>몸무게(kg)</td>
                              <td>
                                   <input type="number" name="vi_weight" placeholder="몸무게" id="vi_weight" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                              </td>
                           </tr>
                           <tr>
                              <td>특이사항</td>
                              <td>
                                   <input type="text" name="vi_event" placeholder="특이사항" id="vi_event">
                              </td>
                           </tr>
                        </table>
                        <div class="col-sm-12 d-flex justify-content-end">
                            <button type="button" id="cancleBtn" class="btn btn-primary">취소</button>
                         <button type="button" id="residentwriteVitalFormBtn" class="btn btn-primary">등록</button>
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