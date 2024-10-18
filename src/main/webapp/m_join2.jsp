<%@page import="member_join.join_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	join_dto dto = (join_dto)request.getAttribute("dto");
 	int w=0;
 	String z="";
 	while(w<6){
 		int a=(int)Math.ceil(Math.random()*9);
 		
 		w++;
 	}
 %>
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
    <p>회원 기본 정보입력</p>
	<form id="frm2">
    <input type="hidden" value="<%=dto.getTerms1() %>" name="ok_ck">
    <input type="hidden" value="<%=dto.getTerms2() %>" name="ok_ck">
    <input type="hidden" value="<%=dto.getTerms3() %>" name="ok_ck">
    <input type="hidden" value="<%=dto.getTerms4() %>" name="ok_ck">
    <input type="hidden" value="<%=dto.getTerms5() %>" name="ok_ck">
    <ol class="join_ol">
    <li><input type="text" class="join_input1" placeholder="아이디 (영문/숫자 6~16자리)" maxlength="16" name="mid" id="mid"></li>
    <li style="display:none;" class="duplicate_id" id="ck_idduplicate"></li>
    <li><input type="button" onclick="duplicate_id_ck()" class="member_agreebtn2" id="duplicate_check" value="아이디 중복확인"></li>
    <li><input type="text" class="join_input1" placeholder="이름 (홍길동)" maxlength="10" name="mname" id="mname"></li>
    <li><input type="password" class="join_input1" placeholder="비밀번호 (영문/숫자 6~12자리)" maxlength="12" name="mpass" id="mpass"></li>
    <li><input type="password" class="join_input1" placeholder="동일한 패스워드를 입력하세요" maxlength="12" id="mpassok"></li>
    <li><input type="email" class="join_input1" placeholder="이메일을 입력하세요" maxlength="35" name="memail" id="memail"></li>
    <li><input type="tel" class="join_input1" placeholder="연락처 ('-'는 미입력)" maxlength="11" name="mhp" id="mhp"></li>
    <li class="security">
    보안코드 : <input type="text" id="securitycode" class="join_input2 bgcolor" maxlength="6" readonly="readonly" >
    <input type="number" class="join_input2" placeholder="보안코드 6자리 입력" maxlength="6" id="sec2" >
    </li>
    </ol>
    <div class="member_agreebtn" onclick="signup()">회원가입</div>
    </form>
    </div>
</section>

<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
<script src="./js/m_index.js"></script>
<script src="./js/top.js?v=9"></script>
<script src="./js/m_join2.js?v=5"></script>
</body>
</html>