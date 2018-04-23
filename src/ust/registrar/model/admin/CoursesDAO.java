package ust.registrar.model.admin;

import java.sql.*;

import DatabaseHandler.DatabaseSQLs;

public class CoursesDAO implements DatabaseSQLs{

	public String event, description, admin;
	
	public void activateCourse(Connection conn, String id) {
		String getCourse = "UPDATE courses SET status = 'active' WHERE courses_name = ?";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getCourse);
	    	pst.setString(1, id);
	    	pst.executeUpdate();
	    	pst.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
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

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public void deactivateCourse(Connection conn, String id) {
		String getCourse = "UPDATE courses SET status = 'inactive' WHERE courses_name = ?";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getCourse);
	    	pst.setString(1, id);
	    	pst.executeUpdate();
	    	pst.close();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
	}	
	 public void insertLogs(Connection conn) {
			try {
				PreparedStatement ps = conn.prepareStatement(logs);
				ps.setString(1, admin);
				ps.setString(2, event);
				ps.setString(3, description);
				ps.executeUpdate(); 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
