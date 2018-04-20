package ust.registrar.model.secgen;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class OSGVerifyDAO implements DatabaseSQLs {

	public String studentid, osgname, approved, remarks;
	public String event, description;

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

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
			pst.setString(2, approved);
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
			pst.setString(2, approved);
			pst.setString(3, remarks);
			pst.setString(4, studentid);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
public void insertLogs(Connection conn) {
	try {
		PreparedStatement ps = conn.prepareStatement(logs);
		ps.setString(1, osgname);
		ps.setString(2, event);
		ps.setString(3, description);
		ps.executeUpdate(); ps.close(); 
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public String getApproved() {
	return approved;
}

public void setApproved(String approved) {
	this.approved = approved;
}
}
