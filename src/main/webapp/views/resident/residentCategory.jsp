<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/iconly/bold.css">
<link rel="stylesheet"
	href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet"
	href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="fullcalendar/lib/locales-all.js"></script>


<style>
#residentCategoryList {
	border-collapse: collapse;
	width: 100%;
	height: 700px;
}

#residentCategoryList thead {
	float: left;
	width: 500px;
}

#residentCategoryList tbody {
	overflow-y: auto;
	overflow-x: hidden;
	float: left;
	width: 500px;
	height: 600px;
	white-space: nowrap;
}

#residentCategoryList {
	text-align: center;
}

#CategoryList {
	border-collapse: collapse;
	width: 100%;
	height: 700px;
}

#CategoryList thead {
	float: left;
	width: 500px;
}

#CategoryList tbody {
	overflow-y: auto;
	overflow-x: hidden;
	float: left;
	width: 500px;
	height: 600px;
	white-space: nowrap;
}

#CategoryList {
	text-align: center;
}

#residentCategoryList th {
	width: 60px;
	height: 40px;
	padding: 5px;
}

#residentCategoryList td {
	width: 60px;
	height: 50px;
	padding: 5px;
}

#CategoryList th {
	width: 150px;
	height: 30px;
	padding: 5px;
}

#CategoryList td {
	width: 90px;
	height: 30px;
	padding: 5px;
}

#nametd {
	width: 110px;
	height: 40px;
	color: blue;
	cursor: pointer;
}

#nameth {
	width: 110px;
	height: 40px;
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


         <form action="residentCateSearch.do" method="post">

            <div class="option_re_name">
               <input type="text" name="re_name" placeholder="입소자">
            <button class="btn btn-primary">검색</button>
            </div><P></P>
         </form>


			<!-- Basic Tables start -->











			<!-- Basic Tables start -->
			<section class="section">
				<div class="row" id="basic-table">
					<div class="col-12 col-md-6"  style="width:550px;">
						<div class="card">

							<div class="card-content">
								<div class="card-body">

									<!-- Table with outer spacing -->
									<div class="table-responsive">
										<table class="table table-lg" id="residentCategoryList">
											<thead class="thead-dark">
												<tr>
													<th>번호</th>
													<th id="nameth" style="width:110px;">입소자</th>
													<th>성별</th>
													<th>나이</th>
													<th>등급</th>
													<th>생활실</th>
													<th>현황</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${resident}" var="rd">
													<tr>
														<td class="reIdx">${rd.re_idx}</td>
														<td id="nametd" style="width:110px;">${rd.re_name}</td>
														<td>${rd.re_gender}</td>
														<td>${rd.re_age}</td>
														<td>${rd.re_grade}</td>
														<td>${rd.ro_name}</td>
														<td>${rd.re_state}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>









					<div class="col-12 col-md-6">
						<div class="card">

							<div class="card-content">
								<div class="card-body">
									   <table>
                              <tr>
                                 <td>
                                    <a class="btn btn-primary" onclick="CateCure()">치료</a> 
                                 </td>
                                 <td>
                                    <a class="btn btn-primary" onclick="CateMedic()">약품</a> 
                                 </td>
                                 <td>
                                    <a class="btn btn-primary" onclick="CateVital()">바이탈</a>
                                 </td>
                                 <td>&nbsp;
                                 </td>
                                 <!--  
                                 <td style="text-align:right">
                                    <form method="get" id="resiDate">
                                       <input type="date" name="date" placeholder="날짜">
                                       <button class="btn btn-primary" type="button" onclick="ResidentDateSearch()">검색</button>
                                    </form>
                                 </td>
                              -->
                              </tr>
                           </table>


								</div>
								<!-- Table with outer spacing -->
								<div class="claBox">
									<div id='calendar' ></div>
								</div>							
							</div>
						</div>
					</div>
				</div>
		</div>
		</section>
		<!-- Basic Tables end -->







	</div>
	</div>
	
	<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/pages/dashboard.js"></script>
<script src="assets/js/main.js"></script>

</body>
<script>
	var reIdx = 0;



	function CateCure(click) {
		console.log(reIdx)
		location.href = "residentCure.go?re_idx=" + reIdx;
	}
	function CateMedic(click) {
		console.log(reIdx)
		location.href = "residentMedic.go?re_idx=" + reIdx;
	}
	function CateVital(click) {
		console.log(reIdx)
		location.href = "residentVital.go?re_idx=" + reIdx;
	}

	function CateDetailDetail(cc_idx, cu_num) {
		console.log("cc_idx 값 : " + cc_idx);
		console.log("cu_num 값 : " + cu_num);
		location.href = "cateDetailDetail.go?re_idx=" + reIdx + "&&cc_idx="
				+ cc_idx + "&&cu_num=" + cu_num;
	}
	
	function ResidentDateSearch() {
		console.log("테스트입니다.");
		var date = $('#resiDate input[name=date]').val();
		console.log(reIdx);
		console.log(date);
		$.ajax({
			type : 'get',
			url : 'residentDateSearch.do',
			data : {
				re_idx : reIdx,
				date:date
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				ResidentDateSearchdrawList(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});

	}
	/*
	function ResidentDateSearch(date) {
		reIdx = click.closest('tr').find('td.reIdx').text()
		console.log(reIdx);
		console.log(date);
		$.ajax({
			type : 'get',
			url : 'residentDateSearch.do',
			data : {
				re_idx : reIdx
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				ResidentDateSearchdrawList(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
	*/
	
	function ResidentDateSearchdrawList(residentDateSearch) {
		var content = '';
		 
		/*
		CateDetailList.forEach(function(items) {
			content+='<tr>';
			content+='<td>'+item.re_idx+'</td>';
			content+='<td><a href="residentCateDetail.go?re_idx='+item.re_idx+'">'+item.cc_name+'</a></td>';
			content+='<td>'+item.co_start+'</td>';
			content+='<td>'+item.co_end+'</td>';
			content+='</tr>';
		});
		$("#list").empty();
		$("#list").append(content);	
		 */
		 
		for (var i = 0; i < residentDateSearch.length; i++) {
			console.log(residentDateSearch[i]);
			
			content += '<tr>';
			content += '<td  style="display:none">' + residentDateSearch[i].cc_idx	+ '</td>';
			content += '<td>' + residentDateSearch[i].re_idx + '</td>';
			content += '<td><a onclick="CateDetailDetail('+ residentDateSearch[i].cc_idx + ',' + residentDateSearch[i].cu_num + ')" >' + residentDateSearch[i].cc_name + '</a></td>';
			content += '<td>' + residentDateSearch[i].co_start + '</td>';
			content += '<td>' + residentDateSearch[i].co_end + '</td>';
			content += '<td style="display:none">' + residentDateSearch[i].cu_num + '</td>';

			content += '</tr>';

			var cu_num = cu_num;
			var cc_idx = cc_idx;
			console.log(cc_idx);
		}

		$("#list").empty();
		$("#list").append(content);
	}
	

	$('#residentCategoryList #nametd').on('click', function(){
		console.log('3');
		reIdx = $(this).closest('tr').find('td.reIdx').text();
		console.log(reIdx);
		$.ajax({
			type : 'get',
			url : 'residentCateDetail.do',
			data : {
				re_idx : reIdx
			},
			dataType : 'json',
			success : function(data,status) {
				//alert(status);
				//console.log(data);
				//console.log(data.list);
				//CateDetaildrawList(data.list);

    			var list = data.list;
    			console.log("list :: ",list);
    			
    			
     			var calendarEl = document.getElementById('calendar');
    			
    			var events = list.map(function(item) {
    				console.log(item.co_start,item.co_end);
    				
    				return {
    					backgroundColor : item.bgcolor,
// 						title : item.co_write+ " : " +item.cc_name ,
						title : item.cc_name+ " : " +item.co_write ,
// 						start : item.reservationDate + "T" + item.reservationTime
						start : item.co_start,
						id : item.re_idx,
						url : "cateDetailDetail.go?re_idx=" + item.re_idx + "&&cc_idx="+ item.cc_idx + "&&cu_num=" + item.cu_num
					}
    			});
    			
				var calendar = new FullCalendar.Calendar(calendarEl, {
					events : events,
					allDaySlot: false,
					displayEventTime: false,
					initialView: 'timeGridWeek',
			        headerToolbar: {
			            left: 'prev,next today',
			            center: 'title',
			            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			          },
			          locale: "ko",
					eventTimeFormat: { // like '14:30:00'
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  },
					  
					  eventClick: function(info) {
						    info.jsEvent.preventDefault(); // don't let the browser navigate

						    if (info.event.url) {
						    	window.location.href=info.event.url;
						    }
					  }
				});
				calendar.render();
				
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
	
/* 
  document.addEventListener('DOMContentLoaded', function(event) {
	    
	$('#residentCategoryList #nametd').on('click', function(){
		console.log('3');
		reIdx = $(this).closest('tr').find('td.reIdx').text();
		console.log(reIdx);
		$.ajax({
			type : 'get',
			url : 'residentCateDetail.do',
			data : {
				re_idx : reIdx
			},
			dataType : 'json',
			success : function(data) {
				console.log(data);
				console.log(data.list);
				CateDetaildrawList(data.list);
			},
			error : function(e) {
				console.log(e);
			}
		});
	});
	  console.log('2');
	  
	  var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'timeGridWeek',
      headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
      navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable: true, // 수정 가능?
      selectable: true, // 달력 일자 드래그 설정가능
      nowIndicator: true, // 현재 시간 마크
      dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
      locale: 'ko', // 한국어 설정
      events:[
    	  
      ]
    });
    calendar.render();
    
  }); */

</script>
</html>