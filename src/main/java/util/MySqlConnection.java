package util;




import java.sql.Connection;
import java.sql.DriverManager;

public class MySqlConnection {

	static Connection con;

	public static Connection getConnection() {

		try {
			String driverName = "com.mysql.cj.jdbc.Driver";
			String dbUrl = "jdbc:mysql://localhost:3306/dineshdb";
			String dbUserName = "root";
			String dbPassword = "Dinesh@362";

			Class.forName(driverName);
			con = DriverManager.getConnection(dbUrl, dbUserName, dbPassword);

		} catch (Exception e) {

		}
		return con;
	}

}
