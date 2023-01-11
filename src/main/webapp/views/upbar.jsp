<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
</head>
<body>
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>
            <div class="allpage-heading" style="text-align: right">
<!--                 <a href="#" class="alaram" data-bs-toggle="dropdown" id="alarmShow"> -->
					<button type="button" class="btn btn-sm dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                	<img alt="" src="assets/images/logo/bell-fill.svg">
                	<span id="bell_count" style="vertical-align:super"></span>
                	</button>
                	<ul class="dropdown-menu" style="width:400px;font-size: 11px;" id="allist">
            		</ul>
<!--                 </a> -->
                <a href="mypageList" class='alaram' style="margin-right: 15px;">
                	마이페이지
                </a>
                <a href="loginout" class='alaram'> 로그아웃 </a>
            </div>
            <div class="allpage-heading" id="show_ul" style="display:none;">
            	<ul class="dropdown-menu" style="width:400px;font-size: 11px;" id="allist">
            	</ul>
            </div>
            

</body>
<script>
AlarmCallAjax();
$("#alarmShow").click(function(){
	if($("#show_ul").css("display")=="none"){
		$("#show_ul").css("display","block");
		AlarmCallAjax();
	}else{
		$("#show_ul").css("display","none");
		AlarmCallAjax();
	}
});


function AlarmCallAjax(){
	$.ajax({
		type:'get'
		,url:'AlarmCall'
		,dataType:'json'
		,success:function(data){
			console.log(data);
			AlarmlistCall(data.allist);
		},error:function(e){
			console.log(e);
		}
		
		});
}

function AlarmlistCall(allist){
	var count=0;
	var content="";
	for(var i=0;i<allist.length;i++){
		content +='<li class="dropdown-item" id='+allist[i].ar_content+' onclick="alertAA()">'
		content += allist[i].ar_content
		var date = new Date(allist[i].ar_date);
		content +='<span style="float:right">'+ date.toLocaleDateString("ko-KR") + " "+ date.toLocaleTimeString("en-US", {hour12 : false}) +'</span></li>'
		if(allist[i].ar_cnt == '안읽음'){
			count++;
		}
	}
	$("#allist").empty();
	$("#allist").append(content);
	$("#bell_count").text(count);
}

function alertAA(){
	alert('asda');
}


</script>
</html>