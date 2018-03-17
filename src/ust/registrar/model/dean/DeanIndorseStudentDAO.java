package ust.registrar.model.dean;
import java.sql.*;
public class DeanIndorseStudentDAO {

	public String studentid, deanid;

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
	
	
	public void deanIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET dean_id = ?, dean_indorsed = 'Approved', secgen_indorsed = 'In-progress' WHERE shifter_id = ?");
			ps.setString(1, deanid);
			ps.setString(2, studentid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deanNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET dean_id = ?, dean_indorsed = 'Disapproved' WHERE shifter_id = ?");
			ps.setString(1, deanid);
			ps.setString(2, studentid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
