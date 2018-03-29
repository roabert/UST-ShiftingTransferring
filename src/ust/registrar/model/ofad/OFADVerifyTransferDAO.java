package ust.registrar.model.ofad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class OFADVerifyTransferDAO implements DatabaseSQLs{
  public String transferid, ofadid, remarks, approved;

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

public String getOfadid() {
	return ofadid;
}

public void setOfadid(String ofadid) {
	this.ofadid = ofadid;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}
public void verifyOfad(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_approveTransfer);
		ps.setString(1, ofadid);
		ps.setString(2, approved);
		ps.setString(3, transferid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
public void dontverifyOfad(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_disapproveTransfer);
		ps.setString(1, ofadid);
		ps.setString(2, approved);
		ps.setString(3, remarks);
		ps.setString(4, transferid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
// Set exam schedule for student
public void transferForExam(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_transferForExam);
		ps.setString(1, transferid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public void doVerifyStudent(Connection conn) {
	   verifyOfad(conn);
	   transferForExam(conn);
}
}
