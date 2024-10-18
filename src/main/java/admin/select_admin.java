package admin;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jdbc.sql_select;

public class select_admin {
	private ResultSet rs = null;
	private String table_admin = "admin_member";
	private String a[] = {"aidx", "aid", "apass", "aname", "aindate"};
	private sql_select ss = null;
	private List<String> arr1 = null;
	
	public List<String> login(String data[]) {
		this.arr1 = new ArrayList<String>();
		String col[] = {"aid", "apass"};
		try {
			this.ss = new sql_select();
			this.ss.makeString(this.table_admin, this.a, col, data, true);
			this.rs = this.ss.getResultSet();
			this.rs.next();
			if (this.rs.getString("aidx") != null && this.rs.getString("aid") != null && this.rs.getString("apass") != null) {
				this.arr1.add(this.rs.getString("aidx"));
				this.arr1.add(this.rs.getString("aid"));
				this.arr1.add(this.rs.getString("apass"));
				this.arr1.add(this.rs.getString("aname"));
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.rs.close();
				this.ss.libclose();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return this.arr1;
	}
}
