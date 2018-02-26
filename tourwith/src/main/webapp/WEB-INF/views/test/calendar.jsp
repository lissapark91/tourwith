<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
 <!-- include libraries(jQuery, bootstrap) --> 
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 


<script type="text/javascript">

/* $(function(){
$('#summernote').summernote({
   height: 300,          // 기본 높이값
 minHeight: null,      // 최소 높이값(null은 제한 없음)
 maxHeight: null,      // 최대 높이값(null은 제한 없음)
    focus: true,          // 페이지가 열릴때 포커스를 지정함
    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
    });
  }); */

$(document).ready(function() {
	
	$('#start_date').datepicker({
		format: 'yyyy-mm-dd'
	})
	$('#end_date').datepicker({
		format: 'yyyy-mm-dd'
	})
			
	 function loadData(){
	  	
		 
	}
  $('#submit').click(function(){
	 var ev_nm = $('#event_nm').val()
	 var st_dt = $('#start_date').val()
	 var en_dt = $('#end_date').val()
	 var ev_con = $('#ev_con').val()
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
			window.location.reload(true);
		}
	 });
	 $('#sche-Modal').modal('hide');
	 
	 
	
	// console.log(data);
  });
	
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
		$('#sche_nm','#sche-Modal-view') .text(calEvent.title);
		$('#sche_start','#sche-Modal-view') .text( moment(calEvent.start).format("YYYY-MM-DD") );
		console.log("end", $.type(calEvent.end));
		
		if($.type(calEvent.end) == "null"){
			$('#sche_end','#sche-Modal-view') .text(  moment(calEvent.start).format("YYYY-MM-DD"));
		}else{
			$('#sche_end','#sche-Modal-view') .text(moment(calEvent.end).format("YYYY-MM-DD"));	
		}
		
		$('#sche_content','#sche-Modal-view') .text(calEvent.content);
        // change the border color just for fun
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
						<input type="text" id="event_nm"  class="form-control " placeholder="제목을 입력하세요.">
				<td width="15%"><h5>스케줄 시작날짜</h5></td>
						<input type="text" id="start_date" class="form-control" placeholder="ex)2012-02-12T20:00:00">
				<td width="15%"><h5>스케줄 종료날짜</h5></td>
						<input type="text" id="end_date" class="form-control " placeholder="ex)2012-02-12T20:00:00">
			<td colspan="2">
					<textarea id="ev_con" rows="15" class="form-control" name="con"></textarea>
			</td>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id=submit>스케줄 등록</button>
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
				<td width="15%"><h5>스케줄이름</h5></td>
<!-- 						<input type="text" id="sche_nm" value="" name="" class="form-control "> -->
						<div class=form-control><span id="sche_nm" value=""></span></div>
				<td width="15%"><h5>스케줄 시작날짜</h5></td>
<!-- 							<input type="text" id="sche_start" value="" name=""class="form-control "> -->
						<div class=form-control><span id="sche_start"></span></div>
				<td width="15%"><h5>스케줄 종료날짜</h5></td>
<!-- 						<input type="text" id="sche_end" value="" name  class="form-control "> -->
						<div class=form-control><span id="sche_end"></span></div>
			<td colspan="2">
				<td width="15%"><h5>스케줄 내용</h5></td>
					<div class=form-control row="15"><span id="sche_content"></span></div>
			</td>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="edit">수정</button>
        <button type="button" class="btn btn-primary" id="delete">삭제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
