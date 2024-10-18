package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pension_reservation.do")
public class in_reserv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String rname = request.getParameter("rname");
		
		select_option so = new select_option();
		ArrayList<ArrayList<String>> result = so.load_data(rname);
		this.pw = response.getWriter();
		this.pw.write("var sdata = new Array();");
		int n = 0, w = 0;
		do {
			this.pw.write("var data_dump = new Array();");
			w = 0;
			do {
				this.pw.write("data_dump.push('" + result.get(n).get(w) + "');");
				w++;
			} while (w < result.get(0).size());
			this.pw.write("sdata.push(data_dump);");
			n++;
		} while (n < result.size());
		this.pw.close();
	}

}
