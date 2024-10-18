package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class sql_select extends dbconfig {
	private String sql = "";
	private Connection con = null;
	private PreparedStatement ps = null;
	private PreparedStatement psc = null;
	private ResultSet rs = null;
	private ResultSet rsc = null;
	
	public sql_select() {
		try {
			this.con = super.dbinfo();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public int getCount(String tablename) {
		int result = 0;
		sql = "select count(*) as ctn from " + tablename;
		try {
			this.ps = this.con.prepareStatement(sql);
			this.rs = this.ps.executeQuery();
			this.rs.next();
			result = this.rs.getInt("ctn");
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public void makeString(String tablename) {
		String a[] = {"*"};
		this.makeString(tablename, a);
	}
	
	public void makeString(String tablename, String column[]) {
		String a[] = {};
		String b[] = {};
		this.makeString(tablename, column, a, b, false);
	}
	
	public void makeString(String tablename, String column[], String sc, String sd) {
		String a[] = {sc};
		String b[] = {sd};
		this.makeString(tablename, column, a, b, false);
	}
	
	public void makeString(String tablename, String column[], String sc[], String sd[], boolean whereck) {
		this.makeString(tablename, column, sc, sd, whereck, false, "");
	}
	
	public void makeString(String tablename, String column[], String sc[], String sd[], boolean whereck, boolean orderby, String cols) {
		this.makeString(tablename, column, sc, sd, whereck, false, "", 0, 0);
	}
	
	public void makeString(String tablename, boolean orderby, String cols) {
		String a[] = {};
		String b[] = {};
		String c[] = {"*"};
		this.makeString(tablename, c, a, b, false, orderby, cols, 0, 0);
	}
	
	public void makeString(String tablename, boolean orderby, String cols, int pageno, int limitno) {
		String a[] = {};
		String b[] = {};
		String c[] = {"*"};
		this.makeString(tablename, c, a, b, false, orderby, cols, pageno, limitno);
	}
	
	public void makeString(String tablename, String column[], String sc[], String sd[], boolean whereck, boolean orderby, String cols, int pageno, int limitno) {
		int w = 0;
		if (column[0] == "*") {
			sql = "select * from " + tablename;
		}
		else {
			sql = "select ";
			w = 0;
			do {
				if (w == 0) { sql += column[w]; }
				else { sql += ", " + column[w]; }
				w++;
			} while (w < column.length);
			sql += " from " + tablename;
		}
		if (sc.length != 0) {
			w = 0;
			do {
				if (w == 0) { sql += " where " + sc[w] + " = ?"; }
				else {
					if (whereck) {
						sql += " and " + sc[w] + " = ?";
					}
					else {
						sql += " or " + sc[w] + " = ?";
					}
				}
				w++;
			} while (w < sc.length);
		}
		if (!cols.equals("")) {
			if (orderby) {
				sql += " order by " + cols + " desc";
			}
			else {
				sql += " order by " + cols + " asc";
			}
		}
		if (limitno != 0) {
			int no = (pageno - 1) * limitno;
			sql += " limit " + no + ", " + limitno;
		}
		try {
			this.ps = this.con.prepareStatement(sql);
			if (sd.length != 0) {
				w = 0;
				do {
					this.ps.setString(w + 1, sd[w]);
					w++;
				} while (w < sd.length);
			}
			this.rs = this.ps.executeQuery();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public ResultSet getResultSet() {
		return this.rs;
	}
	
	public void libclose() {
		try {
			if (this.rs != null) {
				this.rs.close();
				this.ps.close();
			}
			if (this.rsc != null) {
				this.rsc.close();
				this.psc.close();
			}
			this.con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
