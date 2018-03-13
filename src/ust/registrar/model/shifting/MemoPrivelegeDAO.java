package ust.registrar.model.shifting;
import java.sql.*;
public class MemoPrivelegeDAO {

	public String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void showMemo(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_indorsement WHERE shifter_id = ?");
			ps.setString(1, userid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.next())
				userid = rs.getString("shifter_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
