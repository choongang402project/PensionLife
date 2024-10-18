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
<form id="frm" enctype="multipart/form-data">
	<input type="hidden" name="qidx" value="<%=rs.getString("qidx")%>">
	<input type="hidden" name="qfile1" value="<%=rs.getString("qfile1")%>">
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
        <p>1:1 문의게시판(문의수정)</p>
        <span class="sub_titles">빠르게 궁금한 사항을 답변 드리도록 하겠습니다.</span>
        <ul class="write_ul">
            <li class="cate_txt">질문항목 : <%=rs.getString("qcategory") %></li>
            <li><input type="text" class="w_input1 w_bg" name="qname" value="<%=rs.getString("qname") %>" readonly ></li>
            <li><input type="text" class="w_input1 w_bg" name="qmhp" value="<%=rs.getString("qhp") %>" readonly></li>
            <li><input type="text" class="w_input1 w_bg" name="qemail" value="<%=rs.getString("qemail") %>" readonly></li>
            <li><input type="text" class="w_input1" name="qtitle" value="<%=rs.getString("qtitle") %>"></li>
            <li><textarea class="w_input2" name="qtext"><%=rs.getString("qtext") %></textarea></li>
            <li class="fileview">첨부파일 :<%=rs.getString("qfile1") %>
            <span class="btn_del" id="btn_del" style="background-color: black; color:white;" onclick="file1_del()">삭제</span></li>
            <li class="fileview">첨부파일 : <%= rs.getString("qfile2") %>
            <span class="btn_del" id="btn_del" style="background-color: black; color:white;">삭제</span></li>
            <li class="fileview"><input type="file" class="w_li"> * 최대 2MB까지 가능</li>
            <li>※ 첨부파일은 이미지만 등록 가능합니다.</li>
        </ul>         
        <div class="member_agreebtn" onclick="go_qamodify_db(<%=rs.getInt("qidx")%>)">문의수정</div>
        <div class="member_agreebtn" onclick="go_qadelete_db(<%=rs.getInt("qidx")%>)"
        							 style="background-color: darkblue; color:white;">문의삭제</div>
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
</form>
</body>
<script>
function go_qamodify_db(qidx){
	if(frm.qtitle.value==""){
		alert("'질문 제목'을 입력해주세요.")
	}
	else if(frm.qtext.value==""){
		alert("'질문 내용'을 입력해주세요.");
	}
	else{
	frm.method = "post";
	frm.action = "qamodify_ok.do";
    frm.submit();
	}
}

function go_qadelete_db(qidx){
	frm.method = "post";
	frm.action = "qadelete_ok.do";
    frm.submit();
}
</script>
<script src="./js/top.js?v=9"></script>
</html>