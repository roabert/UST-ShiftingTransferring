package ust.registrar.model.ofad;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class EncodeScoreTransferDAO implements DatabaseSQLs{
	 public String transferid, userid;
	 public int math, science, english, iq, total;
	 public String event, description;
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTransferid() {
		return transferid;
	}
	public void setTransferid(String transferid) {
		this.transferid = transferid;
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
			PreparedStatement ps = conn.prepareStatement(EncodeScores_Transfer);
			ps.setString(1, userid);
			ps.setInt(2, math);
			ps.setInt(3, science);
			ps.setInt(4, english);
			ps.setInt(5, iq);
			ps.setInt(6, total);
			ps.setString(7, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 public void ExamTaken(Connection conn) {
		  try {
			PreparedStatement ps = conn.prepareStatement(ExamTaken_Transfer);
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
	 public void doEncodeTransfer(Connection conn){
		 EncodeScore(conn);
		 ExamTaken(conn);
	 }
	 
	 public void insertLogs(Connection conn) {
			try {
				PreparedStatement ps = conn.prepareStatement(logs);
				ps.setString(1, userid);
				ps.setString(2, event);
				ps.setString(3, description);
				ps.executeUpdate(); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
}