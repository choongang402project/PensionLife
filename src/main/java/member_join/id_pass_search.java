package member_join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.sql_select;

public class id_pass_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ResultSet rs=null;
	PrintWriter pw=null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String name=request.getParameter("mname");
		String hp=request.getParameter("mhp");
		String email=request.getParameter("memail");
		sql_select sel = new sql_select();
		String table="p_member";
		String col1[]= {"*"};
		String col2[]= {"mname","mhp","memail"};
		String data[]= {name,hp,email};
		
		sel.makeString(table,col1,col2,data,true);
		try {
			this.rs=sel.getResultSet();
			this.rs.next();
			this.pw=response.getWriter();
			String search_name=this.rs.getString("mname");
			String search_mhp=this.rs.getString("mhp");
			String search_email=this.rs.getString("memail");
			String search_id=this.rs.getString("mid");
			
			
			
			if(search_name.equals(name) && search_mhp.equals(hp) && search_email.equals(email)){
				this.pw.write(search_id);
			}
		}
		catch(SQLException se) {
			this.pw.write("error");
			
		}
		catch(Exception e) {
			System.out.println(e);
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
