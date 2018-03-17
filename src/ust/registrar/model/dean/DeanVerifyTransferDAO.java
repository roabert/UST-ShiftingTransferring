package ust.registrar.model.dean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class DeanVerifyTransferDAO implements DatabaseSQLs{

	public String transferid, deanid, remarks;

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}

	public String getDeanid() {
		return deanid;
	}

	public void setDeanid(String deanid) {
		this.deanid = deanid;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public void verifyStudent(Connection conn) {
		try {
			PreparedStatement pst = conn.prepareStatement(Dean_approveTransfer);
			pst.setString(1, deanid);
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
			PreparedStatement pst = conn.prepareStatement(Dean_disapproveTransfer);
			pst.setString(1, deanid);
			pst.setString(2, remarks);
			pst.setString(3, transferid);
			pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
