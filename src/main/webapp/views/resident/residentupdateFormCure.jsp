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
                                        <form action="residentupdate.do" method="POST" enctype="multipart/form-data" class="form form-horizontal">
                                            <div class="form-body">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label>입소자</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_name" placeholder="입소자" value="${rd.re_name}">
                                                   		 <input type="hidden" name="re_idx" value="${rd.re_idx}"/>
                                                    </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <label>주민번호</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_jumin" placeholder="주민번호" value="${rd.re_jumin}">
                                                    </div>
                                                    <div class="col-md-4">
                                                       <label>성별</label>
                                                    </div>
                                                    <div>
                                                    	<select id="re_gender" name="re_gender">					
															<option value="남">남</option>
															<option value="여">여</option>
														</select>
                                                    </div>
                                                    <div class="col-md-4">
                                                       <label>휴대폰</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_pnum" placeholder="휴대폰" value="${rd.re_pnum}">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>주소</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_addr" placeholder="주소" value="${rd.re_addr}">
                                                    </div>
                                                     <div class="col-md-4">
                                                        <label>상세주소</label>                                                  
                                                    </div>
                                                     <div class="col-md-4">
                                                     <div class="col-md-8 form-group">
                                                        <input type="text" name="re_daddr" placeholder="상세주소" value="${rd.re_daddr}">
                                                    </div>
                                                     <div class="col-md-4">
                                                         <label>생활실</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="ro_name" placeholder="생활실" value="${rd.ro_name}">
                                                    </div>
                                                    <div class="col-md-4">
                                                         <label>등급</label>
                                                    </div>                                                    
                                                    <div>
                                                    	<select id="re_grade" name="re_grade">					
															<option value="1">1</option>
															<option value="2">2</option>
															<option value="3">3</option>
															<option value="4">4</option>
														</select>
                                                    </div>
                                                    <div class="col-md-4">
                                                         <label>현황</label>
                                                    </div>
                                                    <div>
                                                    	<select id="re_state" name="re_state">					
															<option value="입소중">입소중</option>
															<option value="외출">외출</option>
															<option value="외박">외박</option>
															<option value="입원중">입원중</option>
															<option value="퇴소">퇴소</option>
														</select>
                                                    </div>
                                                    <div class="col-md-4">
                                                         <label>주요질환</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_sick" placeholder="주요질환" value="${rd.re_sick}">
                                                    </div>
                                                     <div class="col-md-4">
                                                         <label>비고</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="text" name="re_text" placeholder="비고" value="${rd.re_text}">
                                                    </div>
                                                     <div class="col-md-4">
                                                         <label>사진</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="file" name="photo_fp_oriFileName" accept="image/gif, image/jpeg, image/png" placeholder="사진" value="${rd.fp_oriFileName}">
                                                    </div>
                                                    
                                                    
                                                    <div class="col-md-4">
                                                         <label>파일</label>
                                                    </div>
                                                    <div class="col-md-8 form-group">
                                                        <input type="file" name="fp_oriFileName" multiple="multiple" placeholder="파일" value="">
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

<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
 <script src="assets/js/bootstrap.bundle.min.js"></script>
 <script src="assets/js/pages/dashboard.js"></script>
 <script src="assets/js/main.js"></script>
</body>
<script>


</script>
</html>