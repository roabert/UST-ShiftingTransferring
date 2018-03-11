package ust.registrar.model.dean;

import DatabaseHandler.DatabaseSQLs;
import java.sql.*;

public class DeanExamStatusShifterDAO implements DatabaseSQLs{
	public String studentid, deanid, status;

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
			ps.setString(3, studentid);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
