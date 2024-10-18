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
		
	String qidx = request.getParameter("qidx");
	String sql = "select * from qa_board where qidx=?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, qidx);
	ResultSet rs = ps.executeQuery();
	rs.next();
	
	String sql2 = "select * from qalist_view where qidx=?";
	ps = con.prepareStatement(sql2);	
	ps.setString(1, qidx);
	ResultSet rs2 = ps.executeQuery();
	rs2.next();

	
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
    <div class="menus_bar" id="menus_bar">
        <div class="load_menus" id="load_menus">
            <ul>
                <li>팬션 예약확인</li>
                <li>팬션 예약취소</li>
                <li>1:1문의 게시판</li>
            </ul>
        </div>
    </div>    
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
        <p>1:1 문의게시판(내용확인)</p>
        <span class="sub_titles">빠르게 궁금한 사항을 답변 드리도록 하겠습니다.</span>
        <ul class="write_ul">
            <li class="cate_txt">질문항목 :<%=rs.getString("qcategory") %></li>
            <li><input type="text" class="w_input1 w_bg" value="<%=rs.getString("qname") %>" readonly></li>
            <li><input type="text" class="w_input1 w_bg" value="<%=rs.getString("qhp") %>" readonly></li>
            <li><input type="text" class="w_input1 w_bg" value="<%=rs.getString("qemail") %>" readonly></li>
            <li><input type="text" class="w_input1" value="<%=rs.getString("qtitle") %>" readonly></li>
            <li><textarea class="w_input2" readonly><%=rs.getString("qtext") %></textarea></li>
            <li class="fileview">첨부파일 :
            <% if(rs.getString("qfile1")!=null || rs.getString("qfile1_url")!=null ){ %>
            <a href="<%= rs.getString("qfile1_url") %>"><%= rs.getString("qfile1") %></a> </li>
			<%} %>
            <li class="fileview">첨부파일 :
            <% if(rs.getString("qfile2")!=null){ %>
            <a href="<%= rs.getString("qfile2_url") %>"><%= rs.getString("qfile2") %></a> </li>
			<%} %>
        </ul>
         <% if(rs2.getString("contents")==null){ %>
         <input type="button" value="수정" onclick="goQaModify(<%=rs.getInt("qidx")%>)"> <!-- 내가 추가한 태그 -->
       	 <%} %>
        <!--관리자 답변사항-->
        <span class="admin_view" style="display: block;">관리자 답변내용</span>
        <ul class="answer_admin" style="display: block;">
        	<% if(rs2.getString("contents")==null){%>
        	<li></li>
        	<% }else{ %>
            <li> <%=rs2.getString("contents") %></li>
            <% } %>
        </ul>
        <!--관리자 답변사항-->
        <div class="member_agreebtn" onclick="go_qalist()">문의 리스트</div>
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
function goQaModify(qidx) {

    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "m_qamodify.jsp");

    var inputField = document.createElement("input");
    inputField.setAttribute("type", "hidden");
    inputField.setAttribute("name", "qidx");
    inputField.setAttribute("value", qidx);

    form.appendChild(inputField);
    document.body.appendChild(form);

    form.submit();
    
}

function go_qalist(){
	
	location.href = "./m_qalist.jsp";
	
}
</script>
<script src="./js/top.js?v=9"></script>
</html>