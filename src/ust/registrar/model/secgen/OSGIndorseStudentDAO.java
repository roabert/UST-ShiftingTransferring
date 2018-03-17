package ust.registrar.model.secgen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSGIndorseStudentDAO implements DatabaseSQLs {

	public String studentid, secgen;

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
	public void indorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGStatusShifter);
			ps.setString(1, secgen);
			ps.setString(2, studentid);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
