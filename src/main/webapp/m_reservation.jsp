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
		out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href='./index.jsp';</script>");
	}
	else {
		String pension_name = request.getParameter("resername");
		if (pension_name == null) {
			out.print("<script>location.href = './index.jsp';</script>");
		}
		else {
			String tn = "p_room"; String a[] = {"*"}; String b = "rname";
			sql_select ssasd = new sql_select();
			ssasd.makeString(tn, a, b, pension_name);
			ResultSet rs = ssasd.getResultSet();
			ArrayList<String> rname2 = new ArrayList<String>();
			while (rs.next()) {
				rname2.add(rs.getString("rname2"));
			}
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
<form id="select_name">
	<input type="hidden" name="resername" id="resername" value="<%= pension_name %>">
</form>
<section class="subpage">
    <div class="member_agree">
    <p>펜션 예약하기</p>
    <ol class="reser_ol">
    <li>
    <span class="reser_part1">펜션명</span>
    <span class="reser_part2">
    <%= pension_name %>
    </span>
    </li>
    <li>
    <span class="reser_part1">객실선택</span>
    <span class="reser_part2">
    <select class="reser_select" id="select_box">
    <option value="">객실선택</option>
<%
			int n = 0;
			while (n < rname2.size()) {
%>
    <option value="<%= rname2.get(n) %>"><%= rname2.get(n) %></option>
<%
				n++;
			}
%>
    </select>
    </span>
    </li>
    <li>
    <span class="reser_part1">일자선택</span>
    <span class="reser_part2">
    <input type="datetime-local" class="reser_input" id="input_reser_datetime">
    </span>
    </li>
    <li>
    <span class="reser_part1">객실구조</span>
    <span class="reser_part2" id="room_layout">
    방2, 주방1, 화장실1, 거실1
    </span>
    </li>
    <li>
    <span class="reser_part1">입실인원</span>
    <span class="reser_part2" id="room_personnum">
    기준 3인 / 최대 4인
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
    <span class="reser_part2" id="room_price">
    165,600원
    </span>
    </li>
    </ol>
    <p>예약자정보 입력</p>
	<form id="frm_reservation_submit">
	<input type="hidden" name="reser_room_idx" id="reser_room_idx" value="">
	<input type="hidden" name="reser_date" id="reser_date" value="">
	<input type="hidden" name="reser_price" id="reser_price" value="">
    <ol class="reser_ol">
    <li>
    <span class="reser_part1">예약자명</span>
    <span class="reser_part2">
    <input type="text" class="reser_input" maxlength="30" name="reser_gname" id="reser_gname">
    </span>
    </li>
    <li>
    <span class="reser_part1">휴대폰</span>
    <span class="reser_part2">
    <input type="number" class="reser_input" maxlength="11" name="reser_gtel" id="reser_gtel">
    </span>
    </li>
    <li>
    <span class="reser_part1">입실인원</span>
    <span class="reser_part2">
    <select class="reser_select" id="guest_number_select" name="reser_gnum" id="reser_gnum">
    <option value="">입실 인원선택</option>
    </select>
    </span>
    </li>
    <li>
    <span class="reser_part1">이메일</span>
    <span class="reser_part2">
    <input type="email" class="reser_input" maxlength="50" name="reser_email" id="reser_email">
    </span>
    </li>
    </ol>
    <div class="member_agreebtn" onclick="js_reservation_submit()">예약하기</div>
    </form>
    </div>
</section>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
</body>
<%
			rs.close();
			ssasd.libclose();
		}
	}
%>
<script src="./js/top.js?v=8"></script>
<script src="./js/reservation.js?v=5"></script>
</html>