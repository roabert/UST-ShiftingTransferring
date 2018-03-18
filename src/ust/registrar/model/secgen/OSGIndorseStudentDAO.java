package ust.registrar.model.secgen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSGIndorseStudentDAO implements DatabaseSQLs {

	public String studentid, secgen, remarks;

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
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dontIndorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGdisapproveShifter);
			ps.setString(1, secgen);
			ps.setString(1, remarks);
			ps.setString(3, studentid);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
