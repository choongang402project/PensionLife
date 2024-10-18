package member_join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.sql_select;

public class pass_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	PrintWriter pw=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession ssss=request.getSession();
		String id=request.getParameter("pass_search_id");
		String name=request.getParameter("pass_search_name");
		String mhp=request.getParameter("pass_search_mhp");
		sql_select sel = new sql_select();
		String table="p_member";
		String col1[]= {"*"};
		String col2[]= {"mname","mhp","mid"};
		String data[]= {name,mhp,id};
		sel.makeString(table,col1,col2,data,true);		
		try {			
			this.rs=sel.getResultSet();
			this.rs.next();			
			this.pw=response.getWriter();			
			String search_name=this.rs.getString("mname");
			String search_mhp=this.rs.getString("mhp");
			String search_id=this.rs.getString("mid");		
			String mypass=this.rs.getString("mpass");
			if(search_name.equals(name) && search_mhp.equals(mhp) && search_id.equals(id)){
				ssss.setAttribute("mid", search_id);
			RequestDispatcher rd =request.getRequestDispatcher("./change_pass.jsp");
			rd.forward(request, response);
			}
		}
		catch(SQLException se) {
			this.pw.write("<script>alert('가입되지 않은 회원정보입니다.');history.go(-1);</script>");
			
		}
		catch(Exception e) {
			System.out.println(e);
			this.pw.write("e");
		}
		finally {
			try {
				this.pw.close();
				this.rs.close();
				sel.libclose();}
			catch(Exception e) {
				System.out.println(e);
			}
		}
		
	}

}
