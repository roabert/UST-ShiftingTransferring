package ust.registrar.utility;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class GetTransactions implements DatabaseSQLs{
	
	public int CountTransactions(Connection conn, String studentid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id)) FROM transactions WHERE student_id = ?");
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
	
	public int CountShiftTransactions(Connection conn) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid WHERE user_role = 'dean'");
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

	public int CountTransferTransactions(Connection conn) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_transfer on student_id = student_transfer.userid WHERE user_role = 'osa'");
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

	public int CountShifterSpecificBadTransactions(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid WHERE user_id= ? AND action = 'Rejected'");
			ps.setString(1, userid);
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

	public int CountTransferSpecificBadTransactions(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_transfer on student_id = student_transfer.userid WHERE user_id= ? AND action = 'Rejected'");
			ps.setString(1, userid);
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

	public int CountShifterSpecificTransactions(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid WHERE user_id= ?");
			ps.setString(1, userid);
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

	public int CountTransferSpecificTransactions(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_transfer on student_id = student_transfer.userid WHERE user_id= ?");
			ps.setString(1, userid);
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

	public int CountShifterSuccessTransactions(Connection conn) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM shifters_indorsement WHERE shifter_shifting_approved = 'Approved'");
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

	public int CountTransferSuccessTransactions(Connection conn) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transferees_indorsement WHERE transfer_transferring_approved = 'Approved'");
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


	public int CountShifterSuccessDeanTransactions(Connection conn, String getuser) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id)  FROM transactions INNER JOIN shifters_indorsement on student_id = shifters_indorsement.shifter_id WHERE shifter_shifting_approved = 'Approved' AND user_id = ?");
	  		ps.setString(1, getuser);
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

	public int CountTransferSuccessDeanTransactions(Connection conn, String getuser) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id)  FROM transactions INNER JOIN transferees_indorsement on student_id = transferees_indorsement.transferee_id WHERE transfer_transferring_approved = 'Approved' AND user_id = ?");
	  		ps.setString(1, getuser);
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

	public int CountShifterSuccesSpecificTransactions(Connection conn, String getuser) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM shifters_indorsement WHERE shifter_shifting_approved = 'Approved' AND user_id = ?");
	  		ps.setString(1, getuser);
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

	public int CountTransferSuccessSpecificTransactions(Connection conn, String getuser) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transferees_indorsement WHERE transfer_transferring_approved = 'Approved' AND user_id = ?");
	  		ps.setString(1, getuser);
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

	
	public int CountTransactionsSpecificDean(Connection conn, String studentid, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id)) FROM transactions WHERE student_id = ? AND user_id = ?");
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
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions WHERE student_id = ? AND user_role = ? AND action = 'Rejected'");
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
	
	public int CountTransactionsSpecificDeanBad(Connection conn, String studentid, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid WHERE student_id = ? AND user_id = ? AND action = 'Rejected'");
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
	
	public int CountTransactionsDeanBad(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT DISTINCT COUNT(*) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid  WHERE user_id = ? AND action = 'Rejected'");
			ps.setString(1, userid);
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

	
	public int CountTransactionsDeanGood(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_shifter on student_id = student_shifter.studentid WHERE user_id = ? AND action = 'Approved'");
			ps.setString(1, userid);
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

	
	public int CountTransactionsTrDeanBad(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions INNER JOIN student_transfer on student_id = student_transfer.userid WHERE user_id = ? AND action = 'Rejected'");
			ps.setString(1, userid);
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

	
	public int CountTransactionsTrDeanGood(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id)) FROM transactions INNER JOIN student_transfer on student_id = student_transfer.userid WHERE user_id = ? AND action = 'Approved'");
			ps.setString(1, userid);
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


	
	public int CountTransactionsGood(Connection conn, String userid) {
		int count = 0;
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT COUNT(DISTINCT student_id) FROM transactions WHERE user_role = ? AND action = 'Approved'");
			ps.setString(1, userid);
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
