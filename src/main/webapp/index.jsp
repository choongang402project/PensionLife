<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.dbconfig" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection con = new dbconfig().dbinfo();
	String sql_group = "select rname, min(rprice) as mp, rimg from p_room group by rname";
	PreparedStatement ps = con.prepareStatement(sql_group);
	ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <script src="./js/jquery.js"></script>
    <script src="./js/m_index.js?v=1"></script>
    <script src="./js/m_reser.js?v=1"></script>
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
<section>
    <ol class="product">
<%
	while (rs.next()) {
		String rname = rs.getString("rname");
%>
        <li>
            <div onclick="js_sendReserv('<%= rname %>')">
                <span><img src="<%= rs.getString("rimg") %>"></span>
                <span><%= rname %></span>
                <span><%= rs.getString("mp") %>원</span>
            </div>
        </li>
<%
	}
%>
    </ol>
</section>
<form id="frm_reserv">
	<input type="hidden" name="resername" id="resername" value="">
</form>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
</body>
<%
	rs.close();
	ps.close();
	con.close();
%>
<script src="./js/top.js?v=6"></script>
</html>