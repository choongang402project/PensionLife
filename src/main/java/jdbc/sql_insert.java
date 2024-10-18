package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class sql_insert extends dbconfig {
	private String sql = "";
	private Connection con = null;
	private PreparedStatement ps = null;
	
	public sql_insert() {
		try {
			this.con = super.dbinfo();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public int makeString(String tablename, String column[], String data[]) {
		sql = "insert into " + tablename + " (";
		int w = 0;
		do {
			if (w == 0) { sql += column[w]; }
			else { sql += ", " + column[w]; }
			w++;
		} while (w < column.length);
		sql += ") values (";
		w = 0;
		do {
			if (w == 0) { sql += "?"; }
			else {
				if (data[w] == "now()") {
					sql += ", now()";
				}
				else {
					sql += ", ?";
				}
			}
			w++;
		} while (w < data.length);
		sql += ")";
		return this.insert_execute(w, data);
	}
	
	private int insert_execute(int no, String data[]) {
		int result = 0;
		try {
			this.ps = this.con.prepareStatement(sql);
			int w = 0;
			do {
				if (data[w] != "now()") {
					this.ps.setString(w + 1, data[w]);
				}
				w++;
			} while (w < no);
			result = this.ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.ps.close();
				this.con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return result;
	}
}
