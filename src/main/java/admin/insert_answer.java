package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.sql_insert;

@WebServlet("/aqa_insert.do")
public class insert_answer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String a[] = {"ans_idx", "contents", "admin_idx", "qawr_idx", "ans_indate"};
		String atext = request.getParameter("ans_content") ;
		String aidx = request.getParameter("adm_idx");
		String qidx = request.getParameter("qa_idx");
		String data[] = {"0", atext, aidx, qidx, "now()"};
		
		sql_insert si = new sql_insert();
		int result = si.makeString("qa_answer", a, data);
		
		this.pw = response.getWriter();
		if (result > 0) {
			this.pw.write("<script>alert('답변이 정상 등록되었습니다.'); location.href = './admin_qalist.jsp';</script>");
		}
		else {
			this.pw.write("<script>alert('답변 등록이 정상 처리되지 않았습니다.'); history.go(-1);</script>");
		}
		this.pw.close();
	}

}
