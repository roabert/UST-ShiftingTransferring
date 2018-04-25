package ust.registrar.model.dean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class DeanExamStatusTransferDAO implements DatabaseSQLs{
	public String transferid, deanid, status, remarks;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
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
			PreparedStatement ps = conn.prepareStatement(Dean_passfailTransfer);
			ps.setString(1, deanid);
			ps.setString(2, status);
			ps.setString(3, remarks);
			ps.setString(4, transferid);
			ps.executeUpdate(); 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void PassorFailScore(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Dean_passfailScoreTransfer);
			ps.setString(1, status);
			ps.setString(2, transferid);
			ps.executeUpdate(); 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void removeStudentSchedule(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(removeExamSchedTransfer);
			ps.setString(1, transferid);
			ps.executeUpdate(); 
			PreparedStatement p = conn.prepareStatement("DELETE FROM exam_schedules_transferees WHERE transferee_id = ?");
			p.setString(1, transferid);
			p.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void readyForEndorsement(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(MemoForm_Tranfer);
			ps.setString(1, transferid);
			ps.executeUpdate(); 
			
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
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
