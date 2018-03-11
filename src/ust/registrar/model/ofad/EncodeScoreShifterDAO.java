package ust.registrar.model.ofad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class EncodeScoreShifterDAO implements DatabaseSQLs{
	 public String studentid, userid;
	 public int math, science, english, iq, total;
	public String getStudentid() {
		return studentid;
	}
	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	public int getScience() {
		return science;
	}
	public void setScience(int science) {
		this.science = science;
	}
	public int getEnglish() {
		return english;
	}
	public void setEnglish(int english) {
		this.english = english;
	}
	public int getIq() {
		return iq;
	}
	public void setIq(int iq) {
		this.iq = iq;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	 public void EncodeScore(Connection conn) {
		  try {
			PreparedStatement ps = conn.prepareStatement(EncodeScores_Shifter);
			ps.setString(1, userid);
			ps.setInt(2, math);
			ps.setInt(3, science);
			ps.setInt(4, english);
			ps.setInt(5, iq);
			ps.setInt(6, total);
			ps.setString(7, studentid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 public void ExamTaken(Connection conn) {
		  try {
			PreparedStatement ps = conn.prepareStatement(ExamTaken_Shifter);
			ps.setString(1, studentid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
	 public void doEncodeShifter(Connection conn){
		 EncodeScore(conn);
		 ExamTaken(conn);
	 }
	
}
