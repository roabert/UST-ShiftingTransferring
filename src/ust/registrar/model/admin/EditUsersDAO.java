package ust.registrar.model.admin;

import DatabaseHandler.DatabaseSQLs;
import ust.registrar.utility.EncryptionTool;

import java.sql.*;

public class EditUsersDAO implements DatabaseSQLs {

	public String userget, lname, fname, mname, type, college;
	public String admin, event, description;
	public String password = "ust123";

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

	public String getUserget() {
		return userget;
	}

	public void setUserget(String userget) {
		this.userget = userget;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}
	
	public void modify_Admin(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify_Registrar(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Registrar_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify_OSG(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_OSG_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify_OSA(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_OSA_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify_Dean(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Dean_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, college);
			ps.setString(5, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void modify_Ofad(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Ofad_editUsersSQL);
			ps.setString(1, lname);
			ps.setString(2, fname);
			ps.setString(3, mname);
			ps.setString(4, userget);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void resetPassword(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET password = ? WHERE userid = ?");
			ps.setString(1, EncryptionTool.encrypt(password));
			ps.setString(2, userget);
		  
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
