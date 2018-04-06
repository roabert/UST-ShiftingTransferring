package ust.registrar.model.studentprocess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShifterTracker {
	
	public String studentid, idscore, idsched, deanverified, osgverified, ofadverified;
	public String dean_timestamp, secgen_timestamp, ofad_timestamp, encoded_timestamp, reviewed_timestamp ;
	public String indorsed1_timestamp, indorsed2_timestamp;
	public String deanfaculty;
	public String getDeanfaculty() {
		return deanfaculty;
	}

	public void setDeanfaculty(String deanfaculty) {
		this.deanfaculty = deanfaculty;
	}

	public String getDean_timestamp() {
		return dean_timestamp;
	}

	public void setDean_timestamp(String dean_timestamp) {
		this.dean_timestamp = dean_timestamp;
	}


	public String getSecgen_timestamp() {
		return secgen_timestamp;
	}

	public void setSecgen_timestamp(String secgen_timestamp) {
		this.secgen_timestamp = secgen_timestamp;
	}

	public String getOfad_timestamp() {
		return ofad_timestamp;
	}

	public void setOfad_timestamp(String ofad_timestamp) {
		this.ofad_timestamp = ofad_timestamp;
	}
	
	public String getEncoded_timestamp() {
		return encoded_timestamp;
	}

	public void setEncoded_timestamp(String encoded_timestamp) {
		this.encoded_timestamp = encoded_timestamp;
	}

	public String getReviewed_timestamp() {
		return reviewed_timestamp;
	}

	public void setReviewed_timestamp(String reviewed_timestamp) {
		this.reviewed_timestamp = reviewed_timestamp;
	}

	public String getIndorsed1_timestamp() {
		return indorsed1_timestamp;
	}

	public void setIndorsed1_timestamp(String indorsed1_timestamp) {
		this.indorsed1_timestamp = indorsed1_timestamp;
	}

	public String getIndorsed2_timestamp() {
		return indorsed2_timestamp;
	}

	public void setIndorsed2_timestamp(String indorsed2_timestamp) {
		this.indorsed2_timestamp = indorsed2_timestamp;
	}

	public String getIdsched() {
		return idsched;
	}

	public void setIdsched(String idsched) {
		this.idsched = idsched;
	}

	public String getIdscore() {
		return idscore;
	}

	public void setIdscore(String idscore) {
		this.idscore = idscore;
	}

	public String getsched, examtaken, finalscore, deanreview, registrarindorsed, secgenindorsed, memostudentid;
	
	public String getExamtaken() {
		return examtaken;
	}

	public void setExamtaken(String examtaken) {
		this.examtaken = examtaken;
	}

	public String getMemostudentid() {
		return memostudentid;
	}

	public void setMemostudentid(String memostudentid) {
		this.memostudentid = memostudentid;
	}

	public String getRegistrarindorsed() {
		return registrarindorsed;
	}

	public void setRegistrarindorsed(String registrarindorsed) {
		this.registrarindorsed = registrarindorsed;
	}

	public String getSecgenindorsed() {
		return secgenindorsed;
	}

	public void setSecgenindorsed(String secgenindorsed) {
		this.secgenindorsed = secgenindorsed;
	}

	public String getGetsched() {
		return getsched;
	}

	public String getDeanreview() {
		return deanreview;
	}

	public void setDeanreview(String deanreview) {
		this.deanreview = deanreview;
	}

	public void setGetsched(String getsched) {
		this.getsched = getsched;
	}

	public void ShifterTrackerVerification(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				deanverified = rs.getString("dean_verified");
				osgverified = rs.getString("secgen_verified");
				ofadverified = rs.getString("ofad_verified");
				reviewed_timestamp = rs.getString("dean_date_reviewed");
				dean_timestamp = rs.getString("dean_date_verified");
				secgen_timestamp = rs.getString("secgen_date_verified");
				ofad_timestamp = rs.getString("ofad_date_verified");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void ShifterTrackerExams(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_exams WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			  idsched = rs.getString("shifter_id");
		      getsched = rs.getString("exam_schedule_date");
		      examtaken = rs.getString("exam_taken");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getFinalscore() {
		return finalscore;
	}

	public void setFinalscore(String finalscore) {
		this.finalscore = finalscore;
	}

	public void ShifterTrackerEncodeScore(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_scores WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				idscore = rs.getString("shifter_id");
		      finalscore = rs.getString("final_score");
		      deanreview = rs.getString("dean_reviewed");
		      encoded_timestamp = rs.getString("date_encoded");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
   public void ShifterTrackerMemo(Connection conn) {
	   try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_indorsement WHERE shifter_id = ?");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
		       registrarindorsed = rs.getString("registrar_indorsed");
		       secgenindorsed = rs.getString("secgen_indorsed");
		       memostudentid = rs.getString("shifter_id");
		       indorsed1_timestamp = rs.getString("registrar_date_indorsed");
		       indorsed2_timestamp = rs.getString("secgen_date_indorsed");
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
