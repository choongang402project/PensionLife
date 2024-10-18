package member_join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.sql_select;




public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	HttpSession ss=null;
	PrintWriter pw=null;
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		ArrayList<String> al = new ArrayList<String>();
		this.ss=request.getSession();
		String id=request.getParameter("mid");
		String pass=request.getParameter("mpass");
		String auto_login = "";
		if(request.getParameter("auto_login")==null) {
			auto_login="N";
		}
		else {
			auto_login="Y";	
		}
		String table="p_member";
		String col1[]= {"*"};
		String col2[]= {"mid","mpass"};
		String data[]= {id,pass};
		Object[] s_id=(Object[])request.getAttribute("user");
		
		
		
		sql_select sel= new sql_select();
		sel.makeString(table, col1,col2,data,true);
		
		try {
			this.rs=sel.getResultSet();
			this.rs.next();
			boolean z=false;
			this.pw=response.getWriter();
			String mid=this.rs.getString("mid");
			String mpass=this.rs.getString("mpass");
			String name=rs.getString("mname");
			String mhp=rs.getString("mhp");
			String email=rs.getString("memail");
			String repass=mpass+"/auto";
			String midx=rs.getString("midx");
			if(mid!=null&&mpass!=null) {
				z=true;
				al.add(id);
				al.add(name);
				al.add(pass);
				al.add(auto_login);
				al.add(mhp);
				al.add(email);
				al.add(midx);
				ss.setAttribute("user", al);
		}
		if(z==true) {
			if(auto_login=="Y") {		
			this.pw.write("<script>"
					+ "localStorage.setItem('mid','"+mid+"');"
					+ "localStorage.setItem('mpass','"+repass+"');"
					+ "localStorage.setItem('autologin','"+auto_login+"');"
					+ "alert('로그인에 성공하였습니다.');location.href='./index.jsp';</script>");
				
		}
			else {
				this.pw.write("<script>alert('로그인에 성공하였습니다.');location.href='./index.jsp';</script>");
			}
		}
		}
		catch(Exception e) {
			this.pw.write("<script>alert('아이디와 비밀번호를 확인해주세요.');history.back();</script>");	
		}
		finally{
			try {
		this.pw.close();
		this.rs.close();
		sel.libclose();
			}
			catch(Exception e) {}
		}		
	}

}
