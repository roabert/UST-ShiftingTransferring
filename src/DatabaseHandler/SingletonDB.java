package DatabaseHandler;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SingletonDB {
	// primary requirement of Singleton pattern for implementation
	private static Connection connection;

	// primary requirement of Singleton pattern for implementation construction
	private SingletonDB() {

	}

	private static Connection getDBConnection() {

		try {

			// load the driver
			Class.forName("com.mysql.jdbc.Driver");

			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/capstone", "root", "root");
		} catch (ClassNotFoundException cfne) {
			System.err.println(cfne.getMessage());

		} catch (SQLException sqle) {
			System.err.println(sqle.getMessage());

		}
		return connection;

	}
	
	public static Connection getConnection(){
		return ( (connection!=null) ?connection:getDBConnection());
	}
}
