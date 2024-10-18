package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconfig {
	public Connection dbinfo() throws ClassNotFoundException, SQLException {
		final String dbinfo = "com.mysql.jdbc.Driver";
		final String dburl = "jdbc:mysql://webmiwon.co.kr:3306/llk_402";
		//final String dburl = "jdbc:mysql://localhost:3306/llk_402";
		final String dbuser = "llk_402";
		final String dbpass = "200_llk";

		Class.forName(dbinfo);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpass);
		return con;
	}
}
