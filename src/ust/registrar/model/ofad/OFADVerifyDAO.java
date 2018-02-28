package ust.registrar.model.ofad;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class OFADVerifyDAO implements DatabaseSQLs {
   public String studentid, examdate, starttime, endttime, ofadid, remarks;

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
		ps.setString(2, remarks);
		ps.setString(3, studentid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   // Set exam schedule for student
   
   

}
