package ust.registrar.model.ofad;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import DatabaseHandler.DatabaseSQLs;
public class SetExamScheduleDAO implements DatabaseSQLs{
   public String shifterid, transferid, examdate, start, end, venue, remarks;
   public String getvenue, getstart, getend;
   
   public String event, description, userid;

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

public String getUserid() {
	return userid;
}

public void setUserid(String userid) {
	this.userid = userid;
}

public String getGetstart() {
	return getstart;
}

public void setGetstart(String getstart) {
	this.getstart = getstart;
}

public String getGetend() {
	return getend;
}

public void setGetend(String getend) {
	this.getend = getend;
}

public String getGetvenue() {
	return getvenue;
}

public void setGetvenue(String getvenue) {
	this.getvenue = getvenue;
}

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
    	setVenue(conn);
    	
    }
    public void doSetExam2(Connection conn) {
    	setExamSchedule2(conn);
    	fillExamDate2(conn);
    	readyForEncode2(conn);
    	setVenue(conn);
    }
    
    public String checkAvailability(Connection conn) throws ParseException{
    	String status = "";
    	SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    	Date startTime = format.parse(start);
    	Date endTime = format.parse(end);
    	 try {
    	  		PreparedStatement ps = conn.prepareStatement("SELECT * from exam_schedules_transferees where date = ? and venue = ?");
    	  		ps.setString(1, examdate);
    	  		ps.setString(2, venue);
    	  		ResultSet getScheds = ps.executeQuery();
    	  		while (getScheds.next()){
    	  			Date startTimeToo = format.parse(getScheds.getString("start_time"));
    	  			Date endTimeToo = format.parse(getScheds.getString("end_time"));
    	  			if(startTime.equals(startTimeToo)){
    	  				status = "NA";
    	  			}
    	 	  		
     	  			if(endTime.equals(endTimeToo)){
     	  				status = "NA";
     	  			}
    	  			
    	  			if(startTime.after(startTimeToo) && startTime.before(endTimeToo)){
    	  				status = "NA";		
    	  			}
    	  			
    	  			if(endTime.after(startTimeToo) && endTime.before(endTimeToo)){
    	  				status = "NA";
    	  			}
    	  			
    	  			if(startTime.before(startTimeToo) && endTime.after(endTimeToo)){
    	  				status = "NA";
    	  			}
    	  		}
    	  		
    	  	} catch (SQLException e) {
    	  		// TODO Auto-generated catch block
    	  		e.printStackTrace();
    	  	}
    	 try {
 	  		PreparedStatement ps = conn.prepareStatement("SELECT * from exam_schedules_shifters where date = ? and venue = ?");
 	  		ps.setString(1, examdate);
 	  		ps.setString(2, venue);
 	  		ResultSet getScheds = ps.executeQuery();
 	  		while (getScheds.next()){
 	  			Date startTimeToo = format.parse(getScheds.getString("start_time"));
 	  			Date endTimeToo = format.parse(getScheds.getString("end_time"));
 	  			if(startTime.equals(startTimeToo)){
 	  				status = "NA";
 	  			}
 	  		
 	  			if(endTime.equals(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  			
 	  			if(startTime.after(startTimeToo) && startTime.before(endTimeToo)){
 	  				status = "NA";		
 	  			}
 	  			
 	  			if(endTime.after(startTimeToo) && endTime.before(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  			
 	  			if(startTime.before(startTimeToo) && endTime.after(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  		}
 	  		
 	  	} catch (SQLException e) {
 	  		// TODO Auto-generated catch block
 	  		e.printStackTrace();
 	  	}
    	 
    	return status;
    }
    
    public String checkAvailabilityToo(Connection conn) throws ParseException{
    	String status = "";
    	SimpleDateFormat format = new SimpleDateFormat("HH:mm");
    	Date startTime = format.parse(start);
    	Date endTime = format.parse(end);
    	 try {
    	  		PreparedStatement ps = conn.prepareStatement("SELECT * from exam_schedules_shifters where date = ? and venue = ?");
    	  		ps.setString(1, examdate);
    	  		ps.setString(2, venue);
    	  		ResultSet getScheds = ps.executeQuery();
    	  		while (getScheds.next()){
    	  			Date startTimeToo = format.parse(getScheds.getString("start_time"));
    	  			Date endTimeToo = format.parse(getScheds.getString("end_time"));
    	  			if(startTime.equals(startTimeToo)){
    	  				status = "NA";
    	  			}
    	 	  		
     	  			if(endTime.equals(endTimeToo)){
     	  				status = "NA";
     	  			}
    	  			
    	  			if(startTime.after(startTimeToo) && startTime.before(endTimeToo)){
    	  				status = "NA";		
    	  			}
    	  			
    	  			if(endTime.after(startTimeToo) && endTime.before(endTimeToo)){
    	  				status = "NA";
    	  			}
    	  			
    	  			if(startTime.before(startTimeToo) && endTime.after(endTimeToo)){
    	  				status = "NA";
    	  			}
    	  		}
    	  		
    	  	} catch (SQLException e) {
    	  		// TODO Auto-generated catch block
    	  		e.printStackTrace();
    	  	}
    	 try {
 	  		PreparedStatement ps = conn.prepareStatement("SELECT * from exam_schedules_transferees where date = ? and venue = ?");
 	  		ps.setString(1, examdate);
 	  		ps.setString(2, venue);
 	  		ResultSet getScheds = ps.executeQuery();
 	  		while (getScheds.next()){
 	  			Date startTimeToo = format.parse(getScheds.getString("start_time"));
 	  			Date endTimeToo = format.parse(getScheds.getString("end_time"));
 	  			if(startTime.equals(startTimeToo)){
 	  				status = "NA";
 	  			}
 	  		
 	  			if(endTime.equals(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  			
 	  			if(startTime.after(startTimeToo) && startTime.before(endTimeToo)){
 	  				status = "NA";		
 	  			}
 	  			
 	  			if(endTime.after(startTimeToo) && endTime.before(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  			
 	  			if(startTime.before(startTimeToo) && endTime.after(endTimeToo)){
 	  				status = "NA";
 	  			}
 	  		}
 	  		
 	  	} catch (SQLException e) {
 	  		// TODO Auto-generated catch block
 	  		e.printStackTrace();
 	  	}
    	 
    	return status;
    }
    
    public void setVenue(Connection conn) {
  	  
  	  try {
  		PreparedStatement ps = conn.prepareStatement(Ofad_setvenue);
  		ps.setString(1, start);
  		ps.setString(2, end);
  		ps.setString(3, venue);
  		ps.executeUpdate(); 
  	} catch (SQLException e) {
  		// TODO Auto-generated catch block
  		e.printStackTrace();
  	}
    }
    public void checkVenue(Connection conn) {
    
  		try {
  			PreparedStatement ps = conn.prepareStatement(Ofad_getvenue);
			ps.setString(1, venue);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				getvenue = rs.getString("venue");
				getstart = rs.getString("start_time");
				getend = rs.getString("end_time");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

  		
  		
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
    public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, userid);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
