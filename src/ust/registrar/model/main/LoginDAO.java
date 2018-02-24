package ust.registrar.model.main;

import java.sql.*;

import DatabaseHandler.DatabaseSQLs;

public class LoginDAO implements DatabaseSQLs {

	public String userid, password, type;

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
	
	public void Login(Connection conn) {
		
		
		try {
		PreparedStatement ps = conn.prepareStatement(loginuserSQL);
		ps.setString(1, userid);
		ps.setString(2, password);
	/**	ps.setString(3, userid);
		ps.setString(4, password);
		ps.setString(5, userid);
		ps.setString(6, password); */
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
		type = rs.getString("type");
		}
		
		}
		catch(SQLException sql){
	      System.err.println(sql);
		}
		
	}
	public void ResultLogin() {
		
	}
}
