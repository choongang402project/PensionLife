package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_login.do")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs = null;
	private PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		String a[] = {id, pw};
		select_admin sa = new select_admin();
		List<String> data = sa.login(a);
		
		this.pw = response.getWriter();
		if (data.size() > 0) {
			this.hs = request.getSession();
			this.hs.setAttribute("admin", data);
			
			this.pw.write("<script>alert('로그인 되었습니다.'); location.href='./admin_qalist.jsp';</script>");
		}
		else {
			this.pw.write("<script>alert('아이디나 비밀번호를 확인하세요.'); history.go(-1);</script>");
		}
		this.pw.close();
	}

}
