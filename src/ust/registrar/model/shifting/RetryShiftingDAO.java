package ust.registrar.model.shifting;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class RetryShiftingDAO implements DatabaseSQLs{

	public String studentid;
	public String event, description;

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	
	public void RemoveStatus(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM shifters_status WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RemoveRequirements(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM shifters_requirements WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RetryProcess(Connection conn) {
		RemoveStatus(conn);
		RemoveRequirements(conn);
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, studentid);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
