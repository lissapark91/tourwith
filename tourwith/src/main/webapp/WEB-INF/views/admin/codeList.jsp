<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">


// 	function fn_updateForm() {
// 		location.href = "${pageContext.request.contextPath}/admin/codeForm";
// 	}

	function fn_updateForm(code_no, status) {
		$(function(){
			if(status == 0){
				
				$tr = $('tr[code_no='+ code_no +']')			
				$tdList = $('tr[code_no='+ code_no +'] [data_type]')
				$this = $('tr[code_no='+ code_no +'] .updateBtn')
	// 			$tdList = $('tr[code_no='+ code_no +'] td')
				$tdList.each(function(idx, ele){
					$newInput = $('<input>');
					$newInput.addClass('form-control')
					var $ele = $(ele)
	 				$newInput.val($ele.text())
	 				$newInput.attr('name', $ele.attr('data_type'))
					$ele.html($newInput)
					if(idx == 0){
						$newInput.focus();
					}
				})
	
				$this.text('확인')
				$this.attr('onclick', 'fn_updateForm(\''+ code_no +'\', 1);')
				
			}else if(status == 1){
				
				var $form = $('form[name=code]')
				$form.attr('action', "${pageContext.request.contextPath}/admin/code/update?code_no="+code_no);
				$form.submit();
				
				
			}
			
		})
				
	}
	
	function fn_delete(code_no){
		var a = confirm()
	}


	function fn_search(currentPage) {
		var frm = document.searchForm;

		frm.currentPage.value = currentPage;

		frm.action = "${pageContext.request.contextPath}/admin/codes";
		frm.submit();
		
	}
</script>

<html>
<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>
<!-- 상세 보기 코드 -->
<body>


	<div class="size">
		<div class="gtco-container">
			<div class="row">
				<div class="col-md-9">



					<h1>관리자 페이지 입니다.</h1>

					<div>

						<form name="searchForm" class="form-inline">

							<p>
								<input type="hidden" name="currentPage" value=""> <select
									name="searchType" class="form-control">
									<!-- 서치 -->
									<option ${param.searchType=='01' ? 'selected' : ''} value="01">코드번호</option>
									<option ${param.searchType=='02' ? 'selected' : ''} value="02">코드명</option>
								</select> <input type="text" name="searchWord" size="40"
											value="${param.searchWord}" class="form-control input-sm"> 
											<input type="button" value="검색" onclick="fn_search(1);"
											class="btn btn-primary btn-lg">
											
											<div class="container">	
									<div class="row">
										<div class="col-md-12 col-md-offset-12">	
											
											<input type="button" value="추가" onclick="fn_search(1);"
												class="btn btn-primary btn-lg">
										</div>
									</div>
								</div>
								
							</p>
						</form>
					</div>


					<table class="table table-hover">

						<thead>

							<tr class="bg-primary">
								<th>수정 삭제</th>
								<th>코드 번호</th>
								<th>그룹 코드</th>
								<th>코드 이름</th>
								<th>코드 구분</th>
								<th>삽입 일자</th>
								<th>매 니 저</th>

							</tr>
						</thead>

						<tbody>

							<c:if test="${not empty codeList}">
							<form name="code" method="post">
								<c:forEach var="code" items="${codeList}">
		
									<tr code_no="${code.code_no}">
										<td><button type="button" class="btn btn-primary updateBtn" style="margin-left: 2%" onclick="fn_updateForm('${code.code_no}', 0);">수정</button><button type="button" class="btn btn-primary deleteBtn" style="margin-left: 1%">삭제</button></td>
										<td data_type="code_no">${code.code_no}</td>
														<%-- <td><a href="code/${code.code_no}">${code.group_code}</a></td> 거기로 이동--%>

										<td data_type="group_code">${code.group_code}</td>

										<td data_type="code_nm">${code.code_nm}</td>

										<td data_type="code_se">${code.code_se}</td>

										<td data_type="code_rgsde">${code.code_rgsde}</td>

										<td data_type="mngr">${code.mngr}</td>



									</tr>
								</c:forEach>
							</c:if>
							</form>
						</tbody>
					</table>
					<!-- 페이징 -->
						<div class="container">
						<div class="row">
						 <div class="col-md-5 col-md-offset-5">
						<div style="text-align: center;">
							<ul class="pagination">
							${pageInfo}
						</ul>
						</div>
					</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
</html>

