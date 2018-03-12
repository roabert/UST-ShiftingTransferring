package ust.registrar.model.tracker;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class ShiftingTrackerDAO implements DatabaseSQLs{
  
	public String studentid;
	//for shifters_scores
	public String final_score;
	public String dean_reviewed;
	public String getDean_reviewed() {
		return dean_reviewed;
	}
	public void setDean_reviewed(String dean_reviewed) {
		this.dean_reviewed = dean_reviewed;
	}
	public String getFinal_score() {
		return final_score;
	}
	public void setFinal_score(String final_score) {
		this.final_score = final_score;
	}
	public void examscoreStatus(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(encodeExamShifter);
			pst.setString(1, studentid);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				final_score = rs.getString("final_score");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void examResults(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(encodeExamShifter);
			pst.setString(1, studentid);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				dean_reviewed = rs.getString("dean_reviewed");
				final_score = rs.getString("final_score");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
}
