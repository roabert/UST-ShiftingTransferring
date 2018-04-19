package ust.registrar.model.main;

import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
import ust.registrar.utility.EncryptionTool;

public class LoginDAO implements DatabaseSQLs {

	public String userid, password, type;
	
	public String event, description;

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
	
	public void LoginUser(Connection conn) {
		
		
		try {
		PreparedStatement ps = conn.prepareStatement("SELECT userid, password, type FROM useraccounts WHERE userid = ? AND password = ?");
		ps.setString(1, userid);
		ps.setString(2, EncryptionTool.encrypt(password));
	/**	ps.setString(3, userid);
		ps.setString(4, password);
		ps.setString(5, userid);
		ps.setString(6, password); */
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
		
		type = rs.getString("type");
		
		}
		}
		catch(SQLException sql){
	      System.err.println(sql);
		}
		
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

	public void Login(Connection conn) {
		LoginUser(conn);
		insertLogs(conn);
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
