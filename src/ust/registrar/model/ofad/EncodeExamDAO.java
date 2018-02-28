package ust.registrar.model.ofad;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import DatabaseHandler.DatabaseSQLs;

public class EncodeExamDAO implements DatabaseSQLs{
	 public String studentid, examdate, starttime, endttime;
	public String getExamdate() {
		return examdate;
	}

	public void setExamdate(String examdate) {
		this.examdate = examdate;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public String getEndttime() {
		return endttime;
	}

	public void setEndttime(String endttime) {
		this.endttime = endttime;
	}
	public void setExamDate(Connection conn) {
		   
		try {
			PreparedStatement ps = conn.prepareStatement(Ofad_examsched);
			 ps.setString(1, studentid);
			 ps.setString(2, examdate);
			 ps.setString(3, starttime);
			 ps.setString(4, endttime);
			 ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  
	   }
}
