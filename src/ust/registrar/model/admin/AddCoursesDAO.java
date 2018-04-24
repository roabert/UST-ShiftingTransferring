package ust.registrar.model.admin;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class AddCoursesDAO implements DatabaseSQLs {

	public String faculty, courses, getcollege;
	public String event, description, admin;

	public String getFaculty() {
		return faculty;
	}

	public String getGetcollege() {
		return getcollege;
	}

	public void setGetcollege(String getcollege) {
		this.getcollege = getcollege;
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

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}

	public String getCourses() {
		return courses;
	}

	public void setCourses(String courses) {
		this.courses = courses;
	}
	public void addCourses(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO courses (courses_name, faculty) VALUES (?, ?)");
			ps.setString(1, courses);
			ps.setString(2, faculty);
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
