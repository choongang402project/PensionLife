<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.sql_select"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession hss = request.getSession();
	List<String> sdata = (List<String>) hss.getAttribute("admin");
	sql_select select_module = null;
	if (sdata == null) {
		out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href = './admin_login.jsp';</script>");
	}
	else {
		String a[] = {"*"};
		select_module = new sql_select();
		select_module.makeString("qalist_view", true, "qidx");
		ResultSet rs = select_module.getResultSet();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./admin_css/index.css?v=5">
    <script src="./js/jquery.js"></script>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<article class="admin_lists">
    <p>QA 문의 게시판 답변 완료 리스트</p>
    <ul class="lists_uls color1">
        <li>제목</li>
        <li>글쓴이</li>
        <li>등록일</li>
    </ul>
    <!--qa 데이터 출력 리스트 부분 -->
<%
		while (rs.next()) {
			if (rs.getString("contents") != null) {
%>
    <ul class="lists_uls" onclick="js_select_qa('<%= rs.getString("qidx") %>')">
        <li style="text-align: left;"><%
				if (rs.getString("qtitle").length() > 15) {
					out.print(rs.getString("qtitle").substring(0, 15) + ".....");
				}
				else {
					out.print(rs.getString("qtitle"));
				}
		%></li>
        <li><%= rs.getString("qname") %></li>
        <li><%= rs.getString("qindate").split(" ")[0] %></li>
    </ul>
<%
			}
		}
%>
    <!--qa 데이터 출력 리스트 부분 -->
</article>
<form id="frm_qa_view">
	<input type="hidden" name="qa_idx_value" id="qa_idx_value" value="">
</form>
<input type="button" class="adbtn1" value="답변 등록된 문의" onclick="go_qalist('2')">
<br><br>
<%
		rs.close();
		select_module.libclose();
	}
%>
<%@ include file="./admin_footer.jsp" %>
</body>
<script src="./js/admin_page.js?v=3"></script>
</html>