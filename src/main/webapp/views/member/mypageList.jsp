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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="assets/js/jquery.twbsPagination.js"></script>
	
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
       	 	<div class="page-heading">
                <section class="section">
                    
                    <div class="card" style="width:100%; font-size:10pt;  display:flex;" >
                        <div class="card-body" >
                            		<div class="buttons" style="float:right;">
									<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#signChange" onclick="updateSignForm()">전자서명 수정</a>
									</div> 
									<jsp:include page="signChange.jsp"></jsp:include>
								<table class="table table-striped" id="tablemarin">
								<!--1줄-->
								<tr>
									<td rowspan="7" align="center" width="120" height="150"><img src="/filephoto/${photoinfo.fp_newFileName}" alt="사진" style="width:110px;height:140px"></td>
									<td >이름</td>
									<td width="225">${info.mem_name}</td>
									<td >전화번호</td>
									<td width="225">${info.mem_pnum}</td>
									<td width="110" align="center" >전자서명</td>
									<td >
								
									</td>
								</tr>
								 

								<tr>
									<td>성별</td>
									<td>${info.mem_gender}</td>
									<td>근무 현황</td>
									<td>${info.mem_state}</td>
									<td rowspan="6" colspan="2" align="center" width="120" height="150"><img src="/sign/${signinfo.si_newFileName}" alt="전자서명" style="width:110px;height:140px"></td>
								</tr>
								
								<tr>
									<td>아이디</td>
									<td class="marin">${info.mem_id}</td>
									<td>직책</td>
									<td>${info.pos_name}</td>
								</tr>
								<tr>

									<td>이메일</td>
									<td>${info.mem_email}</td>
									<td>담당직종</td>
									<td>${info.part_name}</td>
								</tr>																

								<tr>
									<td>생년월일</td>
									<td>${info.mem_birth}</td>
									<td>담당부서</td>
									<td>${info.dept_name}</td>
								</tr>
								<tr>
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
									<td>주소</td>
									<td>${info.mem_addr}</td>
									<td>상세주소</td>
									<td>${info.mem_daddr}</td>
								</tr>									
								
								<tr>
									<td>
									<div class="buttons">
									<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#ChangePassword">비밀번호 변경</a>
									</div>
									<jsp:include page="ChangePassword.jsp"></jsp:include>										
									</td>

									<td colspan="6">
									<div class="buttons" style="float:right;">
									<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#mypageChange" onclick="mypageupdateForm()">개인정보 수정</a>
									</div>	
									<jsp:include page="mypageChange.jsp"></jsp:include>									
									</td>
								</tr>
								</table>

                        </div>   
                       </div>
                       
                       <div class="card" id="mypagetab">
                       		<ul id="abcabc">
                       		<li id="acdacd"><a href="#" id="ad" onclick="EdulistCall(showpage);">학력</a></li>
                       		<li id="acdacd"><a href="#" id="ad" onclick="certlistCall(showpage1);">자격증</a></li>
                       		<li id="acdacd"><a href="#" id="ad" onclick="careerlistCall(showpage2);">경력</a></li>
                       		<li id="acdacd"><a href="#" id="ad" onclick="paperlistCall(showpage3);">서류파일</a></li>
                       		<li id="acdacd"><a href="#" id="ad" onclick="mypaymentlistCall(showpage4);">결제문서</a></li>
                       		</ul>                       		
                       </div>   

                                      
                    <div class="card" style="width:100%; font-size:10pt;">
                    	<div id="undertable">
                    	
                    	
                    	
                    	</div>					
                    	<jsp:include page="writeEdu.jsp"></jsp:include>
                    	<jsp:include page="writeCert.jsp"></jsp:include>
                    	<jsp:include page="writeCareer.jsp"></jsp:include>
                    	<jsp:include page="CertUpdate.jsp"></jsp:include>
                    	<jsp:include page="EduUpdate.jsp"></jsp:include>
                    	<jsp:include page="CareerUpdate.jsp"></jsp:include>
                    	<jsp:include page="writeFileInsert.jsp"></jsp:include>
                    	<jsp:include page="docuFileUpdate.jsp"></jsp:include>
					</div>


                    
                </section>
            </div>				
		</div>
	</div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>   	
</body>
<script>


// 전자서명 정보 불러오는 ajax 함수
function updateSignForm(){
	
	var memId=$('#tablemarin').find('td.marin').text();
	console.log(memId);
	
	
    $.ajax({
    	type:'GET',
		url:'getMemberSignUpdateForm.go',
		data:{'memId':memId},
		dataType:'JSON',
		success:function(data){
			
			//$(".modal-body .SignLeft input[name=memId]").attr('value',data.detail.mem_id);
			
			var newFileName = data.detailPhoto;
			//사진 체크
			if(newFileName != null || newFileName == ''){
				
				$("#signChange input[name=memId]").attr('value',data.myId.mem_id);
				$("#signChange .memSignOri").text(data.detailPhoto.si_newFileName);
			}else{
				$("#signChange input[name=memId]").attr('value',data.myId.mem_id);
				$("#signChange .memSignOri").text('없음');
			}
		},
		error:function(e){
			console.log(e);
		}
    });
}

// 마이페이지 수정에 데이터 넘기는 함수
function mypageupdateForm(){
	
	var memId = $('#tablemarin').find('td.marin').text();
	console.log(memId);

    
	
    $.ajax({
    	type:'GET',
		url:'getMypageUpdateForm.go',
		data:{'memId':memId},
		dataType:'JSON',
		success:function(data){

			$(".modal-body .writeLeft input[name=memAddr]").attr('value',data.detail.mem_addr);			
			
			$(".modal-body .writeRight input[name=memPnum]").attr('value',data.detail.mem_pnum);
			$(".modal-body .writeRight input[name=memDaddr]").attr('value',data.detail.mem_daddr);
			$(".modal-body .writeRight input[name=memEmail]").attr('value',data.detail.mem_email);
			
			
			var newFileName = data.detailPhoto;
			//사진 체크
			if(newFileName != null || newFileName == ''){
				$("#mypageChange input[name=memId]").attr('value',data.detail.mem_id);
				$("#mypageChange .mypagePhotoOri").text(data.detailPhoto.fp_newFileName)
			}else{
				$("#mypageChange input[name=memId]").attr('value',data.detail.mem_id);
				$("#mypageChange .mypagePhotoOri").text('없음')
			}
		},
		error:function(e){
			console.log(e);
		}
    });
 
 
}

/* var auth=true;
 */
var showpage=1;
var showpage1=1;
var showpage2=1;
var showpage3=1;
var showpage4=1;

EdulistCall(showpage);

// 학력 리스트 부르기
function EdulistCall(showpage) { 
	
	var memId = $('#tablemarin').find('td.marin').text();
	
/* 	if( auth !== true){ alert("잠시만 기다려주세요."); return false; }
	auth = false; */
	
    $.ajax({
       type:'GET',
       url:'edulistCall.do',
       data:{'page':showpage, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          edudrawList(data.list);
          
      	 if(data.list!=""){
        	  
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					
					if(showpage!=page){
						EdulistCall(showpage);
						showpage=page;
					}
					
					//EdulistCall(page);
					console.log(e);
				}
			});         
          } 
        	
       },
       error:function(e){
          console.log(e);
       }/* complete:function(){
    	   auth=true;
		}  */   
    });
 }
 
 // 학력 리스트 그리는 함수
function edudrawList(eduList){
	var content='';
	
	
	if(eduList.length < 1){
		var msg = "등록된 학력이 없습니다.";
		content+='<div class="card-header">'+"학력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
		content += '<tr>';
		content += '<td colspan="6">'+msg+'</td>';	
		content += '</tr>';
        content+='</table>';
     	content+='<div class="buttons">';
        content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeEdu">학력 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"학력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
        content+='<thead>';
        content+='<tr>';
        content+='<th>'+"학교명"+'</th>';
        content+='<th>'+"기간"+'</th>';
        content+='<th>'+"전공 분야"+'</th>';
        content+='<th>'+"졸업 유무"+'</th>';
        content+='<th></th>';
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="list">';
		for(var i=0; i<eduList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id" value="'+eduList[i].mem_id+'"></td>'; */
			content+='<td class="edu_name">'+eduList[i].edu_name+'</td>';
			content +='<td>'+eduList[i].edu_start+'~'+eduList[i].edu_end+'</td>';
			content+='<td>'+eduList[i].edu_pass+'</td>';
			content+='<td>'+eduList[i].edu_success+'</td>';
			content+='<td>';
	     	content+='<div class="buttons">';
	     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#EduUpdate" id="modify" onclick=EduUpdateForm($(this))>수정하기</a>';
	        content+='</div>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint" style="margin-left:35%;">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
     	content+='<div class="buttons">';
        content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeEdu">학력 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}


// 자격증 리스트 부르기
function certlistCall(showpage1) { 
	
	var memId = $('#tablemarin').find('td.marin').text();

	
    $.ajax({
       type:'GET',
       url:'certlistCall.do',
       data:{'page':showpage1, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          certdrawList(data.list);
       	 if(data.list!=""){		         
        	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					if(showpage1!=page){
						certlistCall(showpage1);
						showpage1=page;
					}
				}
			}); 
       	 }
       },
       error:function(e){
          console.log(e);
       }    
    });
 }
 
 // 자격증 리스트 그리는 함수
function certdrawList(certList){
	var content='';
	if(certList.length < 1){
		var msg = "등록된 자격증이 없습니다.";
		content+='<div class="card-header">'+"자격증"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';		
		
		content += '<tr>';
		content += '<td colspan="5">'+msg+'</td>';	
		content += '</tr>';
        content+='</table>'; 
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeCert">자격증 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
        
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"자격증"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
        content+='<thead>';
        content+='<tr>';
        content+='<th>'+"자격증명"+'</th>';
        content+='<th>'+"시행처"+'</th>';
        content+='<th>'+"취득일"+'</th>';
        content+='<th></th>';
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="list">';
		for(var i=0; i<certList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id">'+certList[i].mem_id+'</td>'; */
			content+='<td class="ce_name">'+certList[i].ce_name+'</td>';
			content+='<td>'+certList[i].ce_place+'</td>';
			content +='<td>'+certList[i].ce_date+'</td>';
			content+='<td>';
	     	content+='<div class="buttons">';
	        content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#CertUpdate" id="modify" onclick=CertUpdateForm($(this))>수정하기</a>';
	        content+='</div>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint" style="margin-left:35%;">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeCert">자격증 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}
 
// 경력 리스트 부르기
function careerlistCall(showpage2) { 
	
	var memId = $('#tablemarin').find('td.marin').text();
	

	
    $.ajax({
       type:'GET',
       url:'careerlistCall.do',
       data:{'page':showpage2, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);
          
          careerdrawList(data.list);                  

          if(data.list!=""){
        	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					if(showpage2!=page){
						careerlistCall(showpage2);
						showpage2=page;
					}
				}
			});         
          }
       },
       error:function(e){
          console.log(e);
       }    
    });
 }
 
 // 경력 리스트 그리는 함수
function careerdrawList(careerList){
	var content='';
	if(careerList.length < 1){
		var msg = "등록된 경력이 없습니다.";
		content+='<div class="card-header">'+"경력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
		content += '<tr>';
		content += '<td colspan="6">'+msg+'</td>';	
		content += '</tr>';
        content+='</table>';  
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeCareer">경력 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"경력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
        content+='<thead>';
        content+='<tr>';
        content+='<th>'+"직장명"+'</th>';
        content+='<th>'+"담당업무"+'</th>';
        content+='<th>'+"직책"+'</th>';
        content+='<th>'+"기간"+'</th>';
        content+='<th></th>';
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="list">';
		for(var i=0; i<careerList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id">'+careerList[i].mem_id+'</td>'; */
			content+='<td class="ca_name">'+careerList[i].ca_name+'</td>';
			content+='<td>'+careerList[i].ca_work+'</td>';
			content +='<td>'+careerList[i].ca_pos+'</td>';
			content +='<td>'+careerList[i].ca_start +'   ~   '+careerList[i].ca_end+'</td>';
			content+='<td>';
	     	content+='<div class="buttons">';
	     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#CareerUpdate" id="modify" onclick=CareerUpdateForm($(this))>수정하기</a>';
	        content+='</div>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint" style="margin-left:35%;">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeCareer">경력 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}
 

// 서류파일 리스트 부르기
function paperlistCall(showpage3) { 
	
	var memId = $('#tablemarin').find('td.marin').text();
	

	
    $.ajax({
       type:'GET',
       url:'paperlistCall.do',
       data:{'page':showpage3, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          paperdrawList(data.list);
          			       
        	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					if(showpage3!=page){
						paperlistCall(showpage3);
						showpage3=page;
						console.log(showpage3);
					}
				}
			});         
       },
       error:function(e){
          console.log(e);
       }    
    });
 }
 
 // 서류파일 리스트 그리는 함수
function paperdrawList(paperList){
	var content='';
	if(paperList.length < 1){
		var msg = "등록된 서류파일이 없습니다.";
		content+='<div class="card-header">'+"경력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';				
		content += '<tr>';
		content += '<td colspan="3">'+msg+'</td>';	
		content += '</tr>';
        content+='</table>';  
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeFileInsert">서류파일 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';		
		
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"서류파일"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
        content+='<thead>';
        content+='<tr>';
        content+='<th>'+"파일번호"+'</th>';
        content+='<th>'+"파일제목"+'</th>';
        content+='<th>'+"파일등록일"+'</th>';
        content+='<th></th>';
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="list">';
		for(var i=0; i<paperList.length; i++){
			
			content+='<tr>';
			content+='<td class="fp_idx">'+paperList[i].fp_idx+'</td>'; 
			content+='<td class="fp_oriFileName">'+paperList[i].fp_oriFileName+'</td>';
			content+='<td>'+paperList[i].fp_date+'</td>';
			content+='<td>';
	     	content+='<div class="buttons">';
	        content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#docuFileUpdate" id="modify" onclick=docuFileUpdateForm($(this))>수정하기</a>';
	        content+='</div>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint" style="margin-left:35%;">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeFileInsert">서류파일 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
} 
 
var flag=true;
var pageflag=true;
var chkPage=new Array(); 
 
// 결제문서 리스트 부르기
function mypaymentlistCall(showpage4) { 
	
	var memId = $('#tablemarin').find('td.marin').text();
	
	if(flag){
		flag=false;
    $.ajax({
       type:'GET',
       url:'mypaymentlistCall.do',
       data:{'page':showpage4, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);
          mypaymentdrawList(data.list);

      	chkPage.push(data.total);
		if(chkPage.at(-2) != data.total){
			pageflag=true;
		}		
		
		if(pageflag == true && $('.pagination').data("twbs-pagination")){
            $('.pagination').twbsPagination('destroy');
            pageflag=false;
        }
        	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					
					if(showpage4!=page){
						showpage4=page;
						mypaymentlistCall(showpage4);
					}
				}
			});         
       },
       error:function(e){
          console.log(e);
       },complete:function(){
			flag=true;    
       }
    });
	}
 }
 
 // 결제문서 리스트 그리는 함수
function mypaymentdrawList(mypaymentList){
	var content='';
	if(mypaymentList.length < 1){
		var msg = "등록된 결제문서가 없습니다.";
		content += '<tr>';
		content += '<td colspan="3">'+msg+'</td>';	
		content += '</tr>';
		
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"결제문서"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="mytable">';
        content+='<thead>';
        content+='<tr>';
        content+='<th>'+"문서번호"+'</th>';
        content+='<th>'+"제목"+'</th>';
        content+='<th>'+"결제양식"+'</th>';
        content+='<th>'+"결제상태"+'</th>';
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="list">';
		for(var i=0; i<mypaymentList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id">'+mypaymentList[i].mem_id+'</td>'; */
			content+='<td>'+mypaymentList[i].pm_idx+'</td>';
			content+='<td>'+mypaymentList[i].pm_subject+'</td>';
			content+='<td>'+mypaymentList[i].pm_state+'</td>';
			content+='<td>'+mypaymentList[i].pf_cate+'</td>';
			content+='<td>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint" style="margin-left:35%;">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}  
 

// 자격증 수정에 데이터 넘기는 함수
function CertUpdateForm(listRow){
	
	var Cename = listRow.closest('tr').find('.ce_name').text();
	console.log(listRow.closest('tr').find('.ce_name').text());

    /* $(".modal-body #memId").html(memId);  */
	
    $.ajax({
    	type:'GET',
		url:'getMemberCertUpdateForm.go',
		data:{'Cename':Cename},
		dataType:'JSON',
		success:function(data){
			$("#memberCertUpdateForm input[name=certIdx]").attr('value',data.detail.ce_idx);
			$("#memberCertUpdateForm input[name=certName]").attr('value',data.detail.ce_name);
			$("#memberCertUpdateForm input[name=certPlace]").attr('value',data.detail.ce_place);
			$("#memberCertUpdateForm input[name=certDate]").attr('value',data.detail.ce_date);
								
			
		},
		error:function(e){
			console.log(e);
		}
    });
 
 
} 


//학력 수정에 데이터 넘기는 함수
function EduUpdateForm(listRow){
	
	var Eduname = listRow.closest('tr').find('.edu_name').text();
	console.log(listRow.closest('tr').find('.edu_name').text());

    /* $(".modal-body #memId").html(memId);  */
	
    $.ajax({
    	type:'GET',
		url:'getMemberEduUpdateForm.go',
		data:{'Eduname':Eduname},
		dataType:'JSON',
		success:function(data){
			$("#memberEduUpdateForm input[name=eduIdx]").attr('value',data.detail.edu_idx);
			$("#memberEduUpdateForm input[name=eduName]").attr('value',data.detail.edu_name);
			$("#memberEduUpdateForm input[name=eduPass]").attr('value',data.detail.edu_pass);
			$("#memberEduUpdateForm select[name=eduSuccess]").val(data.detail.edu_success);
			$("#memberEduUpdateForm input[name=eduStart]").attr('value',data.detail.edu_start);
			$("#memberEduUpdateForm input[name=eduEnd]").attr('value',data.detail.edu_end);								
			
		},
		error:function(e){
			console.log(e);
		}
    });
 
 
} 


//경력 수정에 데이터 넘기는 함수
function CareerUpdateForm(listRow){
	
	var Caname = listRow.closest('tr').find('.ca_name').text();
	console.log(listRow.closest('tr').find('.ca_name').text());

    /* $(".modal-body #memId").html(memId);  */
	
    $.ajax({
    	type:'GET',
		url:'getMemberCareerUpdateForm.go',
		data:{'Caname':Caname},
		dataType:'JSON',
		success:function(data){
			$("#memberCareerUpdateForm input[name=careerIdx]").attr('value',data.detail.ca_idx);
			$("#memberCareerUpdateForm input[name=careerName]").attr('value',data.detail.ca_name);
			$("#memberCareerUpdateForm input[name=careerWork]").attr('value',data.detail.ca_work);
			$("#memberCareerUpdateForm input[name=careerPos]").attr('value',data.detail.ca_pos);
			$("#memberCareerUpdateForm input[name=careerStart]").attr('value',data.detail.ca_start);
			$("#memberCareerUpdateForm input[name=careerEnd]").attr('value',data.detail.ca_end);								
			
		},
		error:function(e){
			console.log(e);
		}
    });
 
 
} 

// 서류파일 정보 불러오는 ajax 함수
function docuFileUpdateForm(listRow){
	var Fpidx = listRow.closest('tr').find('.fp_idx').text();
	console.log(listRow.closest('tr').find('.fp_idx').text());
	
	
    $.ajax({
    	type:'GET',
		url:'getdocuFileUpdateForm.go',
		data:{'Fpidx':Fpidx},
		dataType:'JSON',
		success:function(data){
			
			$("#docuFileUpdate input[name=FpIdx]").attr('value',data.detailPhoto.fp_idx);
			$("#docuFileUpdate select[name=fpcCate]").val(data.detail.fpc_cate);
			
			var newFileName = data.detailPhoto;
			// 파일 체크
			if(newFileName != null || newFileName == ''){
				$("#docuFileUpdate .memdocumentOri").text(data.detailPhoto.fp_newFileName);
			}else{
				$("#docuFileUpdate .memdocumentOri").text('없음');
			}
		},
		error:function(e){
			console.log(e);
		}
    });
}



 
</script>
</html>