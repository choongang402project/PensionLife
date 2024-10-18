<%@page import="java.util.ArrayList"%>
<%@page import="member_join.login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    HttpSession httpsess=request.getSession();
    
    ArrayList<Object> session_user_data= (ArrayList<Object>)httpsess.getAttribute("user");

    %>  
<div class="menus_bar" id="menus_bar">
    <div class="load_menus" id="load_menus">
        <ul>
            <li onclick="location.href='./m_reservation_check.jsp';">팬션 예약확인</li>
            <li>팬션 예약취소</li>
            <li onclick="location.href='./m_qalist.jsp';">1:1문의 게시판</li>
        </ul>
    </div>
</div>
<header>
<ul class="top_menu">
    <li id="menu_slide"><img src="./img/menu.svg"></li>
    <li onclick="gopage(1)"><img src="./img/header_logo.png"></li>     
    <%if(session_user_data==null){ %>
    <li onclick="login_pop();"><img src="./img/login.svg"></li>
    <%}else{ %>
    <li><%=session_user_data.get(1)+"님" %></li><li onclick="logout()"><img src="./img/top_exit.png"></li>
    <%} %>
</ul>
</header>
<form id="frm_top_login" onsubmit="login()">
<aside class="popup" id="popup" style="display:none;">
	<div class="login">
		<span class="close" onclick="pop_close();">X</span>
		<p>MEMBER-LOGIN</p>
		<ol>
		<li><input type="text" class="login_input" placeholder="아이디를 입력하세요" id="mid" name="mid"></li>
		<li><input type="password" class="login_input" placeholder="패스워드를 입력하세요" id="mpass" name="mpass"></li>
		<li><label><input type="checkbox" class="login_check" value="Y" name="auto_login"> 자동로그인</label></li>
		<li><input type="submit" value="로그인" class="login_btn" ></li>
		<li class="login_info">
		<span onclick="page_location(1)">아이디 찾기</span>
		<span onclick="page_location(2)">회원가입</span>
		</li>
		</ol>
	</div>
</aside>
</form>