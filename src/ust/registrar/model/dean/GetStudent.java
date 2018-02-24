package ust.registrar.model.dean;

import java.sql.*;

public class GetStudent {

	public String id, deanname, deanremark;

	public String getDeanname() {
		return deanname;
	}

	public void setDeanname(String deanname) {
		this.deanname = deanname;
	}

	public String getDeanremark() {
		return deanremark;
	}

	public void setDeanremark(String deanremark) {
		this.deanremark = deanremark;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public void getStudent(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_status WHERE shifter_id = ?");
			 ps.setString(1, id);
			 
			 ResultSet rs = ps.executeQuery();
			 if(rs.next()) {
				 deanname = rs.getString("dean_id");
				 deanremark = rs.getString("dean_verified");
			 }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
