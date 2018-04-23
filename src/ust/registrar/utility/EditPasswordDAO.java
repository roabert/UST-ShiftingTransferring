package ust.registrar.utility;

import DatabaseHandler.DatabaseSQLs;
import java.sql.*;

public class EditPasswordDAO implements DatabaseSQLs{

	public String userid, password, getpassword, type;
	public String getGetpassword() {
		return getpassword;
	}
	public void setGetpassword(String getpassword) {
		this.getpassword = getpassword;
	}

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
	public void editPassword(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET password = ? WHERE userid = ?");
			ps.setString(1, password);
			ps.setString(2, userid);
			ps.executeUpdate();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void checkPassword(Connection conn) {
		try {
		
			PreparedStatement p = conn.prepareStatement("SELECT * FROM useraccounts WHERE userid = ?");
			p.setString(1, userid);
			ResultSet rs = p.executeQuery();
			while(rs.next()) {
				getpassword = rs.getString("password");
				type = rs.getString("type");
			}
		    rs.close();
		    p.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
   public void ModifyPasswords(Connection conn) {
	   editPassword(conn);
	   insertLogs(conn);
   }
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
