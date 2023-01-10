<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style>		
		#abcabc {
		    list-style:none;
		}
		 
		#acdacd {
		    float: left;
		    margin-right:20pt;
		    margin-top:10pt;
		   
		}
		
		#mypagetab{
			background-color:#25ADDF;
			text-align:center;
		}
		
		#ad{			
			color:white;
			text-decoration: none;
		}


	</style>
</head>
<body>
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		
	    <div id="main">
	    	<jsp:include page="../upbar.jsp"></jsp:include>	
       	 	<div class="page-heading">
                <section class="section">
                    
                    <div class="card" style="width:100%; font-size:3pt;  display:flex;" >
                        <div class="card-body" >
								<table class="table table-striped" id="table1">
								<!--1줄-->
								<tr>
									<td rowspan="7" align="center" width="120" height="150"><img src="사진" alt="사진"></td>
									<td >이름</td>
									<td width="225">${info.mem_name}</td>
									<td >전화번호</td>
									<td width="225">${info.mem_pnum}</td>
									<td width="110" >전자서명</td>
									<td width="110">
									<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">전자서명 변경</a>
									</div>
									</td>
								</tr>
								 
								<!--2줄-->
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>성별</td>
									<td>${info.mem_gender}</td>
									<td>근무 현황</td>
									<td>${info.mem_state}</td>
									<td rowspan="6" colspan="2" align="center" width="120" height="150"><img src="사진" alt="전자서명"></td>
								</tr>
								
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>아이디</td>
									<td>${info.mem_id}</td>
									<td>직책</td>
									<td>${info.pos_name}</td>
								</tr>
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>이메일</td>
									<td>${info.mem_email}</td>
									<td>담당직종</td>
									<td>${info.part_name}</td>
								</tr>																
								<!--4줄-->
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>생년월일</td>
									<td>${info.mem_birth}</td>
									<td>담당부서</td>
									<td>${info.dept_name}</td>
								</tr>
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>입사일</td>
									<td>${info.mem_indate}</td>
									<td>퇴사일</td>
									<td>								
									<c:set var="name" value="1900-01-01" />
									<c:if test="${info.mem_outdate eq name}">
									    <c:out value="X" />
									</c:if>
									<c:if test="${info.mem_outdate ne name}">
									    <c:out value="${info.mem_outdate }" />
									</c:if>									
									</td>
								</tr>
								<tr>
									<!--<td></td>-->
									<!--<td></td>-->
									<td>주소</td>
									<td>${info.mem_addr}</td>
									<td>상세주소</td>
									<td>${info.mem_daddr}</td>
								</tr>									
								
								<!--5줄-->
								<tr>
									<!--<td></td>-->
									<td>
									<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">비밀번호 변경</a>
									</div>
									</td>
									<!--<td></td>-->
									<td colspan="3"></td>
									<!--<td></td>-->
									<!--<td></td>-->
								</tr>
								</table>
                        </div>   
                       </div>
                       
                       <div class="card" id="mypagetab">
                       		<ul id="abcabc">
                       		<li id="acdacd"><a href="#" id="ad">학력</a></li>
                       		<li id="acdacd"><a href="#" id="ad">자격증</a></li>
                       		<li id="acdacd"><a href="#" id="ad">경력</a></li>
                       		<li id="acdacd"><a href="#" id="ad">서류파일</a></li>
                       		<li id="acdacd"><a href="#" id="ad">결제문서</a></li>
                       		</ul>                       		
                       </div>   

                                      
                    <div class="card" style="width:100%; font-size:3pt;">
                        <div class="card-header">
                           학력
                        </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table2">
                                <thead>
                                    <tr>
                                        <th>학교명</th>
                                        <th>기간</th>
                                        <th>전공 분야</th>
                                        <th>졸업 유무</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
                                	<tr id="pager">
                                		<td colspan="5">
                                	<div>

                                    </div>
                                    </td>
                                    </tr>      
                            </table>
                             		<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">학력 등록</a>
									</div>                             
                        </div>                       
                    </div>

                    <div class="card" style="width:100%; font-size:3pt;">
                        <div class="card-header">
                           자격증
                        </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table2">
                                <thead>
                                    <tr>
                                        <th>자격증명</th>
                                        <th>시행처</th>
                                        <th>취득일</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
                                	<tr id="pager">
                                		<td colspan="4">
                                	<div>

                                    </div>
                                    </td>
                                    </tr>
                            </table>
                             		<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">자격증 등록</a>
									</div>                              
                        </div>                       
                    </div>

                    <div class="card" style="width:100%; font-size:3pt;">
                        <div class="card-header">
                          경력
                        </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table2">
                                <thead>
                                    <tr>
                                        <th>직장명</th>
                                        <th>기간</th>
                                        <th>담당 업무</th>
                                        <th>직책</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
                                	<tr id="pager">
                                		<td colspan="5">
                                	<div>

                                    </div>
                                    </td>
                                    </tr>
                            </table>
                             		<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">경력 등록</a>
									</div>                              
                        </div>                       
                    </div>

                    <div class="card" style="width:100%; font-size:3pt;">
                        <div class="card-header">
                           서류파일
                        </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table2">
                                <thead>
                                    <tr>
                                        <th>파일 이름</th>
                                        <th>파일 등록일</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
                                	<tr id="pager">
                                		<td colspan="3">
                                	<div>

                                    </div>
                                    </td>
                                    </tr>
                            </table>
                             		<div class="buttons">
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">서류파일 등록</a>
									</div>                              
                        </div>                       
                    </div>


                    <div class="card" style="width:100%; font-size:3pt;">
                        <div class="card-header">
                           전자문서
                        </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table2">
                                <thead>
                                    <tr>
                                        <th>문서번호</th>
                                        <th>등록일</th>
                                        <th>문서 제목</th>
                                        <th>첨부 자료</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
                                	<tr id="pager">
                                		<td colspan="5">
                                	<div>

                                    </div>
                                    </td>
                                    </tr>
                            </table>
                        </div>                       
                    </div>


                    
                </section>
            </div>		
		
		
		
		
		</div>
	</div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>   	
</body>
<script></script>
</html>