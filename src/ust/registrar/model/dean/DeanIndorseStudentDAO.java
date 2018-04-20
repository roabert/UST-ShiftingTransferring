package ust.registrar.model.dean;
import java.sql.*;
public class DeanIndorseStudentDAO {

	public String studentid, deanid, Endorsement;

	public String getEndorsement() {
		return Endorsement;
	}

	public void setEndorsement(String Endorsement) {
		this.Endorsement = Endorsement;
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
	
	
	public void deanIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET dean_id = ?, dean_indorsed = 'Approved', dean_Endorsement = ? ,secgen_indorsed = 'In-progress' WHERE shifter_id = ?");
			ps.setString(1, deanid);
			ps.setString(2, Endorsement);
			ps.setString(3, studentid);
			
			ps.executeUpdate(); ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void deanNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET dean_id = ?, dean_indorsed = 'Disapproved', dean_Endorsement = ? WHERE shifter_id = ?");
			ps.setString(1, deanid);
			ps.setString(2, Endorsement);
			ps.setString(3, studentid);
			ps.executeUpdate(); ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
