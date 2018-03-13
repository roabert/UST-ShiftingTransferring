package ust.registrar.model.shifting;
import java.sql.*;
public class MemoPrivelegeDAO {

	public String userid, dean;

	public String getDean() {
		return dean;
	}

	public void setDean(String dean) {
		this.dean = dean;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void showMemo(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ? AND dean_reviewed = 'Approved'");
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.next()) {
				userid = rs.getString("shifter_id");
				dean = rs.getString("dean_reviewed");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
