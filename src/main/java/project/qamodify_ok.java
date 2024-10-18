package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.dbconfig;


@MultipartConfig(
		fileSizeThreshold = 1024*1024*2,
		maxFileSize = 1024*1024*4,
		maxRequestSize = 1024*1024*100		
)

public class qamodify_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection con = null;
		PreparedStatement ps = null;
		PrintWriter pw = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String qidx = request.getParameter("qidx");
		String qtitle = request.getParameter("qtitle");
		String qtext = request.getParameter("qtext");	
		
		try {
		        con = new dbconfig().dbinfo();
				
		        String sql = "UPDATE qa_board SET qtitle=?, qtext=? WHERE qidx=?";
		        ps = con.prepareStatement(sql);
		        ps.setString(1, qtitle);
		        ps.setString(2, qtext);
		        ps.setString(3, qidx);

		        int result = ps.executeUpdate();
		        
		        if (result > 0) {
		            //out.println("<script>alert('문의가 성공적으로 수정되었습니다.');</script>");
					pw = response.getWriter();
					pw.write("<script>"
							+ "alert('문의수정이 정상적으로 완료되었습니다.');"
							+ "location.href='./m_qalist.jsp';"
							+ "</script>");	
		        	
		        } else {
		            //out.println("<script>alert('문의 수정에 실패했습니다.');</script>");
					pw = response.getWriter();
					pw.write("<script>"
							+ "alert('문의수정이 정상적으로 이루어지지 않았습니다.');"
							+ "history.go(-1);"
							+ "</script>");	
		        }
		    }catch (Exception e) {
		        System.out.println("DB연결오류");
		    }finally {
		    	try {
		    		pw.close();
		    		ps.close();
		    		con.close();
		    	}catch(Exception e) {
		    		System.out.println("DB가 종료되지 않음");
		    	}
		    }
		    
		
	}

}
