<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.sql_select"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hss = request.getSession();
	List<String> sdata = (List<String>) hss.getAttribute("admin");
	if (sdata == null) {
		out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href = './admin_login.jsp';</script>");
	}
	else {
		sql_select select_module = new sql_select();
		String a[] = {"*"};
		String qidx = request.getParameter("qa_idx_value");
		select_module.makeString("qa_board", a, "qidx", qidx);
		ResultSet rs = select_module.getResultSet();
		rs.next();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./admin_css/index.css?v=6">
    <script src="./js/jquery.js"></script>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<form id="frm_adm_qawr">
<input type="hidden"  name="adm_idx" value="<%= sdata.get(0) %>">
<input type="hidden"  name="qa_idx" value="<%= qidx %>">
<article class="admin_lists">
    <p>QA 문의 내용</p>
    <ul class="qa_write">
        <li>고객명</li>
        <li><%= rs.getString("qname") %></li>
        <li>제목</li>
        <li><%= rs.getString("qtitle") %></li>
        <li>내용</li>
        <li class="view1"><%= rs.getString("qtext") %></li>
        <li>등록일</li>
        <li><%= rs.getString("qindate").split(" ")[0] %></li>
        <li>답변</li>
        <li>
<%
		String b[] = {"contents"};
		select_module.makeString("qalist_view", b, "qidx", qidx);
		rs = select_module.getResultSet();
		rs.next();
		if (rs.getString("contents") == null) {
%>        
        <textarea placeholder="답변내용을 입력하세요" class="answer" name="ans_content" id="ans_content"></textarea>
<%
		}
		else {
			out.print(rs.getString("contents"));
		}
%>
        </li>
    </ul>
<%
		if (rs.getString("contents") == null) {
%>
    <input type="button" class="adbtn1" value="답변등록" onclick="js_admin_answer()">
<%
		} else {
%>
	<input type="button" class="adbtn1" value="이전 화면" onclick="history.go(-1);">
<%
		}
%>
</article>
</form>
<%
		rs.close();
		select_module.libclose();
	}
%>
<%@ include file="./admin_footer.jsp" %>
</body>
<script src="./js/admin_page.js?v=1"></script>
</html>