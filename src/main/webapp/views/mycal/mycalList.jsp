<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>은빛우산</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
 	<link href='fullcalendar/lib/main.css' rel='stylesheet'/>
 	<script src='fullcalendar/lib/main.js'></script>
 	<script src='fullcalendar/lib/locales/ko.js'></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.fc-event{
		margin-top:5px;
		cursor:move; 
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
       	   <h1>내 캘린더</h1>
			<input type="hidden" id="calcal" name='memId' value="${info.mem_id}">  
       	   	<input type="hidden" id="calIdx" name='calIdx' value="">  
				<div id='external-events' style="float:left; width:20%; padding-right:30px; padding-left:20px; margin-top:80px;">
				    <p>
				      <strong>스케줄을 배정하세요</strong>
				    </p>
				
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main' style="background-color:blue;">휴가</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main' style="background-color:orange;">반차</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main' style="background-color:green;">A조</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main' style="background-color:deeppink;">B조</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main' style="background-color:purple;">출장</div>
				    </div>
			 <div style="display:none;">
				<p>
					<input type="checkbox" id='drop-remove'/>
					<label for='drop-remove'>드래그앤 드랍후 제거</label>
				</p>
				</div>
  				</div>
			
			  		<div style="width:40%; float:right; padding-bottom:30px; text-align:right">
			  			<button style="width:120px; height:40px; background-color:blue; color:white; vertical-align:middle;
			  			font-size:17px; cursor:pointer" onclick="javascript:allSave();">전체저장
			  			</button>
			  		</div>
			  	<div style="float:left; width:80%;">
			  			
				    <div id='calendar'></div>  	
			  	</div>

       	   
       	   
       	 </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>       	 
</body>
<script>

var calendar=null;
loadingEvents();
 $(document).ready(function(){
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth',
      locale:'ko'
      
    });
    calendar.render();
  });
 
 

 $(document).ready(function(){ 
   var Calendar = FullCalendar.Calendar;
   var Draggable = FullCalendar.Draggable;

   var containerEl = document.getElementById('external-events');
   var calendarEl = document.getElementById('calendar');
   var checkbox = document.getElementById('drop-remove');

   // initialize the external events
   // -----------------------------------------------------------------
	var all_events=null;
	all_events=loadingEvents();
   	console.log(all_events);
   
   	new Draggable(containerEl, {
     itemSelector: '.fc-event',
     eventData: function(eventEl) {
       return {
         title:eventEl.innerText
       };
/*   	 if(title=="휴가"){
       	backgroundColor:"blue";
       }else if(title=="반차"){
       	backgroundColor:"orange";
       }else if(title=="A조"){
       	backgroundColor:"green";
       }else if(title=="B조"){
       	backgroundColor:"pink";
       }else{
       	backgroundColor:"purple";
       } */
     }
   });

   // initialize the calendar
   // -----------------------------------------------------------------

   calendar = new Calendar(calendarEl, {
     headerToolbar: {
       left: 'prev,next today',
       center: 'title',
		right:''
    	   //right: 'dayGridMonth,timeGridWeek,timeGridDay'
     },
     editable: true,
     dayMaxEvents: true,
     droppable: true, // this allows things to be dropped onto the calendar
     events:all_events,
     drop: function(info) {
       // is the "remove after drop" checkbox checked?
       if (checkbox.checked) {
         // if so, remove the element from the "Draggable Events" list
         info.draggedEl.parentNode.removeChild(info.draggedEl);
       }
     },
     eventClick:function(info){
    	 if(confirm("일정'"+info.event.title+"'을 삭제하시겠습니까?")){
    		 info.event.remove();
    	 }
     },
     locale:'ko'
   });

   calendar.render();
 }); 
 
 
 function allSave(){
	var allEvent= calendar.getEvents();
	console.log(allEvent);
	
	var events = new Array();
	for(var i=0; i<allEvent.length; i++){
		
		var obj= new Object();
		
		obj.title=allEvent[i]._def.title // 이벤트 명칭
		obj.allDay=allEvent[i]._def.allDay; // 하루 종일의 이벤트인지 알려주는 boolean 값(ture/false)

		var date = new Date(allEvent[i]._instance.range.start -9 * 3600 * 1000);
 		console.log(date.getHours());		
		obj.start=date.toLocaleDateString("ko-KR",{year:'numeric',month: '2-digit',day: '2-digit'}).replace(/\./g, '').replace(/\s/g, '-') + " "+ date.toLocaleTimeString("en-GB",{hour12 : false});

		
		
		var date1 = new Date(allEvent[i]._instance.range.end -9 * 3600 * 1000);
      	obj.end	=date1.toLocaleDateString("ko-KR",{year:'numeric',month: '2-digit',day: '2-digit'}).replace(/\./g, '').replace(/\s/g, '-') + " "+ date1.toLocaleTimeString("en-GB",{hour12 : false}); 

      	
		console.log(obj.start);	
		console.log(obj.end);
		events.push(obj);
		
	}
	console.log(events);
	var jsondata= JSON.stringify(events);
	console.log(jsondata);
	
	savedata(jsondata);
	
 }

 function savedata(jsondata) {
	 memId = $('input[name=memId]').val();
	    $.ajax({
	    	type:'POST',
			url:'SaveMycalList.do',
			data:{'data':jsondata,memId:memId},
			dataType:'JSON',
			success:function(data){
				
			alert("저장에 성공하였습니다.");	
			if(data.memId != null){
				location.reload();
			}
			
			},
			error:function(e){
				console.log(e);
			}
	    });
	 
 }
 
 
 function loadingEvents() {
	 memId = $('input[name=memId]').val();
	 
 	 var return_value;
	 var add=[]; 
				 
	 console.log(memId);
	    $.ajax({
	    	type:'GET',
			url:'GETMycalList.do',
			async: false, 
			data:{'memId':memId},
			dataType:'JSON',
			success:function(data){
				
				console.log(data.list.length);
		for(var i=0; i<data.list.length;i++){
				title=data.list[i].title;
				allDay=data.list[i].allDay;
				console.log(title);
	    		 if(title=='휴가'&& allDay=='true'){
	    			 delete data.list[i].backgroundColor;
	    			 data.list[i].backgroundColor="blue";	
	    			 console.log(data.list[i].backgroundColor);
	    		 }else if(title=='반차'&& allDay=='true'){
	    			 delete data.list[i].backgroundColor;
	    			 data.list[i].backgroundColor="orange";
	    			 console.log(data.list[i].backgroundColor);			
	    		 }else if(title=='A조'&& allDay=='true'){
	    			 delete data.list[i].backgroundColor;
	    			 data.list[i].backgroundColor="green";
	    			 console.log(data.list[i].backgroundColor);
			
	    		 }else if(title=='B조'&& allDay=='true'){
	    			 delete data.list[i].backgroundColor;
	    			 data.list[i].backgroundColor="deeppink";
	    			 console.log(data.list[i].backgroundColor);
	    		 }else if(title=='출장'&& allDay=='true'){
	    			 delete data.list[i].backgroundColor;
	    			 data.list[i].backgroundColor="purple";
	    			 console.log(data.list[i].backgroundColor);
	    		 }else{
	    			 console.log(allDay);
	    		 } 

		}	
				return_value=data.list;

			},
			error:function(e){
				console.log(e);
			}
	    });
	    return return_value;

}

</script>
</html>