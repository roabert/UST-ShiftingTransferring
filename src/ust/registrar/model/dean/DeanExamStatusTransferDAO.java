package ust.registrar.model.dean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class DeanExamStatusTransferDAO implements DatabaseSQLs{
	public String transferid, deanid, status, remarks;

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
}
