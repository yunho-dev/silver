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
										<nav aria-label="Page navigation" style="margin-left:10%; text-align: center; width:150px; height:50px;">
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
		content+='</table>';
		
		
		content+='<div class="buttons" style="float:right;">';
    	content+='<a class="btn btn-sm btn-primary" style="font-size:3pt;" data-bs-toggle="modal" data-bs-target="#updateMember" id="modify" onclick=updateForm($(this))>직원 수정</a>';
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
 
 
// 수정에 데이터 넘기는 함수 
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
 /*
 $('#modify').click(function(){
	
	var memId =$('td.MemID').text();
	console.log(memId);
    
    $.ajax({
    	type:'GET',
		url:'getMemberUpdateForm.go',
		data:{memId:memId},
		dataType:'JSON',
		success:function(data){
			$(".modal-body .left input[name=memName]").text(data.detail.mem_name);
			$(".modal-body .left input[name=memId]").text(data.detail.mem_id);
			$(".modal-body .left select[name=departName]").text(data.detail.dept_name);
			$(".modal-body .left input[name=memIndate]").text(data.detail.mem_indate);
			$(".modal-body .left input[name=memBirth]").text(data.detail.mem_birth);
			$(".modal-body .left input[name=memAddr]").text(data.detail.mem_addr);			
			
			$(".modal-body .right select[name=posName]").text(data.detail.pos_name);
			$(".modal-body .right select[name=partName]").text(data.detail.part_name);
			$(".modal-body .right input[name=memPnum]").text(data.detail.mem_pnum);
			$(".modal-body .right input[name=memGender]").text(data.detail.mem_gender);
			$(".modal-body .right input[name=memDaddr]").text(data.detail.mem_daddr);
			$(".modal-body .right input[name=memEmail]").text(data.detail.mem_email);
			$(".modal-body .right select[name=memState]").text(data.detail.mem_state);			
			
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
    
});
 */
</script>
</html>