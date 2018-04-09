package ust.registrar.model.studentprocess;
import java.sql.*;
import DatabaseHandler.*;

public class processfailed {
    
	public String getstudentid, osaremarks, deanremarks, osgremarks, ofadremarks, deanreviewed_remarks;
    
	public String getDeanreviewed_remarks() {
		return deanreviewed_remarks;
	}

	public void setDeanreviewed_remarks(String deanreviewed_remarks) {
		this.deanreviewed_remarks = deanreviewed_remarks;
	}

	public void displayRemarksTransfer(Connection conn) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM transferees_status WHERE transferee_id = ? AND (osa_verified = 'Disapproved' OR dean_verified = 'Disapproved' OR secgen_verified = 'Disappproved' OR ofad_verified = 'Disapproved', OR dean_reviewed = 'Disapproved')");
		ps.setString(1, getstudentid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			osaremarks = rs.getString("osa_remarks");
			deanremarks = rs.getString("dean_remarks");
			osgremarks = rs.getString("secgen_remarks");
			ofadremarks = rs.getString("ofad_remarks");
			deanreviewed_remarks = rs.getString("dean_reviewed_remarks");
			
		}
	}
   
	public void displayRemarksShifter(Connection conn) throws SQLException {
		PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ? AND (dean_verified = 'Disapproved' OR secgen_verified = 'Disappproved' OR ofad_verified = 'Disapproved' OR dean_reviewed = 'Disapproved')");
		ps.setString(1, getstudentid);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {

			deanremarks = rs.getString("dean_remarks");
			osgremarks = rs.getString("secgen_remarks");
			ofadremarks = rs.getString("ofad_remarks");
			deanreviewed_remarks = rs.getString("dean_reviewed_remarks");
		}
	}
	
	public String getGetstudentid() {
		return getstudentid;
	}

	public void setGetstudentid(String getstudentid) {
		this.getstudentid = getstudentid;
	}

	public String getOsaremarks() {
		return osaremarks;
	}

	public void setOsaremarks(String osaremarks) {
		this.osaremarks = osaremarks;
	}

	public String getDeanremarks() {
		return deanremarks;
	}

	public void setDeanremarks(String deanremarks) {
		this.deanremarks = deanremarks;
	}

	public String getOsgremarks() {
		return osgremarks;
	}

	public void setOsgremarks(String osgremarks) {
		this.osgremarks = osgremarks;
	}

	public String getOfadremarks() {
		return ofadremarks;
	}

	public void setOfadremarks(String ofadremarks) {
		this.ofadremarks = ofadremarks;
	}
}
