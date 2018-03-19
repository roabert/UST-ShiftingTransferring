package ust.registrar.model.ofad;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class SetExamScheduleDAO implements DatabaseSQLs{
   public String shifterid, transferid, examdate, start, end, venue, remarks;

public String getVenue() {
	return venue;
}

public void setVenue(String venue) {
	this.venue = venue;
}

public String getShifterid() {
	return shifterid;
}

public String getTransferid() {
	return transferid;
}

public void setTransferid(String transferid) {
	this.transferid = transferid;
}

public String getShiftertid() {
	return shifterid;
}

public void setShifterid(String studentid) {
	this.shifterid = studentid;
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
		ps.setString(1, shifterid);
		ps.setString(2, examdate);
		ps.setString(3, start);
		ps.setString(4, end);
		ps.setString(5, venue);
		ps.setString(6, remarks);
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
		ps.setString(2, shifterid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  }
  public void readyForEncode(Connection conn) {
	  try {
			PreparedStatement ps = conn.prepareStatement(Ofad_setEncode);
		
			ps.setString(1, shifterid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
  }
    public void doSetExam(Connection conn) {
    	setExamSchedule(conn);
    	fillExamDate(conn);
    	readyForEncode(conn);
    	
    }
    public void doSetExam2(Connection conn) {
    	setExamSchedule2(conn);
    	fillExamDate2(conn);
    	readyForEncode2(conn);
    }
    
    public void setExamSchedule2(Connection conn) {
  	  
  	  try {
  		PreparedStatement ps = conn.prepareStatement(Ofad_examschedTransfer);
  		ps.setString(1, transferid);
  		ps.setString(2, examdate);
  		ps.setString(3, start);
  		ps.setString(4, end);
  		ps.setString(5, venue);
  		ps.setString(6, remarks);
  		ps.executeUpdate();
  	} catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    }
    public void fillExamDate2(Connection conn) {
  	  try {
  		PreparedStatement ps = conn.prepareStatement(Ofad_setexamTransfer);
  		ps.setString(1, examdate);
  		ps.setString(2, transferid);
  		ps.executeUpdate();
  	} catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    }
    public void readyForEncode2(Connection conn) {
  	  try {
  			PreparedStatement ps = conn.prepareStatement(Ofad_setTransferEncode);
  		
  			ps.setString(1, transferid);
  			ps.executeUpdate();
  		} catch (SQLException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
    }
}
