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




</head>
 <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
<body>


<div id="app">
      <jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
        <jsp:include page="../upbar.jsp"></jsp:include>
         <!-- 여기 안에서 개발  -->
         
         
         
         
         
		
  <div class="card-body">
         <form action="residentwrite.do" method="POST" enctype="multipart/form-data" class="form form-horizontal">
                                            <div class="form-body">
                                                <div class="row">
                                                	<div class="col-md-4">
                                                        <label>카테고리</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <h1>치료</h1>
                                                   		 <input type="hidden" name="cu_num" value="${cure.cu_num}"/>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>작성자</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="mem_name" placeholder="작성자" value="${member.mem_name}">
                                                   		 <input type="hidden" name="mem_id" value="${member.mem_id}"/>
                                                    </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>시작시간</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="date" name="co_start" placeholder="2022-12-20 19:00:00.000" value="${cure.co_start}">
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>끝난시간</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="date" name="co_end" placeholder="2022-12-20 19:00:00.000" value="${cure.co_end}">
                                                    </div>
                                                    <div class="col-md-4">
                                                       <label>내용</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="cu_content" placeholder="내용" value="${cure.cu_content}">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>특이사항</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="co_event" placeholder="특이사항" value="${cure.co_event}">
                                                    </div>
                                                    
                                                    

                     
                                                                       
                   <div class="col-sm-12 d-flex justify-content-end">
						 <a href="resident" class="btn btn-primary">취소</a>			
                         <button >등록</button>
                   
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
		
		
		
       </div>
</div>
</body>
<script>


</script>
</html>