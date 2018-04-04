package ust.registrar.model.studentprocess;
import java.sql.*;

public class TrackerLogic {

	public String studentid, deanverified, osaverified, osgverified, ofadverified;
	
	
	public void TransferTrackerVerification(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ?");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				osaverified = rs.getString("osa_verified");
				deanverified = rs.getString("dean_verified");
				osgverified = rs.getString("secgen_verified");
				ofadverified = rs.getString("ofad_verified");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getDeanverified() {
		return deanverified;
	}

	public void setDeanverified(String deanverified) {
		this.deanverified = deanverified;
	}

	public String getOsaverified() {
		return osaverified;
	}

	public void setOsaverified(String osaverified) {
		this.osaverified = osaverified;
	}

	public String getOsgverified() {
		return osgverified;
	}

	public void setOsgverified(String osgverified) {
		this.osgverified = osgverified;
	}

	public String getOfadverified() {
		return ofadverified;
	}

	public void setOfadverified(String ofadverified) {
		this.ofadverified = ofadverified;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
}
