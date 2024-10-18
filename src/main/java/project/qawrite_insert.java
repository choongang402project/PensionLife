package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import jdbc.fileupload;
import jdbc.sql_insert;

@MultipartConfig(
fileSizeThreshold = 1024*1024*2,
maxFileSize = 1024*1024*4,
maxRequestSize = 1024*1024*100	
)

public class qawrite_insert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private Connection con = null;
	//private PreparedStatement ps = null;
	//InputStream is = null;
	//FileOutputStream fs = null;
	PrintWriter pw = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tn = "qa_board";
		String a[] = {"qidx","qid","qcategory", "qname", "qhp", "qemail","qtitle","qtext","qfile1","qfile1_url", "qfile2", "qfile2_url", "qindate"};
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String qid = request.getParameter("qid");
		String qcategory = request.getParameter("qcategory");
		String qname = request.getParameter("qname");
		String qhp = request.getParameter("qhp");
		String qemail = request.getParameter("qemail");
		String qtitle = request.getParameter("qtitle");
		String qtext = request.getParameter("qtext");
		
		Part qfile1 = request.getPart("qfile1");
		Part qfile2 = request.getPart("qfile2");
		//System.out.println(qfile1);

		
		String qfile1_name = qfile1.getSubmittedFileName();
		String qfile2_name = qfile2.getSubmittedFileName();
		
		//웹 디렉토리 저장경로
		String foldername = "/qawrite/";
		String url = request.getServletContext().getRealPath(foldername);
		//System.out.println(url);
		
		ArrayList<Part> ap = new ArrayList<Part>();
        if (qfile1_name !="") {
        	ap.add(qfile1);
        }
        if (qfile2_name !="") {
        	ap.add(qfile2);	
        }
		fileupload fu = new fileupload(foldername,url, ap);
		ArrayList<String> furl = fu.getFileNameArr();
		
		sql_insert si = null;
		int result = 0;
		
		if(qfile1_name.equals("") && qfile2_name.equals("")) {
			String b[] = {"0",qid,qcategory,qname,qhp,qemail,qtitle,qtext,"","","","","now()"};
			si = new sql_insert();
			result = si.makeString(tn, a, b);
			
		}
		
		else if(qfile1_name!="" && qfile2_name=="") {
			String b[] = {"0",qid,qcategory,qname,qhp,qemail,qtitle,qtext,qfile1_name,furl.get(0),"","","now()"};
			si = new sql_insert();
			result = si.makeString(tn, a, b);
			
		}
		
		else if(qfile1_name=="" && qfile2_name!="") {
			String b[] = {"0",qid,qcategory ,qname,qhp,qemail,qtitle,qtext,"","", qfile2_name, furl.get(0), "now()"};
			si = new sql_insert();
			result = si.makeString(tn, a, b);
			
		}
		
		else {
			String b[] = {"0",qid,qcategory ,qname,qhp,qemail,qtitle,qtext, qfile1_name, furl.get(0), qfile2_name, furl.get(1), "now()"};
			si = new sql_insert();
			result = si.makeString(tn, a, b);
			
		}
		
		if(result>0) {
			//response.setCharacterEncoding("utf-8");
			//response.setContentType("text/html; charset=utf-8");
			pw = response.getWriter();
			pw.write("<script>"
					+ "alert('문의등록이 정상적으로 완료되었습니다.');"
					+ "location.href='./m_qalist.jsp';"
					+ "</script>");	
		}
		else {
			//response.setCharacterEncoding("utf-8");
			//response.setContentType("text/html; charset=utf-8");
			pw = response.getWriter();
			pw.write("<script>"
					+ "alert('문의등록이 실패하였습니다.');"
					+ "history.go(-1);"
					+ "</script>");	
		}
		pw.close();
	}

}
