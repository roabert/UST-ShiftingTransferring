package ust.registrar.model.shifting;
import java.sql.*;
public class RetryShiftingDAO {

	public String studentid;

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
}
