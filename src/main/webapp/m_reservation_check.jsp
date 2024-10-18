<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.sql_select"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	HttpSession hss = request.getSession();
	List<String> sessiondata = (List<String>) hss.getAttribute("user");
	if (sessiondata == null) {
		out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href = './index.jsp';</script>");
	}
	else {
		String midx = sessiondata.get(6);
		String tn = "reser_view"; String a[] = {"*"}; String b = "member_idx";
		sql_select sssdf = new sql_select();
		sssdf.makeString(tn, a, b, midx);
		ResultSet rs = sssdf.getResultSet();
		if (rs.next() == false) {
			out.print("<script>alert('고객님께서는 예약된 내용이 존재하지 않습니다.'); location.href = './index.jsp';</script>");
		}
		else {
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/m_sub.css?v=2">
    <link rel="stylesheet" type="text/css" href="./css/m_reservation.css?v=2">
    <script src="./js/jquery.js"></script>
    <script src="./js/m_index.js"></script>
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
<form id="frm_del_reser">
	<input type="hidden" name="reser_idx" id="reser_idx" value="<%= rs.getString("reser_idx") %>">
</form>
<section class="subpage">
    <div class="member_agree">
    <p>펜션 예약 확인</p>
    <ol class="reser_ol">
    <li>
    <span class="reser_part1">펜션명</span>
    <span class="reser_part2">
    	<%= rs.getString("rname") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">객실명</span>
    <span class="reser_part2">
		<%= rs.getString("rname2") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">예약 일자</span>
    <span class="reser_part2">
    	<%= rs.getString("reser_date") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">객실구조</span>
    <span class="reser_part2">
    	<%= rs.getString("rcomp") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">입실인원</span>
    <span class="reser_part2">
    	기준 <%= rs.getString("rpersonnel") %>인 / 최대 <%= rs.getString("raddpersonnel") %>인
    </span>
    </li>
    <li>
    <span class="reser_part1">추가인원</span>
    <span class="reser_part2">
    기준인원 초과시 추가요금이 발생합니다.
    </span>
    </li>
    <li>
    <span class="reser_part1">구매금액</span>
    <span class="reser_part2">
    	<%= rs.getString("reser_price") %>원
    </span>
    </li>
    </ol>
    <p>예약자 정보</p>
    <ol class="reser_ol">
    <li>
    <span class="reser_part1">예약자명</span>
    <span class="reser_part2">
    	<%= rs.getString("reser_gname") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">휴대폰</span>
    <span class="reser_part2">
    	<%= rs.getString("reser_gtel") %>
    </span>
    </li>
    <li>
    <span class="reser_part1">입실인원</span>
    <span class="reser_part2">
		<%= rs.getString("reser_gnum") %>인
    </span>
    </li>
    <li>
    <span class="reser_part1">이메일</span>
    <span class="reser_part2">
    	<%= rs.getString("reser_email") %>
    </span>
    </li>
    </ol>
    <div class="member_agreebtn" onclick="js_reservation_cancel()">예약취소</div>
    </div>
</section>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
</body>
<%
		}
		if (rs != null) {
			rs.close();			
		}
		sssdf.libclose();
	}
%>
<script src="./js/top.js?v=9"></script>
<script src="./js/m_reser.js?v=2"></script>
</html>