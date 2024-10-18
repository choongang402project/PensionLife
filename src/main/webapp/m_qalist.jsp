<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.dbconfig" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection con = new dbconfig().dbinfo();

	HttpSession hs = request.getSession();
	ArrayList<String> al = (ArrayList)hs.getAttribute("user");
	if(al==null){
		out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href='./index.jsp';</script>");
	}
	else{

	
	String sql = "select * from qalist_view where qid=? order by qidx desc";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, al.get(0));
	ResultSet rs = ps.executeQuery();
	//String parts = rs.getString("qindate").split("\\s+")[0];
	//String trimmedTitle = rs.getString("qtitle").length() > 15 ? rs.getString("qtitle").substring(0, 15) + "..." : rs.getString("qtitle");

	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>호텔 & 펜션 예약시스템</title>
    <link rel="stylesheet" type="text/css" href="./css/m_index.css?v=1">
    <link rel="stylesheet" type="text/css" href="./css/m_sub.css?v=2">
    <link rel="stylesheet" type="text/css" href="./css/m_qaboard.css?v=2">
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
<section class="subpage">
    <div class="member_agree">
        <p>1:1 문의게시판</p>
        <span class="sub_titles">질문하신 리스트가 출력 됩니다.</span>
        <ul class="qa_lists">
            <li>질문제목</li>
            <li>글쓴이</li>
            <li>등록일</li>
            <li>처리</li>
        </ul>
        <% while(rs.next()){%>
        <ul class="qa_lists2" onclick="viewQaDetail(<%=rs.getInt("qidx")%>)">
            <li>
            <div class="qtitle-link">
            <%=rs.getString("qtitle").length() > 15 ? rs.getString("qtitle").substring(0, 15) + "..." : rs.getString("qtitle") %>
            </div>
            </li> 
            <li><%=rs.getString("qname")%></li>
            <li><%=rs.getString("qindate").split("\\s+")[0]%></li>
            <% if(rs.getString("contents")==null){ %>
            <li>미답변</li>
            <% }else{ %>
            <li style="color: red;">답변완료</li>
            <% } %>
        </ul>
        <% }%>
        <div class="member_agreebtn" onclick="go_qawrite()">문의하기</div>
    </div>  
</section>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
<%
	rs.close();
	ps.close();
 	con.close();
	}
%>
</body>
<script>
function go_qawrite(){
	window.location.href = "m_qawrite.jsp";
}

function viewQaDetail(qidx) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "m_qaview.jsp");

    var inputField = document.createElement("input");
    inputField.setAttribute("type", "hidden");
    inputField.setAttribute("name", "qidx");
    inputField.setAttribute("value", qidx);

    form.appendChild(inputField);
    document.body.appendChild(form);

    form.submit();
}

</script>
<script src="./js/top.js?v=5"></script>
</html>