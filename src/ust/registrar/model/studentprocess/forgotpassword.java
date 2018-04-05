package ust.registrar.model.studentprocess;
import java.sql.*;
public class forgotpassword {

	public String email, getemail, passcode, confirmcode, confirmemail, password, changepassemail, changegetuser;

	public String getChangegetuser() {
		return changegetuser;
	}
	public void setChangegetuser(String changegetuser) {
		this.changegetuser = changegetuser;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getChangepassemail() {
		return changepassemail;
	}
	public void setChangepassemail(String changepassemail) {
		this.changepassemail = changepassemail;
	}
	public String getPasscode() {
		return passcode;
	}
	public String getConfirmcode() {
		return confirmcode;
	}
	public void setConfirmcode(String confirmcode) {
		this.confirmcode = confirmcode;
	}
	public String getConfirmemail() {
		return confirmemail;
	}
	public void setConfirmemail(String confirmemail) {
		this.confirmemail = confirmemail;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getGetemail() {
		return getemail;
	}
	public void setGetemail(String getemail) {
		this.getemail = getemail;
	}
	public void confirmEmail(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts WHERE email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getemail = rs.getString("email");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void generateCode(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET reset_key = ? WHERE email = ?");
			ps.setString(1, passcode);
			ps.setString(2, getemail);
			ps.executeUpdate();
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
	}
	public void confirmCode(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts WHERE email = ?");
			ps.setString(1, confirmemail);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				confirmcode = rs.getString("reset_key");
				confirmemail = rs.getString("email");
			}
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
	}
	public void changePassword(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE useraccounts SET password = ? WHERE email = ?");
			ps.setString(1, password);
			ps.setString(2, changepassemail);
			ps.executeUpdate();
	
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
	}
	public void getUsernameLogin(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM useraccounts WHERE email = ?");
			ps.setString(1, changepassemail);
			ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	        	changegetuser = rs.getString("userid");
	        }
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
	  	e.printStackTrace();
	    }
	}
	public void ChangePasswordSuccessful(Connection conn) {
		getUsernameLogin(conn);
		changePassword(conn);
		
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
