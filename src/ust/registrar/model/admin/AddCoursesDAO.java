package ust.registrar.model.admin;
import java.sql.*;
public class AddCoursesDAO {

	public String faculty, courses, getcollege;

	public String getFaculty() {
		return faculty;
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
}
