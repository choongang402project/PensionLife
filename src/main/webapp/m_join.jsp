<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=2">
    <link rel="stylesheet" type="text/css" href="./css/m_sub.css?v=2">
    <script src="./js/jquery.js"></script>
    
</head>
<body>
<!-- 상단 시작 -->
<%@ include file="./top.jsp" %>
<!-- 상단 끝 -->
<main>
<!-- 배너 -->
<%@ include file="./banner.jsp" %>
<!-- 배너 끝-->
<!-- 중단 -->
<section class="subpage">
    <div class="member_agree">
    <p>회원가입 약관동의</p>
    <form id="frm2" >
    <ol class="agree_ol">
    <li><label><input type="checkbox" class="ckbox" id="ok1" name="OK1" value="Y" onclick="ok_one()"> 이용약관의 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="ok2" name="OK2" value="Y"onclick="ok_one()"> 개인정보 수집의 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="ok3" name="OK3" value="Y"onclick="ok_one()"> 개인정보 제3자 제공 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="ok4" name="OK4" value="Y"onclick="ok_one()"> 개인정보 위탁제공 동의</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="ok5" name="OK5" value="Y"onclick="ok_one()"> 마케팅 활용 동의 (선택)</label><span class="agree_info">[자세히 보기]</span></li>
    <li><label><input type="checkbox" class="ckbox" id="ok6" onclick="ok_all()"> 위 약관에 모두 동의 합니다.</label></li>
    </ol>
    </form>
    <div class="member_agreebtn" onclick="page_location(3)">기본정보 등록하기</div>
    </div>
</section>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
</body>
</html>
<script src="./js/m_index.js?v=2"></script>
<script src="./js/top.js?v=9"></script>