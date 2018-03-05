package ust.registrar.model.osa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSAVerifyDAO implements DatabaseSQLs{

	public String transferid, userid, remarks;

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	} 
	public void verifyStudent(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(OSA_approveStudent);
			pst.setString(1, userid);
			pst.setString(2, remarks);
			pst.setString(3, transferid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void dontverifyStudent(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(OSA_disapproveStudent);
			pst.setString(1, userid);
			pst.setString(2, remarks);
			pst.setString(3, transferid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
