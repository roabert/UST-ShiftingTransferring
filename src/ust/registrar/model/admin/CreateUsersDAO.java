package ust.registrar.model.admin;

import java.sql.*;
import DatabaseHandler.DatabaseSQLs;
import ust.registrar.utility.EncryptionTool;

public class CreateUsersDAO implements DatabaseSQLs{

	public String admin;
	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getGetuser() {
		return getuser;
	}

	public void setGetuser(String getuser) {
		this.getuser = getuser;
	}

	public String getGetemail() {
		return getemail;
	}

	public void setGetemail(String getemail) {
		this.getemail = getemail;
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

	public String userid, password, email, lname, fname, mname, gender, type, college;
	public String getuser, getemail;
	public String event, description;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
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

	public String getMnname() {
		return mname;
	}

	public void setMnname(String mnname) {
		this.mname = mnname;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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
	
	public void checkUserandEmail(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			   getemail = rs.getString("email");
			   getuser = rs.getString("userid");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertUseraccounts(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, EncryptionTool.encrypt(password));
			ps.setString(3, email);
			ps.setString(4, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void Admin_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void Ofad_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Ofad_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void Registrar_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Registrar_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void Dean_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_Dean_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, college);
			ps.setString(7, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void OSA_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_OSA_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, type);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void OSG_insertDetails(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(Admin_OSG_InsertUsersSQL);
			ps.setString(1, userid);
			ps.setString(2, lname);
			ps.setString(3, fname);
			ps.setString(4, mname);
			ps.setString(5, email);
			ps.setString(6, type);
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
