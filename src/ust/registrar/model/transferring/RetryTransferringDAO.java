package ust.registrar.model.transferring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class RetryTransferringDAO implements DatabaseSQLs{

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
	public String transferid;
	public String event, description;

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}
	
	public void RemoveStatus(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM transferees_status WHERE transferee_id = ?");
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RemoveRequirements(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM transferees_requirements WHERE transferee_id = ?");
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RetryProcess(Connection conn) {
		RemoveStatus(conn);
		RemoveRequirements(conn);
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, transferid);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
