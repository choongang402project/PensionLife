package member_join;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.sql_insert;

public class m_index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter ps=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		join_dto dto=new join_dto();
		
		String mid = request.getParameter("mid");
		String mname= request.getParameter("mname");
		String mpass= request.getParameter("mpass");
		String memail= request.getParameter("memail");
		String mhp= request.getParameter("mhp");
		String tables="p_member";
		
		String[] ok=(String[])request.getParameterValues("ok_ck");
		if(ok[4].equals("null")) {
			ok[4]="";
		}
		
		
		String[] column = {"midx","mid","mname","mpass","memail","mhp","useterm","Personal_info","Personal_info_third","Personal_info_con_pro","Marketing","mindate"};
		String data[] = {"0",mid,mname,mpass,memail,mhp,ok[0],ok[1],ok[2],ok[3],ok[4],"now()"};
		sql_insert in = new sql_insert();
		int a= in.makeString(tables,column,data);
		
		this.ps=response.getWriter();
		if(a>0) {
			this.ps.write("<script>alert('정상적으로 회원가입 되었습니다.');location.href='./index.jsp';</script>");
		}
		else {
			this.ps.write("<script>alert('올바른 회원가입형식이 맞지 않아 회원가입이 되지 않았습니다..');history.go(-1);</script>");	
		}
		this.ps.close();
	}

}
