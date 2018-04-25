package ust.registrar.model.registrar;
import java.sql.*;
import ust.registrar.model.admin.SchoolYearDAO;
import DatabaseHandler.DatabaseSQLs;
public class LogTransactionsDAO implements DatabaseSQLs{
	public void insertLogs(Connection conn, String studentid, String userid, String userRole) {
		
		SchoolYearDAO scDAO = new SchoolYearDAO();
		String schoolYear = scDAO.getSchoolYear(conn);
		int schoolYearToo = Integer.parseInt(schoolYear)+1;
		String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
		
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO transactions (student_id, user_id, action, user_role, school_year) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, studentid);
			ps.setString(2, userid);
			ps.setString(3, "Approved");
			ps.setString(4, userRole);
			ps.setString(5, actualSchoolYear);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertBadLogs(Connection conn, String studentid, String userid, String userRole) {
		
		SchoolYearDAO scDAO = new SchoolYearDAO();
		String schoolYear = scDAO.getSchoolYear(conn);
		int schoolYearToo = Integer.parseInt(schoolYear)+1;
		String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO transactions (student_id, user_id, action, user_role, school_year) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, studentid);
			ps.setString(2, userid);
			ps.setString(3, "Rejected");
			ps.setString(4, userRole);
			ps.setString(5, actualSchoolYear);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertVeryBadLogs(Connection conn, String studentid, String userid) {
		
		SchoolYearDAO scDAO = new SchoolYearDAO();
		String schoolYear = scDAO.getSchoolYear(conn);
		int schoolYearToo = Integer.parseInt(schoolYear)+1;
		String actualSchoolYear = schoolYear+" - "+Integer.toString(schoolYearToo);
		
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO transactions (student_id, user_id, action, user_role, school_year) VALUES (?, ?, ?, ?, ?)");
			ps.setString(1, studentid);
			ps.setString(2, userid);
			ps.setString(3, "ExamRejected");
			ps.setString(4, "deanExam");
			ps.setString(5, actualSchoolYear);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
