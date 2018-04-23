package ust.registrar.model.admin;

import java.sql.*;

import DatabaseHandler.DatabaseSQLs;

public class AccountStatus implements DatabaseSQLs {

	public String userid, status, admin;
	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

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
	public String event, description;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public void checkStatusAccount(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts WHERE userid = ?");
			ps.setString(1, userid);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next()) {
		    	status = rs.getString("status");
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	public void activateAccount(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET status = 'active' WHERE userid = ?");
			ps.setString(1, userid);
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	public void disableAccount(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET status = 'disabled' WHERE userid = ?");
			ps.setString(1, userid);
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} 
	 public void insertLogs(Connection conn) {
			try {
				PreparedStatement ps = conn.prepareStatement(logs);
				ps.setString(1, admin);
				ps.setString(2, event);
				ps.setString(3, description);
				ps.executeUpdate(); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
}
