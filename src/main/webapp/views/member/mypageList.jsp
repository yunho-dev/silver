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
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
		
	    <div id="main">
	    	<jsp:include page="../upbar.jsp"></jsp:include>	
       	 	<div class="page-heading">
                <section class="section">
                    
                    <div class="card" style="width:100%; font-size:3pt;  display:flex;" >
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
									<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">비밀번호 변경</a>
									</div>									
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
                       		<li id="acdacd"><a href="#" id="ad" onclick="EdulistCall(1)">학력</a></li>
                       		<li id="acdacd"><a href="#" id="ad">자격증</a></li>
                       		<li id="acdacd"><a href="#" id="ad">경력</a></li>
                       		<li id="acdacd"><a href="#" id="ad">서류파일</a></li>
                       		<li id="acdacd"><a href="#" id="ad">결제문서</a></li>
                       		</ul>                       		
                       </div>   

                                      
                    <div class="card" style="width:100%; font-size:3pt;">
                    	<div id="undertable">
                    	
                    	
                    	
                    	
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

var showPage=1;
var pageflag=true;
var chkPage=new Array();

EdulistCall(showPage);

// 학력 리스트 부르기
function EdulistCall(page) { 
	
	var memId = $('#tablemarin').find('td.marin').text();
	
    $.ajax({
       type:'GET',
       url:'edulistCall.do',
       data:{'page':page, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          edudrawList(data.list);
          
			chkPage.push(data.total);
			if(chkPage.at(-2) != data.total){
				pageflag=true;
			}		
			
			if(pageflag == true && $('.pagination').data("twbs-pagination")
					|| select_change.at(-2) != $("select").val()){
                $('.pagination').twbsPagination('destroy');
                pageflag=false;
            }          
        	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					EdulistCall(page);
				}
			});         
       },
       error:function(e){
          console.log(e);
       }      
    });
 }
 
 // 학력 리스트 그리는 함수
function edudrawList(eduList){
	var content='';
	if(eduList.length < 1){
		var msg = "등록된 학력이 없습니다.";
		content += '<tr>';
		content += '<td colspan="6">'+msg+'</td>';	
		content += '</tr>';
		
		$('#undertable').empty();
		$('#undertable').append(content);
	}else{
		content+='<div class="card-header">'+"학력"+'</div>';
		content+='<div class="card-body" >';
		content+='<table class="table table-striped" id="table2">';
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
			content+='<td class="mem_id">'+eduList[i].mem_id+'</td>';
			content+='<td>'+eduList[i].edu_name+'</td>';
			content +='<td>'+eduList[i].edu_start+'~'+eduList[i].edu_end+'</td>';
			content+='<td>'+eduList[i].edu_pass+'</td>';
			content+='<td>'+eduList[i].edu_success+'</td>';
			content+='<td>';
	     	content+='<div class="buttons">';
	        content+='<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">수정하기</a>';
	        content+='</div>';
			content+='</td>';
			content+='</tr>';	
			
			$('#list').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination" id="pagination"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
     	content+='<div class="buttons">';
        content+='<a href="#" class="btn btn-sm btn-primary" style="font-size:3pt;">학력 등록</a>';
        content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}

 


</script>
</html>