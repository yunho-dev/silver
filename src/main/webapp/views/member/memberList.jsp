<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">

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
<style>
	.filter{
		width:15%;
		height:15%;
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
                    <div class="card" style="width:38%; font-size:3pt; float: left;" >
		                    <div class="card-header" style="background-color: white; font-size: 3pt;">
		                        <input type="text" name="mem_id" class="filter"> &nbsp;&nbsp;
		                        <input type="text" name="mem_name" class="filter"> &nbsp;&nbsp;
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
		                        <button class="btn btn-sm btn-primary" onclick="search($(this))">검색</button>
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
                                	<tr id="pager">
                                		<td colspan="6">
                                	<div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination pagination-primary">
                                            <li class="page-item"><a class="page-link" href="#">Prev</a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item "><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                        </ul>
                                    </nav>
                                    </div>
                                    </td>
                                    </tr>
                            </table>
                            		<div class="buttons" style="float:right;">
									<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#writeMember">직원 등록</a>
									</div> 
									<jsp:include page="writeMember.jsp"></jsp:include>
                        </div>                       
                    </div>
                    
                    <div class="card" style="width:60%; font-size:3pt; float: right; display:flex;" >
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
// 직원 리스트 뽑기
memberlistCall(showPage);
// 초기 직원 상세보기
memberdetailCall();

// 직원 리스트 불러오는 ajax 함수
function memberlistCall(page) { 
    $.ajax({
       type:'GET',
       url:'memberlistCall.do',
       data:{page:page},
       datatype:'JSON',
       success:function(data){
          console.log(data);

          	memberdrawList(data.list);
                  
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

 // 직원 검색
function search(searchBtn){
	memId = $(searchBtn).siblings("input[name=mem_id]").val(); // 사번
	memName = $(searchBtn).siblings("input[name=mem_name]").val();
	memPart = $(searchBtn).siblings("select[name=mem_part]").val();
	memState = $(searchBtn).siblings("select[name=mem_state]").val();
	
	$.ajax({
		type:'GET',
		url:'memberListSearch.do',
		data:{page:page, memId:memId, memName:memName, memPart:memPart, memState:memState},
		dataType:'JSON',
		success:function(data){
			memberdrawList(data.list);
		},
		error:function(e){
			console.log(e);
		}
	});
	
}
 
// 직원 상세정보  그리는 함수
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
		content+='<table class="table table-striped">'
		content+='<tr>';
		content+='<td class="ppphh" rowspan="6" align="center" width="120" height="150"><img class="ppph" alt="사진" style="width:110px;height:140px" ></td>';
		content+='<td>'+"사번"+'</td>';
		content+='<td width="225">'+memberdetailList[i].mem_id+'</td>';
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
		content+='</table>';
		
		
		content+='<div class="buttons" style="float:right;">';
    	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#updateMember">직원 수정</a>';
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
 
</script>
</html>