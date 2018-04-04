package ust.registrar.model.studentprocess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ShifterTracker {
	
	public String studentid, idscore, idsched, deanverified, osgverified, ofadverified;
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
