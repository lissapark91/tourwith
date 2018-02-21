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
	</style>
	<script>
		$(function(){
			var reg_de = '${crew.reg_de}';
			$('#crew_reg_de').text(reg_de.split(' ')[0]);
			
			$('#modiBtn').click(function(){
				
				location.href = "${pageContext.request.contextPath}/crew/form?cr_no=" + ${crew.cr_no}

			})			
			
			$('#delBtn').click(function(){
			
				location.href = "${pageContext.request.contextPath}/crew/del?cr_no=" + ${crew.cr_no}
				
				
			})
			
			
		})
	</script>

</head>


<header id="gtco-header" class="gtco-cover gtco-cover-sm" role="banner"
	style="height: 80px;"> </header>

		<!-- 상세 보기 코드 -->
<div class="container">
        <div class="row">
           
		<div class="gtco-section border-bottom">
			<div class="gtco-container">
				<div>
					<span>#${crew.trplc_no_nm }</span>
					<span>#${crew.thema_nm }</span>
					<span class="${crew.rcrit_sttus}"><strong>#${crew.rcrit_sttus_nm }</strong></span>
				</div>
				<div class="row" style="border-bottom: 2px solid #222;">
				<div class="col-lg-10 col-md-10 col-sm-10 col-xs-10" >
					<h3>${crew.cr_sj}</h3>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
				<c:if test="${isLeader}">
					<button type="button" id="modiBtn" class="btn btn-xs" style="padding: 0.5em;">수정</button>
					<button type="button" id="delBtn" class="btn btn-sm" style="padding: 0.5em;">삭제</button>
				</c:if>
				</div>
				</div>
				<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table>
						<tr>
							<td>크루 리더</td>
							<td><a href="http://www.facebook.com/${crew.cr_leadr_fb_id }" target="_blank" >
							<img src="http://graph.facebook.com/${crew.cr_leadr_fb_id }/picture?width=32&height=32"/>${crew.cr_leadr_nick }</a></td>
							<td>크루 등록 일자</td>
							<td id="crew_reg_de"></td>
							
						</tr>
						
						<tr>
							<td width="15%">주요 경로</td>
							<td width="35%"><b>${crew.main_cours}</b></td>
							<td width="15%">상세 경로</td>
							<td width="35%"><b>${crew.detail_trplc}</b></td>
						</tr>
						
						<tr>
							<td>남자 인원</td>
							<td><b>${crew.now_male_nmpr} / ${crew.male_nmpr }</b></td>
							<td>여자 인원</td>
							<td><b>${crew.now_female_nmpr} / ${crew.female_nmpr }</b></td>
						</tr>
						
						<tr style="border-bottom: 2px solid #222;">
							<td>출발 일자</td>
							<td><b>${crew.depr_de }</b></td>
							<td>도착 일자</td>
							<td><b>${crew.arvl_de }</b></td>
						</tr>
						
						<tr >
							<td colspan="4"><div style="min-height:400px;">${crew.prtxt }</div></td>
						</tr>

					</table>
				</div>	
				</div>
				
				<div class="row">
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
						<button type="button" class="btn btn-warning btn-block"><b>참 여 하 기</b></button>
					</div>
					<!-- 가운데 정렬용.. div.. -->
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
					</div>
				
				</div>
				
			
			</div>
		</div>
	
    </div>
</div>

