<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>은빛 우산</title>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
     <script src="assets/js/jquery.twbsPagination.js"></script>
<style>
	.filter{
		width:15%;
		height:15%;
		}
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
                    <div class="card" style="width:38%; font-size:9pt; float: left;" >
		                    <div class="card-header" id="filterHead" style="background-color: white; font-size: 8pt;">
		                    <p>직원 목록</p>
		                     <span>사번:</span> <input type="text" name="mem_id" class="filter"> &nbsp;&nbsp;
		                     <span>이름:</span> <input type="text" name="mem_name" class="filter"> &nbsp;&nbsp;
		                        	<select name="mem_part">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="요양보호사">요양보호사</option>
		                        			<option value="사회복지사">사회복지사</option>
		                        			<option value="간호조무사">간호조무사</option>
		                        			<option value="조리사">조리사</option>
		                        		</select> &nbsp;&nbsp;
		                        	<select name="mem_state">
		                        			<option value="" selected="selected">전체</option>
		                        			<option value="재직중">재직중</option>
		                        			<option value="퇴사">퇴사</option>
		                        			<option value="휴직">휴직</option>
		                        		</select> &nbsp;&nbsp;
		                        <button class="btn btn-sm btn-primary" onclick="search(searchpage2)">검색</button>
		                    </div>
                        <div class="card-body" >
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>사번</th>
                                        <th>근무현황</th>
                                        <th>이름</th>
                                        <th>담당직종</th>
                                        <th>직급</th>
                                        <th>번호</th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
   
                            </table>
		                        <div id="pagint">
			                        <div class="container" style="margin-left: auto; margin-right: auto;">
										<nav aria-label="Page navigation" style="margin-left:10%;text-align: center; width:150px; height:50px;">
											<ul class="pagination" id="pagination"></ul>
										</nav>
									</div>
		                        </div>                            
                            		<div class="buttons" style="float:right;">
									<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeMember">직원 등록</a>
									</div> 
									<jsp:include page="writeMember.jsp"></jsp:include>
                        </div>                       
                    </div>
                    
                    <div class="card" style="width:60%; font-size:10pt; float: right; display:flex;" >
                        <div class="card-body">
							<div id="table2">
							
							</div>
							
<!-- 							<div class="buttons" id="showbu" style="float:right;">
	    						<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#updateMember">직원 수정</a>
							</div> -->
							<jsp:include page="updateMember.jsp"></jsp:include>
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
var showPage=1;
//직원 리스트 뽑기
memberlistCall(showPage);
//초기 직원 상세보기
memberdetailCall();

//직원 리스트 불러오는 ajax 함수
function memberlistCall(page) { 
 $.ajax({
    type:'GET',
    url:'memberlistCall.do',
    data:{page:page},
    datatype:'JSON',
    success:function(data){
       console.log(data);

       	memberdrawList(data.list);
       	
			$("#pagination").twbsPagination({
				startPage : 1, // 시작 페이지
				totalPages : data.total, // 총 페이지 수
				visiblePages : 5, // 기본으로 보여줄 페이지 수
				onPageClick : function(e, page) { // 클릭했을때 실행 내용
					memberlistCall(page)
				}
			});                  
    },
    error:function(e){
       console.log(e);
    }      
 });
}

// 직원 리스트 그리는 함수
function memberdrawList(memberList){
	var content='';
	if(memberList.length < 1){
		var msg = "등록된 직원이 없습니다.";
		content += '<tr>';
		content += '<td colspan="6">'+msg+'</td>';	
		content += '</tr>';
		
		$('#list').empty();
		$('#list').append(content);
	}else{
	for(var i=0; i<memberList.length; i++){
		console.log(memberList[i]);
		content+='<tr>';
		content+='<td class="mem_id">'+memberList[i].mem_id+'</td>';
		content+='<td>'+memberList[i].mem_state+'</td>';
		//content +='<td><a href="memberdetailCall.do?mem_id='+memberList[i].mem_id+'">'+memberList[i].mem_name+'</a></td>';
		//content +='<td><a href="javascript:void(0);" onclick="memberdetailCall(this);" mem_id="onclick:'+memberList[i].mem_id+'">'+memberList[i].mem_name+'</a></td>';
		content +='<td><a href="#" onclick="memberdetailCall(this)">'+memberList[i].mem_name+'</a></td>';
		content+='<td>'+memberList[i].part_name+'</td>';
		content+='<td>'+memberList[i].pos_name+'</td>';
		content+='<td>'+memberList[i].mem_pnum+'</td>';
		content+='</tr>';
	}
		$('#list').empty();
		$('#list').append(content);	
	}   
}
	var flag=true;
	var pageflag=true;
	var searchpage2=1;
	var select_change=new Array();
	var chkPage=new Array();

// 직원 검색
function search(searchpage2){
	 console.log("페이지: ",searchpage2)
	memId = $('#filterHead input[name=mem_id]').val(); // 사번
	memName = $('#filterHead input[name=mem_name]').val();
	memPart = $('#filterHead select[name=mem_part]').val();
	memState = $('#filterHead select[name=mem_state]').val();
	
	select_change.push($("select").val());
	if(flag){
     var select=$("#select").val();
     flag=false;
	
	$.ajax({
		type:'GET',
		url:'memberListSearch.do',
		data:{'page':searchpage2, memId:memId, memName:memName, memPart:memPart, memState:memState},
		dataType:'JSON',
		success:function(data){
			memberdrawList(data.list);
			
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
				startPage : 1 // 시작 페이지
				,totalPages : data.total // 총 페이지 수
				,visiblePages : 5 // 기본으로 보여줄 페이지 수
				,onPageClick : function(e, page) { // 클릭했을때 실행 내용
					search(page);
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

//직원 상세정보  그리는 함수
function memberdetaildrawList(memberdetailList){
	var content='';
	if(memberdetailList.length < 1){
		var msg = "선택된 직원이 없습니다.";
		content += '<tr>';
		content += '<td colspan="6">'+msg+'</td>';	
		content += '</tr>';
		
		$('#table2').empty();
		$('#table2').append(content);
	}else{
	for(var i=0; i<memberdetailList.length; i++){
		console.log(memberdetailList[i]);
		content+='<div class="buttons" style="float:right;">';
 		content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#updateMember" id="modify" onclick=updateForm($(this))>직원 수정</a>';
		content+='</div>';

		content+='<table class="table table-striped" id="zerg">'
		content+='<tr>';
		content+='<td class="ppphh" rowspan="10" align="center" width="120" height="150"><img class="ppph" alt="사진" style="width:110px;height:140px" ></td>';
		content+='<td>'+"사번"+'</td>';
		content+='<td class="mem_id" width="225">'+memberdetailList[i].mem_id+'</td>';
		content+='<td>'+"이름"+'</td>';
		content+='<td width="225">'+memberdetailList[i].mem_name+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td>'+"담당직종"+'</td>';
		content+='<td>'+memberdetailList[i].part_name+'</td>';
		content+='<td>'+"성별"+'</td>';
		content+='<td>'+memberdetailList[i].mem_gender+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"직급"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].pos_name+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"입사일"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_indate+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"번호"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_pnum+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"재직현황"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_state+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"담당부서"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].dept_name+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"이메일"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_email+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"생년월일"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_birth+'</td>';
		content+='</tr>';
		content+='<tr>';
		content+='<td colspan="2"  align="center">'+"주소"+'</td>';
		content+='<td colspan="3">'+memberdetailList[i].mem_addr+memberdetailList[i].mem_daddr+'</td>';
		content+='</tr>';
		content+='</table>';
		

      content+= '<div class="card" id="mypagetab">';
      content+= '<ul id="abcabc">';
      content+= '<li id="acdacd"><a href="#" id="ad" onclick="EdulistCall(showpage);">학력</a></li>';
      content+= '<li id="acdacd"><a href="#" id="ad" onclick="certlistCall(showpage1);">자격증</a></li>';
      content+= '<li id="acdacd"><a href="#" id="ad" onclick="careerlistCall(showpage2);">경력</a></li>';
      content+= '<li id="acdacd"><a href="#" id="ad" onclick="paperlistCall(showpage3);">서류파일</a></li>';
      content+= '</ul>';                    		
      content+= '</div>';
      content+='<div class="card" style="width:100%; font-size:10pt;">';
      content+='<div id="undertable">';
      content+='</div>';				
      content+='</div>';

	}
		$('#table2').empty();
		$('#table2').append(content);	
	}   
} 

//직원 상세정보 불러오는 ajax 함수
function memberdetailCall(item) {	
	var mem_name = $(item).text();
	
 $.ajax({
    type:'GET',
    url:'memberdetailCall.do',
    data:{'mem_name':mem_name},
    datatype:'JSON',
    success:function(data){
       console.log(data);

       memberdetaildrawList(data.list);
       var newFileName = data.MemberPhoto;
       console.log(newFileName);
			if(newFileName != null || newFileName == ''){
				/* $(".card .cardbody #table2 .table table-striped .ppphh .ppph").attr('src', '/filephoto/'+data.MemberPhoto.fp_newFileName) */
			    $(".ppph").attr('src', '/filephoto/'+data.MemberPhoto.fp_newFileName)
			}    
    },
    error:function(e){
       console.log(e);
    }      
 });
} 


//수정에 데이터 넘기는 함수 
function updateForm(listRow){
	
	var memId = $('#table2').find('td.mem_id').text();
	console.log(memId);

 $(".modal-body #memId").html(memId); 
	
 $.ajax({
 	type:'GET',
		url:'getMemberUpdateForm.go',
		data:{'memId':memId},
		dataType:'JSON',
		success:function(data){
			$("#updateMember input[name=memName]").attr('value',data.detail.mem_name);
			$("#updateMember input[name=memId]").attr('value',data.detail.mem_id);
			$("#updateMember select[name=departName]").val(data.detail.dept_name);
			$("#updateMember input[name=memIndate]").attr('value',data.detail.mem_indate);
			$("#updateMember input[name=memBirth]").attr('value',data.detail.mem_birth);
			$("#updateMember input[name=memAddr]").attr('value',data.detail.mem_addr);			
			
			$("#updateMember select[name=posName]").val(data.detail.pos_name);
			$("#updateMember select[name=partName]").val(data.detail.part_name);
			$("#updateMember input[name=memPnum]").attr('value',data.detail.mem_pnum);
			$("#updateMember input[name=memGender]").attr('value',data.detail.mem_gender);
			$("#updateMember input[name=memDaddr]").attr('value',data.detail.mem_daddr);
			$("#updateMember input[name=memEmail]").attr('value',data.detail.mem_email);
			$("#updateMember select[name=memState]").val(data.detail.mem_state);			
			
			var newFileName = data.detailPhoto;
			//사진 체크
			if(newFileName != null || newFileName == ''){
				$("#updateMember .memPhotoOri").text(data.detailPhoto.fp_newFileName)
			}else{
				$("#updateMember .memPhotoOri").text('없음')
			}
		},
		error:function(e){
			console.log(e);
		}
 });


}





var showpage=1;
var showpage1=1;
var showpage2=1;
var showpage3=1;
var showpage4=1;

// 학력 리스트 부르기
function EdulistCall(showpage) { 
	
	var memId = $('#table2').find('td.mem_id').text();
	
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
        	  
			$("#pagination2").twbsPagination({
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
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="sugar">';
		for(var i=0; i<eduList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id" value="'+eduList[i].mem_id+'"></td>'; */
			content+='<td class="edu_name">'+eduList[i].edu_name+'</td>';
			content +='<td>'+eduList[i].edu_start+'~'+eduList[i].edu_end+'</td>';
			content+='<td>'+eduList[i].edu_pass+'</td>';
			content+='<td>'+eduList[i].edu_success+'</td>';
			content+='</tr>';	
			
			$('#sugar').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination2" id="pagination2"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}


// 자격증 리스트 부르기
function certlistCall(showpage1) { 
	
	var memId = $('#table2').find('td.mem_id').text();

	
    $.ajax({
       type:'GET',
       url:'certlistCall.do',
       data:{'page':showpage1, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          certdrawList(data.list);
       	 if(data.list!=""){		         
        	
			$("#pagination2").twbsPagination({
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
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="sugar">';
		for(var i=0; i<certList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id">'+certList[i].mem_id+'</td>'; */
			content+='<td class="ce_name">'+certList[i].ce_name+'</td>';
			content+='<td>'+certList[i].ce_place+'</td>';
			content +='<td>'+certList[i].ce_date+'</td>';
			content+='</tr>';	
			
			$('#sugar').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination2" id="pagination2"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}
 
// 경력 리스트 부르기
function careerlistCall(showpage2) { 
	
	var memId = $('#table2').find('td.mem_id').text();
	

	
    $.ajax({
       type:'GET',
       url:'careerlistCall.do',
       data:{'page':showpage2, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);
          
          careerdrawList(data.list);                  

          if(data.list!=""){
        	
			$("#pagination2").twbsPagination({
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
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="sugar">';
		for(var i=0; i<careerList.length; i++){
			
			content+='<tr>';
/* 			content+='<td class="mem_id">'+careerList[i].mem_id+'</td>'; */
			content+='<td class="ca_name">'+careerList[i].ca_name+'</td>';
			content+='<td>'+careerList[i].ca_work+'</td>';
			content +='<td>'+careerList[i].ca_pos+'</td>';
			content +='<td>'+careerList[i].ca_start +'   ~   '+careerList[i].ca_end+'</td>';
			content+='</tr>';	
			
			$('#sugar').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination2" id="pagination2"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}
 

// 서류파일 리스트 부르기
function paperlistCall(showpage3) { 
	
	var memId = $('#table2').find('td.mem_id').text();
	

	
    $.ajax({
       type:'GET',
       url:'paperlistCall.do',
       data:{'page':showpage3, memId:memId},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          paperdrawList(data.list);
          			       
        	
			$("#pagination2").twbsPagination({
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
       	content+='</tr>';
        content+='</thead>';
		content+='<tbody id="sugar">';
		for(var i=0; i<paperList.length; i++){
			
			content+='<tr>';
			content+='<td class="fp_idx">'+paperList[i].fp_idx+'</td>'; 
			content+='<td class="fp_oriFileName">'+paperList[i].fp_oriFileName+'</td>';
			content+='<td>'+paperList[i].fp_date+'</td>';
			content+='</tr>';	
			
			$('#sugar').append(content);	

	}		
        content+='</tbody>';
        content+='</table>';    
    	content+='<div id="pagint">';
        content+='<div class="container" style="margin-left: auto; margin-right: auto;">';
        content+='<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">';
        content+='<ul class="pagination2" id="pagination2"></ul>';
        content+='</nav>';
		content+='</div>';
		content+='</div>';
        content+='</div>';
        content+='</div>';
		
		$('#undertable').empty();
		$('#undertable').append(content);	
	}   
}








</script>
</html>