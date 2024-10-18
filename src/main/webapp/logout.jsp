<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PrintWriter pw = response.getWriter();
HttpSession se=request.getSession();
se.removeAttribute("user");
pw.write("<script>alert('로그아웃 되었습니다.');window.location.href='./index.jsp';</script>");

%>
