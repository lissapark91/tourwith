<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--


{
	  header: {
	   left: "",
	   center: "title",
//	    right: "month,basicWeek,basicDay"
	   right: "today prev,next"
	   },
	   editable: true,
	   titleFormat: {
	   month: "yyyy년 MMMM",
	   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
	   day: "yyyy년 MMM d일 dddd"
	   },
	   allDayDefault: false,
	   defaultView: "month",
	   editable: false,
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


 --%>




<script type="text/javascript">

$(document).ready(function() {

	
	 function loadData(){
	  	
		 
		  data = [
		      {
		          title: 'All Day Event',
		          start: '2018-02-01',
		        },
		        {
		          title: 'Long Event',
		          start: '2018-02-07',
		          end: '2018-02-10'
		        },
		        {
		          id: 999,
		          title: 'Repeating Event',
		          start: '2018-02-09T16:00:00'
		        },
		        {
		          id: 999,
		          title: 'Repeating Event',
		          start: '2018-02-16T16:00:00'
		        },
		        {
		          title: 'Conference',
		          start: '2018-02-11',
		          end: '2018-02-13'
		        },
		        {
		          title: 'Meeting',
		          start: '2018-02-12T10:30:00',
		          end: '2018-02-12T12:30:00'
		        },
		        {
		          title: 'Lunch',
		          start: '2018-02-12T12:00:00'
		        },
		        {
		          title: 'Meeting',
		          start: '2018-02-12T14:30:00'
		        },
		        {
		          title: 'Happy Hour',
		          start: '2018-02-12T17:30:00'
		        },
		        {
		          title: 'Dinner',
		          start: '2018-02-12T20:00:00'
		        },
		        {
		          title: 'Birthday Party',
		          start: '2018-02-13T07:00:00'
		        },
		        {
		          title: 'Click for Google',
		          url: 'http://google.com/',
		          start: '2018-02-28'
		        }
		      ];
		  return data;
	 	 }
	
	
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
    events: loadData() 
  });

 
  
});

</script>

<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>


<div style="width: 600px; height: 700px;">
	<div id="calendar"></div>
</div>
