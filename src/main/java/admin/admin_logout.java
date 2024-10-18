package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/admin_logout.do")
public class admin_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession hs = null;
	private PrintWriter pw = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		this.hs = request.getSession();
		this.hs.removeAttribute("admin");
		this.pw = response.getWriter();
		this.pw.write("<script>alert('로그아웃 되었습니다.'); location.href='./admin_login.jsp';</script>");
		this.pw.close();
	}

}
