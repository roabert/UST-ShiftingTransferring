package ust.registrar.model.transferring;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RetryTransferringDAO {

	public String transferid;

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}
	
	public void RemoveStatus(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM transferees_status WHERE transferee_id = ?");
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RemoveRequirements(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM transferees_requirements WHERE transferee_id = ?");
			ps.setString(1, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void RetryProcess(Connection conn) {
		RemoveStatus(conn);
		RemoveRequirements(conn);
	}
}
