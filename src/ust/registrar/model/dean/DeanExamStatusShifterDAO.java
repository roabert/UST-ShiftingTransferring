package ust.registrar.model.dean;

import DatabaseHandler.DatabaseSQLs;
import java.sql.*;

public class DeanExamStatusShifterDAO implements DatabaseSQLs{
	public String studentid, deanid, status, remarks;
	public String event, description;

	public String getRemarks() {
		return remarks;
	}

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

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getDeanid() {
		return deanid;
	}

	public void setDeanid(String deanid) {
		this.deanid = deanid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	public void PassorFail(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Dean_passfailShifter);
			ps.setString(1, deanid);
			ps.setString(2, status);
			ps.setString(3, remarks);
			ps.setString(4, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void PassorFailScore(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Dean_passfailScoreShifter);
			ps.setString(1, status);
			ps.setString(2, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void removeStudentSchedule(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(removeExamSchedShifter);
			ps.setString(1, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void readyForEndorsement(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(MemoForm_Shifter);
			ps.setString(1, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPassStudent(Connection conn) {
		PassorFail(conn);
		PassorFailScore(conn);
		removeStudentSchedule(conn);
		readyForEndorsement(conn);
	}
	public void doFailStudent(Connection conn) {
		PassorFail(conn);
		PassorFailScore(conn);
		removeStudentSchedule(conn);
	}

	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, deanid);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); ps.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
