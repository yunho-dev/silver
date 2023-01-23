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
                    <div class="card" style="width:100%; font-size:12pt; float: left;" >
		                    <div class="card-header" id="filterHead" style="background-color: white; font-size: 12pt;">
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

                            <table class="table table-striped" id="tablegrade">
                                <thead>
                                    <tr>
                                        <th>사번</th>
                                        <th>이름</th>
                                        <th>담당직종</th>
                                        <th>근무현황</th>
                                        <th>직급</th>
                                        <th>번호</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="list">
                                
                                </tbody>
   
                            </table>
		                        <div id="pagint" style="margin-left:35%;">
			                        <div class="container" style="margin-left: auto; margin-right: auto;">
										<nav aria-label="Page navigation" style="text-align: center; width:150px; height:50px;">
											<ul class="pagination" id="pagination"></ul>
										</nav>
									</div>
		                        </div> 
                        

                        </div>                       
                    </div>
                    
          		 <jsp:include page="GrandChangeForm.jsp"></jsp:include>

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
		content+='<td class="mem_idd">'+memberList[i].mem_id+'</td>';
		content +='<td>'+memberList[i].mem_name+'</a></td>';
		content+='<td>'+memberList[i].part_name+'</td>';
		content+='<td>'+memberList[i].mem_state+'</td>';
		content+='<td>'+memberList[i].pos_name+'</td>';
		content+='<td>'+memberList[i].mem_pnum+'</td>';
		content+='<td>'
		
		content+='</div>';
     	content+='<div class="buttons">';
     	content+='<a class="btn btn-sm btn-primary" style="font-size:10pt;" data-bs-toggle="modal" data-bs-target="#GrandChangeForm" onclick=GrandChangeForm($(this))>직책 변경</a>';
        content+='</div>';
/* 		content+='<select name="ChangeposName" style="width:200px;height:30px;font-size:12px;">'
			content+='<option value="" selected="selected" style="display: none;" >'+"선택"+'</option>'
			content+='<option value="원장">'+"원장"+'</option>'
			content+='<option value="사무국장">'+"사무국장"+'</option>'
			content+='<option value="팀장">'+"팀장"+'</option>'
			content+='<option value="주임">'+"주임"+'</option>'
			content+='<option value="사원">'+"사원"+'</option>'
			content+='</select>'*/
			content+='</td>';
		content+='</tr>'; 
		$("select[name=ChangeposName]").val(memberList[i].pos_name);
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
	 
	function GrandChangeForm(listRow){
		var memId = listRow.closest('tr').find('.mem_idd').text();
		console.log(listRow.closest('tr').find('.mem_idd').text());
/* 		var memId = listRow.closest('tr').find('.mem_id').text();
		console.log(listRow.closest('tr').find('.mem_id').text()); */


	    /* $(".modal-body #memId").html(memId);  */
		
	    $.ajax({
	    	type:'GET',
			url:'GrandChangeForm.go',
			data:{'memId':memId},
			dataType:'JSON',
			success:function(data){
				$("#memberGrandChangeForm input[name=memId]").attr('value',data.detail.mem_id);
				$("#memberGrandChangeForm input[name=memName]").attr('value',data.detail.mem_name);
				$("#memberGrandChangeForm select[name=posName]").val(data.detail.pos_name);

									
				
			},
			error:function(e){
				console.log(e);
			}
	    });
	 
	 
	} 
</script>
</html>