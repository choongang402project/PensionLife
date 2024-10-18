package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.sql_insert;

@WebServlet("/reser_insert.do")
public class reservation_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs = null;
	private PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String a[] = {"reser_idx", "room_idx", "member_idx", "reser_date", "reser_price", "reser_gname", "reser_gtel", "reser_gnum", "reser_email", "reser_sign_date"};
		String ridx = request.getParameter("reser_room_idx");
		String rdate = request.getParameter("reser_date");
		String rprice = request.getParameter("reser_price");
		String rname = request.getParameter("reser_gname");
		String rtel = request.getParameter("reser_gtel");
		String gnum = request.getParameter("reser_gnum");
		String email = request.getParameter("reser_email");
		this.hs = request.getSession();
		ArrayList<String> sessiondata = (ArrayList<String>) this.hs.getAttribute("user");
		String midx = sessiondata.get(6);
		String data[] = {"0", ridx, midx, rdate, rprice, rname, rtel, gnum, email, "now()"};
		
		sql_insert si = new sql_insert();
		int result = si.makeString("reservation", a, data);
		
		this.pw = response.getWriter();
		if (result > 0) {
			this.pw.write("<script>alert('펜션 예약에 성공하였습니다.'); location.href='./m_reservation_check.jsp';</script>");
		}
		else {
			this.pw.write("<script>alert('예약이 처리되지 않았습니다.'); history.go(-1);</script>");
		}
		this.pw.close();
	}

}
