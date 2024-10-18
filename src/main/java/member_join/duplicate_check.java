package member_join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.dbconfig;

public class duplicate_check extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String id=request.getParameter("mid");
		dbconfig db=new dbconfig();
		try {
			PrintWriter pw=response.getWriter();
			String sql ="select count(*) as cnt from p_member where mid='"+id+"'";
		Connection connec= db.dbinfo();
		PreparedStatement ps =connec.prepareStatement(sql);
		ResultSet rs=ps.executeQuery();
		rs.next();
		int cnt=rs.getInt("cnt");
		
		if(cnt>0) {
			pw.write("사용중인 아이디입니다.");
		}
		else {
			pw.write("사용 가능한 아이디입니다.");	
		}
		pw.close();
		rs.close();
		ps.close();
		connec.close();
		}catch(Exception e) {
			
		}
		
	}

}
