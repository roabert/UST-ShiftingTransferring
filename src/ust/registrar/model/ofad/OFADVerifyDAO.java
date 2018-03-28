package ust.registrar.model.ofad;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class OFADVerifyDAO implements DatabaseSQLs {
   public String studentid, ofadid, remarks, approved;

public String getApproved() {
	return approved;
}

public void setApproved(String approved) {
	this.approved = approved;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}

public String getStudentid() {
	return studentid;
}

public void setStudentid(String studentid) {
	this.studentid = studentid;
}

public String getOfadid() {
	return ofadid;
}

public void setOfadid(String ofadid) {
	this.ofadid = ofadid;
}
   public void verifyOfad(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_approveStudent);
		ps.setString(1, ofadid);
		ps.setString(2, approved);

		ps.setString(3, studentid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   public void dontverifyOfad(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_disapproveStudent);
		ps.setString(1, ofadid);
		ps.setString(2, approved);
		ps.setString(3, remarks);
		ps.setString(4, studentid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   // Set exam schedule for student
   public void studentForExam(Connection conn) {
	   try {
		PreparedStatement ps = conn.prepareStatement(Ofad_studentForExam);
		ps.setString(1, studentid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
   public void doVerifyStudent(Connection conn) {
	   verifyOfad(conn);
	   studentForExam(conn);
   }

}
