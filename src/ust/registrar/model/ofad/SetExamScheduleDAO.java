package ust.registrar.model.ofad;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class SetExamScheduleDAO implements DatabaseSQLs{
   public String studentid, examdate, start, end, remarks;

public String getStudentid() {
	return studentid;
}

public void setStudentid(String studentid) {
	this.studentid = studentid;
}

public String getExamdate() {
	return examdate;
}

public void setExamdate(String examdate) {
	this.examdate = examdate;
}

public String getStart() {
	return start;
}

public void setStart(String start) {
	this.start = start;
}

public String getEnd() {
	return end;
}

public void setEnd(String end) {
	this.end = end;
}

public String getRemarks() {
	return remarks;
}

public void setRemarks(String remarks) {
	this.remarks = remarks;
}

  public void setExamSchedule(Connection conn) {
	  
	  try {
		PreparedStatement ps = conn.prepareStatement(Ofad_examsched);
		ps.setString(1, studentid);
		ps.setString(2, examdate);
		ps.setString(3, start);
		ps.setString(4, end);
		ps.setString(5, remarks);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
  public void fillExamDate(Connection conn) {
	  try {
		PreparedStatement ps = conn.prepareStatement(Ofad_setexam);
		ps.setString(1, examdate);
		ps.setString(2, studentid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
    public void doSetExam(Connection conn) {
    	setExamSchedule(conn);
    	fillExamDate(conn);
    }
}
