<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<div id="page">
		<!-- 상세 보기 코드 -->
<div class="container">
        <div class="row">
                <div class="col-md-12">
		<div class="gtco-section border-bottom">
			<div class="gtco-container">
                    <div class="list-group-item fh5co-text-SG">
                        
                            <div class="cdtl_prd_infotop">
                                    <div class="cdtl_prd_mall">
                                        <span class="cmall_ic">
                                                <p class="text-center"><input type="button" value="${crew.rcrit_sttus}" class="btn-mint" ><a class="cdtl_ico_txt"><u>#식도락 여행</u></a></p>
                                            
                                        </span>
                                    </div>
                                    <div class="padding-bottom">
                                    <h2 class="text-center">${crew.cr_sj}</h2>
                                    </div>
                                    </div>
                            <div class="row">
                                <div class="col-md-6 right-boder-box">

                                          
                                                <dl class="cdtl_col_lft">
                                                    <div class="cdtl_item">
                                                        <dl class="cdtl_dl">
                                                            <dt>주요 경로</dt>
        
                                                                    <a>
                                                                      ${crew.main_cours}
                                                                    </a>
                                                        </dl>
                                                    </div>
        
                                                    <div class="cdtl_item">
                                                            <dl class="cdtl_dl cdtl_review_info">
                                                               <dt>세부 여행지</dt>
                                                               <a>${crew.detail_trplc}</a>
                                                            </dl>
                                                        </div>
                                                    <div class="cdtl_item">
                                                        <dl class="cdtl_dl cdtl_review_info">
                                                           <dt>출발일자</dt>
                                                           <a>${crew.reg_de}</a>
                                                        </dl>
                                                    </div>
                                                    <div class="cdtl_item">
                                                        <dl class="cdtl_dl cdtl_review_info">
                                                           <dt>도착일자</dt>
                                                           <a>${crew.upd_de}</a>
                                                        </dl>
                                                    </div>
                                                </dl>  


                                </div>
                                <div class="col-md-6">


                                        <div class="cdtl_col_rgt">
                                                <div class="cdtl_info_wrap">
                                                        <div class="cdtl_item">
                                                                <dl class="cdtl_dl cdtl_review_info">
                                                                   <dt>남자 인원</dt>
                                                                   <a>${crew.male_nmpr}명</a>
                                                                </dl>
                                                         </div>
                                                        <div class="cdtl_item">
                                                                <dl class="cdtl_dl cdtl_review_info">
                                                                   <dt>현재 남자 인원</dt>
                                                                   <a>${crew.now_male_nmpr}명</a>
                                                                </dl>
                                                         </div>
                                                        <div class="cdtl_item">
                                                                <dl class="cdtl_dl cdtl_review_info">
                                                                   <dt>여자 인원</dt>
                                                                   <a>${crew.female_nmpr}명</a>
                                                                </dl>
                                                         </div>
                                                        <div class="cdtl_item">
                                                                <dl class="cdtl_dl cdtl_review_info">
                                                                   <dt>현재 여자 인원</dt>
                                                                   <a>${crew.now_female_nmpr}명</a>
                                                                </dl>
                                                         </div>
                                                </div>
                                            </div>
                                        </div> 
                                            

                                </div>

                                <div class="padding-top">
                                <div class="container">
                                    <div class="row">

                                        

                                        <div class="col-md-10">
                                               <div class="boxline">
                                                 먹는 거 좋아하시는 분~ 인스타에 사진 업뎃하는거 좋아하시는  분!<br>
                                                 같이 예쁜 카페 도장깨면서 먹으러 다닐 분들 구합니다.<br>
                                                 우리 제주도 카페 도장을 다 깨버려여<br>
                                                 ${crew.prtxt}
                                                 <br>
                                                 <br>
                                                 <br>
                                                 <br>
                                                 <br>
                                                 <br>
                                               </div>

                                               <div class="container">
                                                    <div class="row">
                                                        <div class="padding-top">
                                                            <div class="row form-group" >
                                                                    <input type="button" value="수정하기" class="btn btn-mint" ><input type="button" value="삭제하기" class="btn btn-mint" >
                                                        
                                                                </div>        
                                                            </div>
                                               </div>
                                        </div>

                                    </div>
                                    <!-- <div class="col-md-12">
                                            <div class="row form-group">
                                                <div class="col-md-2">
                                                    <input type="button" value="강성민" class="btn btn-mint">
                                                </div>
                                                
                                                <div class="col-md-8">
                                                    <textarea cols="46" rows="1" class="form-control"> 댓글란 </textarea>
                                                </div>
                
                                                <div class="col-md-2">
                                                    <img src="https://kr.seaicons.com/wp-content/uploads/2015/11/Programming-Settings-3-icon.png" height="32" width="32">
                                                </div>
                
                                            </div>
                                        </div> -->
                                </div>
                            </div>
                           </div>       
                            
                                </div>
				</div>
			</div>
		</div>
    </div>
</div>
</div>

</body>
</html>