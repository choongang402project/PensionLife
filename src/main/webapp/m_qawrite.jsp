<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();
ArrayList<String> al = (ArrayList)hs.getAttribute("user");
if(al==null){
	out.print("<script>alert('로그인이 필요한 서비스입니다.'); location.href='./index.jsp';</script>");
}
else{
 

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
<input type="hidden" name="qid" value="<%=al.get(0) %>>">
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
        <p>1:1 문의게시판(글쓰기)</p>
        <span class="sub_titles">문의 유형 선택</span>
        <ol class="qa_part">
            <li onclick="sendQcategory('이용문의')">이용문의</li>
            <li onclick="sendQcategory('예약 및 취소')">예약 및 취소</li>
            <li onclick="sendQcategory('환불 및 요금')">환불 및 요금</li>
            <li onclick="sendQcategory('시설문의')">시설문의</li>
            <li onclick="sendQcategory('이벤트 문의')">이벤트 문의</li>
            <li onclick="sendQcategory('기타문의')">기타문의</li>
        </ol>
			<input type="hidden" id="qcategory" name="qcategory" value="">
        <ul class="write_ul">
            <li><input type="text" class="w_input1 w_bg" value="<%=al.get(1) %>" name="qname" readonly></li>
            <li><input type="text" class="w_input1 w_bg" value="<%=al.get(4) %>" name="qhp" readonly></li>
            <li><input type="text" class="w_input1 w_bg" value="<%=al.get(5) %>" name="qemail" readonly></li>
            <li><input type="text" class="w_input1" placeholder="질문 제목" name="qtitle"></li>
            <li><textarea class="w_input2" placeholder="질문 내용" name="qtext"></textarea></li>
            <li><input type="file" class="w_li" name="qfile1"> * 최대 2MB까지 가능</li>
            <li><input type="file" class="w_li" name="qfile2"> * 최대 2MB까지 가능</li>
            <li>※ 첨부파일은 이미지만 등록 가능합니다.</li>
        </ul>
        <div class="member_agreebtn" onclick="go_qawrite_insert()">문의등록</div>
    </div>  
</section>
</form>
<% } %>
<!-- 하단 시작 -->
<%@ include file="./footer.jsp" %>
</body>
<script>

function sendQcategory(qc) {
    // Hidden input 요소에 선택된 값 설정
    document.getElementById('qcategory').value = qc;
    //console.log(qc);
    //console.log(frm.qname.value);
}

function go_qawrite_insert(){
	
	if(document.getElementById('qcategory').value==""){
		alert("'문의 유형 선택'을 하셔야 문의등록이 가능합니다.");		
	}
	else if(frm.qtitle.value==""){
		alert("'질문 제목'을 입력해주세요.");
	}
	else if(frm.qtext.value==""){
		alert("'질문 내용'을 입력해주세요.");
	}	
	else{
		frm.method="post";
		//frm.action="./m_qalist.jsp";
		frm.action="./qawrite_insert.do";		
		//document.getElementById('frm').submit();
		frm.submit();
	}

}


</script>
<script src="./js/top.js?v=9"></script>
</html>