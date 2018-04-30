package ust.registrar.model.admin;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class SchoolYearDAO implements DatabaseSQLs{
	public String event, description, admin;

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
	public String getSchoolYear(Connection conn) {
		String schoolYear = "";
		try {
	  		PreparedStatement ps = conn.prepareStatement("SELECT * from schoolyear");
	  		ResultSet getSY = ps.executeQuery();
	  		while (getSY.next()){
	  			schoolYear = getSY.getString("school_year");
	  		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return schoolYear;
	}
	
	public void setSchoolYear(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE schoolyear SET school_year = ?");
			ps.setString(1, String.valueOf(Integer.parseInt(getSchoolYear(conn))+1));
			ps.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
