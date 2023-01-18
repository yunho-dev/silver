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
	<div id="app">
		<jsp:include page="../sidebar.jsp"></jsp:include>
        <div id="main">
       	 <jsp:include page="../upbar.jsp"></jsp:include>
       	   <h1>내 캘린더</h1>
			  
       	   
				<div id='external-events' style="float:left; width:20%; padding-right:30px; padding-left:20px; margin-top:80px;">
				    <p>
				      <strong>스케줄을 배정하세요</strong>
				    </p>
				
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>휴가</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>반차</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>A조</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>B조</div>
				    </div>
				    <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				      <div class='fc-event-main'>기타</div>
				    </div>
				
				    <p>
				      <input type='checkbox' id='drop-remove' />
				      <label for='drop-remove'>드래그 앤 드롭후 제거</label>
				    </p>
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

   new Draggable(containerEl, {
     itemSelector: '.fc-event',
     eventData: function(eventEl) {
       return {
         title: eventEl.innerText
       };
     }
   });

   // initialize the calendar
   // -----------------------------------------------------------------

   var calendar = new Calendar(calendarEl, {
     headerToolbar: {
       left: 'prev,next today',
       center: 'title',
       right: 'dayGridMonth,timeGridWeek,timeGridDay'
     },
     editable: true,
     droppable: true, // this allows things to be dropped onto the calendar
     drop: function(info) {
       // is the "remove after drop" checkbox checked?
       if (checkbox.checked) {
         // if so, remove the element from the "Draggable Events" list
         info.draggedEl.parentNode.removeChild(info.draggedEl);
       }
     },
     locale:'ko'
   });

   calendar.render();
 }); 
 
</script>
</html>