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

<style>
	#firstdata{
		width="500px"
		height="140px"
	}

</style>


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
         
 	<form action="residentdetail" method="get"> 
   <section class="section">   
      <div id="firstdata" class="table-responsive">
         <table class="table table-borderless mb-0">
         	<tr>
                <th>입소번호</th>                                                   
                <td>${rd.re_idx}</td>                                                   
            </tr>
            <tr>
                <th>입소자</th>                                                   
                <td>${rd.re_name}</td>                                                   
            </tr>
            <tr>
                <th>주민번호</th>                                                   
                <td>${rd.re_jumin}</td>                                                   
            </tr>
            <tr>
                <th>성별</th>                                                   
                <td>${rd.re_gender}</td>                                                   
            </tr>
            <tr>
                <th>휴대폰</th>                                                   
                <td>${rd.re_pnum}</td>                                                   
            </tr>
            <tr>
                <th>입소일</th>                                                   
                <td>${rd.date}</td>                                                   
            </tr>
            <tr>
                <th>주소</th>                                                   
                <td>${rd.re_addr}</td>                                                   
            </tr>
            <tr>
                <th>상세주소</th>                                                   
                <td>${rd.re_daddr}</td>                                                   
            </tr>
            <tr>
                <th>생활실</th>                                                   
                <td>${rd.ro_name}</td>                                                   
            </tr>
            <tr>
                <th>등급</th>                                                   
                <td>${rd.re_grade}</td>                                                   
            </tr>
            <tr>
                <th>현황</th>                                                   
                <td>${rd.re_state}</td>                                                   
            </tr>
            <tr>
                <th>사진</th>                                                   
                <td>
						<img width="110px" height="140px" src="/filephoto/${rd.fp_newFileName}"/>
				</td>          
            </tr>  
            <tr>
                <th>주요질환</th>                                                   
                <td>${rd.re_sick}</td>                                                   
            </tr>
            <tr>
                <th>비고</th>                                                   
                <td>${rd.re_text}</td>                                                   
            </tr>
            <tr>
                <th>첨부파일</th> 
               
               <!-- 
                	<c:forEach var="item" items="${rd.file_fp_newFileName}">				
                	 <td>	
					     <a href="resifileDownload.do?path=${rd.file_fp_newFileName}" > ${rd.file_fp_oriFileName}</a>				
					 </td>  	
					</c:forEach>        
					 -->         
					 <c:forEach var="item" items="${rdfile}">				
                	 <td>	
					     <a href="resifileDownload.do?path=${item.fp_newFileName}" > ${item.fp_oriFileName}</a>	
					     <br>			
					 </td>  	
					</c:forEach>                 
            </tr> 
  			  
            
            
            
            
            
            
            
                                        </table>
                                    </div>                                
                </section>
               <a href="resident" class="btn btn-primary">리스트</a>			
               <a href="./residentupdateForm.go?re_idx=${rd.re_idx}" class="btn btn-primary">수정</a>
		</form>	
  		
  		
  		
  		
         
         
         
         

         
         
         
         
         
         
         
         
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