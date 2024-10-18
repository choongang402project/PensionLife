package reservation;

import java.sql.ResultSet;
import java.util.ArrayList;

import jdbc.sql_select;

class select_option {
	private ResultSet rs = null;
	private String tn = "p_room";
	private String a[] = {"ridx", "rname2", "rcomp", "rpersonnel", "raddpersonnel", "rprice"};
	private String b = "rname";
	
	public ArrayList<ArrayList<String>> load_data(String data) {
		ArrayList<ArrayList<String>> call = new ArrayList<ArrayList<String>>();
		sql_select ss = new sql_select();
		try {
			ss.makeString(this.tn, this.a, this.b, data);
			this.rs = ss.getResultSet();
			while (this.rs.next()) {
				ArrayList<String> call_dump = new ArrayList<String>();
				call_dump.add(this.rs.getString("ridx"));
				call_dump.add(this.rs.getString("rname2"));
				call_dump.add(this.rs.getString("rcomp"));
				call_dump.add(this.rs.getString("rpersonnel"));
				call_dump.add(this.rs.getString("raddpersonnel"));
				call_dump.add(this.rs.getString("rprice"));
				call.add(call_dump);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				this.rs.close();
				ss.libclose();
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		return call;
	}
}
