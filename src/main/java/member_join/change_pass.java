package member_join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.dbconfig;

public class change_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			String pass=request.getParameter("change_pass");
			String id=request.getParameter("myid");
		
			dbconfig db= new dbconfig();
			try {
			java.sql.Connection con = db.dbinfo();
			String sql ="update p_member set mpass='"+pass+"' where mid='"+id+"'";
			PreparedStatement ps= con.prepareStatement(sql);
			int result= ps.executeUpdate();
			PrintWriter pw= response.getWriter();
			if(result>0) {
				pw.write("<script>alert('정상적으로 변경되었습니다.');location.href='./index.jsp';</script>");
			}
			else {
				pw.write("<script>alert('서버오류 발생');history.go(-1);</script>");	
			}
			pw.close();
			ps.close();
			con.close();
			}catch(Exception e) {
				
			}
	}

}
