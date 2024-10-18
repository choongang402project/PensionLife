package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class sql_delete extends dbconfig {
	private String sql = "";
	private Connection con = null;
	private PreparedStatement ps = null;
	
	public sql_delete() {
		try {
			this.con = super.dbinfo();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public int makeString(String tablename, String sc, String data) {
		String a[] = {data};
		return this.makeString(tablename, sc, a);
	}
	
	public int makeString(String tablename, String sc, String data[]) {
		sql = "delete from " + tablename + " where " + sc + " = ?";
		return this.delete_execute(data);
	}
	
	private int delete_execute(String data[]) {
		int result = 0;
		try {
			this.ps = this.con.prepareStatement(sql);
			int ck = 0;
			int w = 0;
			do {
				this.ps.setString(1, data[w]);
				ck += this.ps.executeUpdate();
				w++;
			} while (w < data.length);
			result = (ck ==data.length) ? ck : 0;
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
