<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<head>
	<style>
		table td {
			padding: 1%;
		
		}
		table {
			width: 100%;
		}
		.RECR_STAT_01{
			color: orange;
		}
		.RECR_STAT_02{
			color: red;
		}
		.line-right{
			border-right: 2px solid grey;
		}
	
	</style>
	<script>
	$(function(){
		
		$('[name=bo_title]').focus()
		
		
		var $frm = $('#boardForm');
		
		$('#summernote').summernote({
			  height: 300,                 // set editor height
			  minHeight: null,             // set minimum height of editor
			  maxHeight: null,             // set maximum height of editor
			  lang: 'ko-KR', 
			  callbacks: {
				  onImageUpload: function(files, editor, welEditable) {
		          sendFile(files[0], this);

		      }

		  }
		});
		
		function sendFile(file, el) {
			console.log("sendFile")
		      var form_data = new FormData();
		      form_data.append('file', file);
		      $.ajax({
		        data: form_data,
		        type: "POST",
		        url: '${pageContext.request.contextPath}/image/upload', //일단 서버와 db에 파일 및 파일 정보 저장 
		        cache: false,
		        contentType: false,
		        enctype: 'multipart/form-data',
		        processData: false,
		        success: function(file_no) {
		          $(el).summernote('insertImage',"${pageContext.request.contextPath}/image/" + file_no); //base64 대신 넣어주는 url 
//		           $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
		        }
		      });
		    }

	})
	</script>
	
	<link href="${pageContext.request.contextPath}/summernote/summernote.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/summernote/summernote.js"></script>
	 <!-- include libraries(jQuery, bootstrap) --> 
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> 
	
<script type="text/javascript">

$(function() {
	
	$("#activities1").on("change",function(){
		var codecate = $("#activities1").val();
// 		alert(codecate);
		$.ajax({      
	        type:"GET",  
	        url:"${pageContext.request.contextPath}/cate/"+ codecate,      
// 	        data:params,
			dataType:"json",
	        success:function(data){   
// 	            console.log(data); //{codeList: []}   
// 	            console.log(data.codeList); // []
	            var codeList = data.codeList;
	            var optionHtml = '<option>==지역을 선택해주세요==</option>';
	            for (var i = 0; i < codeList.length; i++) {
					var code = codeList[i];  //{code_no: "BIG_CATE_02_01", code_nm: "동티모르", group_code: null, …}
					optionHtml+='<option value="'+code.code_no+'">'+code.code_nm+'</option>';
				}
	            $("#activities2").html(optionHtml);
	        },   
	        error:function(e){  
	        	console.log("요청 실패",e.responseText);  
	        }  
	    });  
		
	});
	
	$('#depr_de').datepicker({
		format: 'yyyy-mm-dd'
	});
	
	$('#arvl_de').datepicker({
		format: 'yyyy-mm-dd'
	});
	
});

</script>

</head>


<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

		<!-- 상세 보기 코드 -->
<div class="container">
        <div class="row">
           
		<div class="gtco-section border-bottom">
		<form method="post" class="form-group" enctype="multipart/form-data">
			<input type="hidden" value="${crew.cr_no }"/>
			<div class="gtco-container">
				<h3>크루 수정</h3>
				<br/>
				
				<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table >
						<tr>
							<td>크루 제목</td>
							<td colspan="3"><input type="text" class="form-control" value="${crew.cr_sj}" /></td>
						</tr>
						<tr>
							<td>나라별 선택</td>
							<td class="line-right">
								<!-- 나라 선택 select -->
								<select name="BIG_CATE" id="activities1" class="form-control">
									<option>==국가를 선택하세요==</option>
									<c:forEach var="code" items="${bigCateList}" varStatus="status" >
										<option value="${code.code_no}">${code.code_nm}</option>
									</c:forEach>
								</select>
							</td>
							<script>
								$(function(){
									$('[value=${groupCode}]').attr('selected','selected')
									
									$.ajax({      
								        type:"GET",  
								        url:"${pageContext.request.contextPath}/cate/${groupCode}",      
//							 	        data:params,
										dataType:"json",
								        success:function(data){   
//							 	            console.log(data); //{codeList: []}   
//							 	            console.log(data.codeList); // []
								            var codeList = data.codeList;
								            var optionHtml = '<option>==지역을 선택해주세요==</option>';
								            for (var i = 0; i < codeList.length; i++) {
												var code = codeList[i];  //{code_no: "BIG_CATE_02_01", code_nm: "동티모르", group_code: null, …}
												if('${crew.trplc_no}' == code.code_no){
													optionHtml+='<option value="'+code.code_no+'" selected>'+code.code_nm+'</option>';
													
												}else{
													optionHtml+='<option value="'+code.code_no+'">'+code.code_nm+'</option>';
													
												}
											}
								            $("#activities2").html(optionHtml);
								        },   
								        error:function(e){  
								        	console.log("요청 실패",e.responseText);  
								        }  
								    }); 
									
									
								})
							</script>
							<td>지역별 선택</td>
							<td>
								<!-- 지역별 선택 select -->
								<select name="BIG_CATE_2" id="activities2" class="form-control">
									<option>==지역을 선택해주세요==</option>
									
								</select>
							</td>
							
						</tr>
						
						<tr>
							<td>테마 선택</td>
							<td class="line-right">
								<!-- 테마 선택 select -->
								<select name="thema" class="form-control">
									<option>==테마를 선택해주세요==</option>
									<c:forEach var="code" items="${themaList}" varStatus="status" >
										<option value="${code.code_no}">${code.code_nm}</option>
									</c:forEach>
								</select>
							</td>
							
							<td>모집 상태</td>
							<td>
								<!-- 모집상태 선택 select -->
								<select name="rcrit_sttus" class="form-control">
									<option value="RECR_STAT_01">모집중</option>
									<option value="RECR_STAT_02">모집완료</option>
								</select>
							</td>
							
						</tr>
						
						<tr>
							<td width="15%">주요 경로</td>
							<td width="35%" class="line-right"><input class="form-control" type="text" value="${crew.main_cours}"/></td>
							<td width="15%">상세 경로</td>
							<td width="35%"><input class="form-control" type="text" value="${crew.detail_trplc}"/></td>
						</tr>
						
						<tr>
							<td>총 남자 인원</td>
							<td class="line-right"><input type="text" class="form-control" value="${crew.male_nmpr }"/></td>
							<td>여자 인원</td>
							<td><input type="text" class="form-control" value="${crew.female_nmpr }"/></td>
						</tr>
						
						<tr>
							<td>출발 일자</td>
							<td class="line-right">
								<input type="text" id="depr_de" class="form-control" value="${crew.depr_de }">
							</td>
							<td>도착 일자</td>
							<td>
								<input type="text" id="arvl_de" class="form-control" value="${crew.arvl_de }">
							</td>
						</tr>
						
						<tr >
							<td colspan="4"><textarea id="summernote" rows="15" class="form-control" name="prtxt">${crew.prtxt}</textarea></td>
						</tr>

					</table>
				</div>	
				</div>
				
				<div class="row">
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
					</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
						<c:if test="${not empty crew.cr_no}">
						<button type="button" class="btn btn-warning btn-block"><b>수정 하기</b></button>
						</c:if>
						<c:if test="${empty crew.cr_no}">
						<button type="button" class="btn btn-warning btn-block"><b>작성 하기</b></button>
						</c:if>
					</div>
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
					</div>
				
				</div>
				
			
			</div>
			</form>
		</div>
	
    </div>
</div>