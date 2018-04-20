package ust.registrar.model.secgen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSGIndorseTransfereeDAO implements DatabaseSQLs{
	public String transferid, secgen, remarks;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}

	public String getSecgen() {
		return secgen;
	}

	public void setSecgen(String secgen) {
		this.secgen = secgen;
	}
	public void IndorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGapproveTransfer);
			ps.setString(1, secgen);
			ps.setString(2, remarks);
			ps.setString(3, transferid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void transferApproved(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(approveTransferFinal);
			ps.setString(1, transferid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dontIndorseStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(OSGdisapproveTransfer);
			ps.setString(1, secgen);
			ps.setString(2, remarks);
			ps.setString(3, transferid);
			ps.executeUpdate(); ps.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void approveTransfer(Connection conn) {
		IndorseStudent(conn);
		transferApproved(conn);
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, secgen);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); ps.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
