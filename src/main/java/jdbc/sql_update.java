package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class sql_update extends dbconfig {
	private String sql = "";
	private Connection con = null;
	private PreparedStatement ps = null;
	
	public sql_update() {
		try {
			this.con = super.dbinfo();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public int makeString(String tablename, String sc, String sd, String column[], String data[]) {
		sql = "update " + tablename + " set ";
		int w = 0;
		do {
			if (w == 0) { sql += column[w] + "=?"; }
			else { sql += ", " + column[w] + "=?"; }
			w++;
		} while (w < column.length);
		sql += " where " + sc + "=?";
		return this.update_execute(sd, data);
	}
	
	private int update_execute(String sc, String data[]) {
		int result = 0;
		try {
			this.ps = this.con.prepareStatement(sql);
			int w = 0;
			do {
				this.ps.setString(w + 1, data[w]);
				w++;
			} while (w < data.length);
			this.ps.setString(w + 1, sc);
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
