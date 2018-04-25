package ust.registrar.utility;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class GetTransactions implements DatabaseSQLs{
	
	public int CountTransactions(Connection conn, String studentid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM transactions WHERE student_id = ?");
			ps.setString(1, studentid);
	  		ResultSet getSY = ps.executeQuery();
	  		while (getSY.next()){
	  			count = getSY.getInt(1);
	  		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public int CountTransactionsSpecific(Connection conn, String studentid, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM transactions WHERE student_id = ? AND user_role = ?");
			ps.setString(1, studentid);
			ps.setString(2, userid);
	  		ResultSet getSY = ps.executeQuery();
	  		while (getSY.next()){
	  			count = getSY.getInt(1);
	  		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	
	public int CountTransactionsSpecificBad(Connection conn, String studentid, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM transactions WHERE student_id = ? AND user_role = ? AND action = 'Rejected'");
			ps.setString(1, studentid);
			ps.setString(2, userid);
	  		ResultSet getSY = ps.executeQuery();
	  		while (getSY.next()){
	  			count = getSY.getInt(1);
	  		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public String[] getTransactions(Connection conn, String studentid, String userid) {
		String[] schoolYear = new String[CountTransactionsSpecific(conn, studentid, userid)];
		int index = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT * from transactions WHERE student_id = ? AND user_role = ?");
			ps.setString(1, studentid);
			ps.setString(2, userid);
	  		ResultSet getSY = ps.executeQuery();
	  		while (getSY.next()){
	  			schoolYear[index ]= getSY.getString("action")+" on "+getSY.getString("timestamp");
	  			index++;
	  		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return schoolYear;
	}
}
