package ust.registrar.model.transferring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;
import ust.registrar.utility.EncryptionTool;

public class NewPasswordDAO implements DatabaseSQLs{


	public String password, transferid, getpassword;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTransferid() {
		return transferid;
	}
	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}
	
	public void checkPassword(Connection conn) {
	    try {
			PreparedStatement ps = conn.prepareStatement("SELECT password FROM useraccounts WHERE userid = ?");
			ps.setString(1, transferid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getpassword = EncryptionTool.decrypt(rs.getString("password"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}
	
	public void changePassword(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET password = ? WHERE userid = ?");
			ps.setString(1, EncryptionTool.encrypt(password));
			ps.setString(2, transferid);
			ps.executeUpdate(); 
	        
	       
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
	}
	public void changedPasswordProof(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE student_transfer SET passwordchanged = 'Approved' WHERE userid = ?");
		
			ps.setString(1, transferid);
			ps.executeUpdate(); 
	        
	       
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
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
	 public void TransfereeChangePassword(Connection conn) {
		 changePassword(conn);
		 changedPasswordProof(conn);
		
	 }
}
