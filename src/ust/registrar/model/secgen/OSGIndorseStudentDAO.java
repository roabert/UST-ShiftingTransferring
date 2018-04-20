package ust.registrar.model.secgen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSGIndorseStudentDAO implements DatabaseSQLs {

	public String studentid, secgen, remarks;
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

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getSecgen() {
		return secgen;
	}

	public void setSecgen(String secgen) {
		this.secgen = secgen;
	}
	public void IndorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGapproveShifter);
			ps.setString(1, secgen);
			ps.setString(2, remarks);
			ps.setString(3, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dontIndorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGdisapproveShifter);
			ps.setString(1, secgen);
			ps.setString(2, remarks);
			ps.setString(3, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void approveShifter(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(approveShiftingFinal);
			ps.setString(1, studentid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void finalStep(Connection conn) {
		IndorseStudent(conn);
		approveShifter(conn);
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, secgen);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); ps.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
