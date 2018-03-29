package ust.registrar.model.secgen;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OSGVerifyTransferDAO implements DatabaseSQLs{
  
	public String transferid, secgenid, remarks, approved;

	public String getApproved() {
		return approved;
	}

	public void setApproved(String approved) {
		this.approved = approved;
	}

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}

	public String getSecgenid() {
		return secgenid;
	}

	public void setSecgenid(String secgenid) {
		this.secgenid = secgenid;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
public void verifyStudent(Connection conn) {
		
		try {
			PreparedStatement pst = conn.prepareStatement(OSG_approveTransfer);
			pst.setString(1, secgenid);
			pst.setString(2, approved);
			pst.setString(3, transferid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
public void dontverifyStudent(Connection conn) {
		
		try {
			PreparedStatement pst = conn.prepareStatement(OSG_disapproveTransfer);
			pst.setString(1, secgenid);
			pst.setString(2, approved);
			pst.setString(3, remarks);
			pst.setString(4, transferid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
