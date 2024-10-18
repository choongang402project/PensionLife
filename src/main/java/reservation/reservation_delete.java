package reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.sql_delete;

@WebServlet("/reser_delete.do")
public class reservation_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String tn = "reservation";
		String ridx = request.getParameter("reser_idx");
		sql_delete sd = new sql_delete();
		int result = sd.makeString(tn, "reser_idx", ridx);
		this.pw = response.getWriter();
		if (result > 0) {
			this.pw.write("<script>alert('성공적으로 예약을 취소하셨습니다.'); location.href='./index.jsp';</script>");
		}
		else {
			this.pw.write("<script>alert('예약 취소에 오류가 발생하였습니다.'); history.go(-1);</script>");
		}
		this.pw.close();
	}

}
