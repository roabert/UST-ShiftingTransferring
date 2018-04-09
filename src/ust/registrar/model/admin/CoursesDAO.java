package ust.registrar.model.admin;

import java.sql.*;

public class CoursesDAO {

	
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
}
