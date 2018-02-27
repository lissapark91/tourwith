<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
 <!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
<style>

.nor.hide{
	display:none;
}

</style>

<script type="text/javascript">

function state_change(){
	//javascript 이벤트 
	// .nor class에 .hide클래스가있을경우 .hide클래스를 제거하고 .hide 클래스가없는경우 .hide클래스를 추가한다.
	$('.nor').toggleClass('hide');
}

$(document).ready(function() {
	
	$('.start_date').datepicker({
		format: 'yyyy-mm-dd'
	})
	$('.sche_start').datepicker({
		format: 'yyyy-mm-dd'
	})
	$('.end_date').datepicker({
		format: 'yyyy-mm-dd'
	})
	$('.sche_end').datepicker({
		format: 'yyyy-mm-dd'
	})
			
	 function loadData(){
	  	
		 
	}
  $('#submit').click(function(){
	 var ev_nm = $('.event_nm').val()
	 var st_dt = $('.start_date').val()
	 var en_dt = $('.end_date').val()
	 var ev_con = $('.ev_con').val()
	 $.ajax({
		url:'${pageContext.request.contextPath}/test/calendar/insert',
		type:"post",
		data:{"event_nm":ev_nm,
			 "bgndt":st_dt,
			 "enddt":en_dt,
			 "event_con":ev_con,
			 "cr_no":'0000000002'
		},	
		success: function(
				) {
			//다시불러오기 실시간갱신이 아니라 새로고침과 같은 효과
			//window.location.reload(true);
					$('#calendar').fullCalendar( 'refetchEvents' );
		}
	 });
	 $('#sche-Modal').modal('hide');
  });
  //수정 이벤트
  
  $('#edit').click(function(){
	 var ev_nm = $('.sche_nm').val()
	 var st_dt = $('.sche_start').val()
	 var en_dt = $('.sche_end').val()
	 var ev_con = $('.sche_content').val()
	 var ev_no = $('#event_num').val()
	 $.ajax({
		url:'${pageContext.request.contextPath}/test/calendar/update',
		type:"post",
		data:{"event_nm":ev_nm,
			  "event_no":ev_no,
			 "bgndt":st_dt,
			 "enddt":en_dt,
			 "event_con":ev_con,
			 "cr_no":'0000000002'
		},	
		success: function(data) {
			//window.location.reload(true);
			//다시불러오기
			//setTimeout("function(start, end, timezone, callback)",3000);
			$('#calendar').fullCalendar( 'refetchEvents' );
		}
	 });
	 $('.nor').toggleClass('hide');
	 $('#sche-Modal-view').modal('hide');
  });
  
  //삭제 이벤트
   $('#delete').click(function(){
	 $.ajax({
		 url:'${pageContext.request.contextPath}/test/calendar/delete',
		 method:"get",
// 		 data:"event_no="+$('#event_num').val(),
		 data:$('#event_num').serialize(),
		 success:function(data){
			 console.log(data);
			 $('#calendar').fullCalendar( 'refetchEvents' );
		 }			 
			 
		 
	 })
	 $('#sche-Modal-view').modal('hide');
	 //console.log(data);
  }); 
	
  //fullcalendar 설정 코드
  $('#calendar').fullCalendar({
	  header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listWeek'
	      },
	      defaultDate: '2018-02-12',
	      navLinks: true, // can click day/week names to navigate views
	      editable: false,
	      eventLimit: true, // allow "more" link when too many events
	      monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		   dayNamesShort: ["일","월","화","수","목","금","토"],
		   buttonText: {
		   today :"오늘",
		   month : "월별",
		   week : "주별",
		   day : "일별",
		   },
   // events: loadData() 
     events: function(start, end, timezone, callback) {
        $.ajax({
            url: '${pageContext.request.contextPath}/test/calendar/event/0000000002',
            dataType: 'json',
           /*  data: {
                // our hypothetical feed requires UNIX timestamps
               
                start: start.unix(),
                end: end.unix()
            }, */
            success: function(data) {
            	console.log(data)
            
                var events = [];
            	for(var i=0 ; i< data.length ; i++ ){
            		var crewEvent=data[i];
            		events.push({
            			id: crewEvent.event_no,
                        title: crewEvent.event_nm,
                        start: crewEvent.bgndt,
                        end: crewEvent.enddt,
                        content : crewEvent.event_con
                    });
            	}
                
                callback(events);
            }
        });
    },
    
   //캘린더 뷰 이벤트
    eventClick: function(calEvent, jsEvent, view) {    	
    	console.log(calEvent)        
    	// alert('Event: ' + calEvent.content);
    	//$('#sche-Modal-view') .modal('show')
    	
    	//모달창 글이 span으로 되있을경우 표시하는 
		$('span.sche_nm','#sche-Modal-view') .text(calEvent.title);
		$('span.sche_start','#sche-Modal-view') .text( moment(calEvent.start).format("YYYY-MM-DD") );
		console.log("end", $.type(calEvent.end));
// 		$('#event_num','#sche-Modal-view').text(calEvent.id);
		if($.type(calEvent.end) == "null"){
			$('span.sche_end','#sche-Modal-view') .text( moment(calEvent.start).format("YYYY-MM-DD"));
		}else{
			$('span.sche_end','#sche-Modal-view') .text(moment(calEvent.end).format("YYYY-MM-DD"));	
		}		
		$('span.sche_content','#sche-Modal-view') .text(calEvent.content);
       	//모달창 글이 span으로 되있을경우 표시하는
       	
       	//모달창 글이 input text로 되있는경우
		$('input.sche_nm','#sche-Modal-view') .val(calEvent.title);
		$('input.sche_start','#sche-Modal-view') .val( moment(calEvent.start).format("YYYY-MM-DD") );
		console.log("end", $.type(calEvent.end));
		$('#event_num','#sche-Modal-view').val(calEvent.id);
		if($.type(calEvent.end) == "null"){
			$('input.sche_end','#sche-Modal-view') .val( moment(calEvent.start).format("YYYY-MM-DD"));
		}else{
			$('input.sche_end','#sche-Modal-view') .val(moment(calEvent.end).format("YYYY-MM-DD"));	
		}		
		$('input.sche_content','#sche-Modal-view') .val(calEvent.content);
		//모달창 글이 input text로 되있는경
		
		//모달창 오픈
        $('#sche-Modal-view').modal('show')
        
		
    }
  });

});

</script>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>


<div style="width: 500px; height: 700px;">
	<div id="calendar"></div>
	<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#sche-Modal">스케줄 작성</button>
</div>
	
<!-- 스케줄 등록 모달 Modal -->
<div class="modal fade" id="sche-Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">스케줄</h4>
      </div>
      <div class="modal-body">
				<td width="15%"><h5>스케줄이름</h5></td>
						<input type="text"   class="form-control event_nm " placeholder="제목을 입력하세요.">
				<td width="15%"><h5>스케줄 시작날짜</h5></td>
						<input type="text"  class="form-control start_date" placeholder="ex)2012-02-12T20:00:00">
				<td width="15%"><h5>스케줄 종료날짜</h5></td>
						<input type="text"  class="form-control end_date" placeholder="ex)2012-02-12T20:00:00">
			<td colspan="2">
					<textarea  rows="15" class="form-control ev_con" name="con"></textarea>
			</td>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="submit">스케줄 등록</button>
      </div>
    </div>
  </div>
</div>

<!--  스케쥴 뷰 모달 modal -->

<div class="modal fade" id="sche-Modal-view" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">스케줄</h4>
      </div>
      <div class="modal-body">
      			<input type="hidden" id="event_num" name="event_no" class="event_num" >
				<td width="15%"><h5>스케줄이름</h5></td>
						<input type="text"  value="" name="" class="form-control hide nor sche_nm">
						<span  class="nor sche_nm" ></span>
				<td width="15%"><h5>스케줄 시작날짜</h5></td>
						<input type="text" id="" name=""class="form-control hide nor sche_start">
						<span  class="nor sche_start"></span>
				<td width="15%"><h5>스케줄 종료날짜</h5></td>
						<input type="text"   class="form-control hide nor sche_end">
						<span  class="nor sche_end"></span>
			<td colspan="2">
				<td width="15%"><h5>스케줄 내용</h5></td>
					<input type="text"  class="form-control hide nor sche_content">
					<span  class="nor sche_content"></span>
					
			</td>
      </div>
      <div class="modal-footer">
    	<button type="button" class="btn btn-primary nor" onclick="state_change()">수정 </button>
        <button type="button" class="btn btn-default hide nor" id="edit">수정</button>
        <button type="button" class="btn btn-primary" id="delete">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
