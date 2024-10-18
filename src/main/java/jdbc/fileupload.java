package jdbc;

import java.io.IOException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Part;

public class fileupload {
	private String foldername = "";
	private ArrayList<Part> arr = null;
	private String url = "";
	private String filename = "";
	private ArrayList<String> filenamearr = null;
	private String pt = "8085";
	
	public fileupload(String folder, String url, Part file) {
		this.foldername = folder;
		this.url = url;
		this.arr = new ArrayList<Part>();
		this.arr.add(file);
		this.upload_execute();
	}
	
	public fileupload(String folder, String url, ArrayList<Part> file) {
		this.foldername = folder;
		this.url = url;
		this.arr = file;
		this.upload_execute();
	}
	
	private void upload_execute() {
		this.filenamearr = new ArrayList<String>();
		Date dt = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHms");
		String today = sf.format(dt);
		for (Part file : this.arr) {
			int rnd = (int) Math.ceil(Math.random() * 10000);
			String filename = file.getSubmittedFileName();
			String ip = null, fn = null;
			try {
				fn = today + String.valueOf(rnd) + getProperty(filename);
				file.write(this.url + fn);
				ip = InetAddress.getLocalHost().getHostAddress();
			} catch (IOException e) {
				System.out.println(e);
			}
			String result = "http://" + ip + ":" + pt + foldername + fn;
			
			this.filenamearr.add(result);
		}
		if (this.arr.size() == 1) {
			this.filename = this.filenamearr.get(0);
		}
	}
	
	private String getProperty(String n) {
		return n.substring(n.lastIndexOf("."));
	}
	
	public String getFileName() {
		return filename;
	}
	
	public ArrayList<String> getFileNameArr() {
		return filenamearr;
	}
}
