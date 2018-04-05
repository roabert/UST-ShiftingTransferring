package ust.registrar.model.studentprocess;
import java.sql.*;
public class forgotpassword {

	public String email, getemail, passcode;

	public String getPasscode() {
		return passcode;
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
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
