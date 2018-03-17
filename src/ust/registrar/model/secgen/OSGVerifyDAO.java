package ust.registrar.model.secgen;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class OSGVerifyDAO implements DatabaseSQLs {

	public String studentid, osgname, remarks;

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getOsgname() {
		return osgname;
	}

	public void setOsgname(String osgname) {
		this.osgname = osgname;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public void verifyStudent(Connection conn) {
		
		try {
			PreparedStatement pst = conn.prepareStatement(OSG_approveStudent);
			pst.setString(1, osgname);
			pst.setString(2, remarks);
			pst.setString(3, studentid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
public void dontverifyStudent(Connection conn) {
		
		try {
			PreparedStatement pst = conn.prepareStatement(OSG_disapproveStudent);
			pst.setString(1, osgname);
			pst.setString(2, remarks);
			pst.setString(3, studentid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
