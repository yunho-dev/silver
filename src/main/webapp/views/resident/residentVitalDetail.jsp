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


<div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
         <!-- 여기 안에서 개발  -->
         
<div class="page-heading">
            <h3>바이탈</h3>
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
                                                           <input type="hidden" name="vi_num" value="${rd.vi_num}">
                                                  </div>
                     </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">담당자</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_write" placeholder="담당자" value="${rd.vi_write}" id="vi_write" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">시작시간</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_start" placeholder="시작시간" value="${rd.vi_start}" id="vi_start" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">종료시간</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_end" placeholder="종료시간" value="${rd.vi_end}" id="vi_end" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">혈압(mm/Hg)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_blood" placeholder="혈압" value="${rd.vi_blood}" id="vi_blood" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">맥박(회/분)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_heart" placeholder="맥박" value="${rd.vi_heart}" id="vi_heart" autofocus>
                    </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">체온(°C)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_temp" placeholder="체온" value="${rd.vi_temp}" id="vi_temp" autofocus>
                    </div>
                     <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">호흡(회/분)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_breath" placeholder="호흡" value="${rd.vi_breath}" id="vi_breath" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">혈당(mg/dL)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_sugar" placeholder="혈당" value="${rd.vi_sugar}" id="vi_sugar" autofocus>
                    </div>
                    <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">체중(kg)</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_weight" placeholder="체중" value="${rd.vi_weight}" id="vi_weight" autofocus>
                    </div>
                       <div class="input-group mb-3">
                     <span class="input-group-text" id="basic-addon1">특이사항</span> 
                            <input type="text"  class="form-control" aria-label="Username" 
                                 aria-describedby="basic-addon1" name="vi_event" placeholder="특이사항" value="${rd.vi_event}" id="vi_event" autofocus>
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