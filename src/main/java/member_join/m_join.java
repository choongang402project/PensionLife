package member_join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class m_join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			join_dto dto =new join_dto();
			request.setCharacterEncoding("utf-8");
			
			String ok1= (String)request.getParameter("OK1");
			String ok2= (String)request.getParameter("OK2");
			String ok3= (String)request.getParameter("OK3");
			String ok4= (String)request.getParameter("OK4");
			String ok5= (String)request.getParameter("OK5");
			dto.setTerms1(ok1);
			dto.setTerms2(ok2);
			dto.setTerms3(ok3);
			dto.setTerms4(ok4);
			dto.setTerms5(ok5);
			request.setAttribute("dto", dto);

			RequestDispatcher rd= request.getRequestDispatcher("./m_join2.jsp");
			rd.forward(request, response);
	}

}
	