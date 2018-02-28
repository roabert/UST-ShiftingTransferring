package ust.registrar.model.shifting;

import java.sql.PreparedStatement;
import java.io.IOException;
import java.sql.*;
import javax.servlet.http.Part;

public class RequirementsDAO {
  public String studentid, newcourse, newprogram;
  public String getNewcourse() {
	return newcourse;
}
public void setNewcourse(String newcourse) {
	this.newcourse = newcourse;
}
public String getNewprogram() {
	return newprogram;
}
public void setNewprogram(String newprogram) {
	this.newprogram = newprogram;
}
Part requirements;
public String getStudentid() {
	return studentid;
}
public void setStudentid(String studentid) {
	this.studentid = studentid;
}
public Part getRequirements() {
	return requirements;
}
public void setRequirements(Part requirements) {
	this.requirements = requirements;
}

 public void submitRequirements(Connection conn) throws IOException {
	 try {
		PreparedStatement ps = conn.prepareStatement("INSERT INTO shifters_requirements (shifter_id, requirementsimage) VALUES (?, ?)");
		ps.setString(1, studentid);
	   ps.setBinaryStream(2, requirements.getInputStream(), (int) requirements.getSize());	
		ps.executeUpdate();
	 }
	 catch(SQLException e) {
		 e.printStackTrace();
		 
	 }
 }
 public void updateCourse(Connection conn) {
	 try {
	 PreparedStatement ps1 = conn.prepareStatement("UPDATE student_shifter SET newcourse = ?, newprogram = ? WHERE studentid = ?");
		ps1.setString(1, newcourse);
		ps1.setString(2, newprogram);
		ps1.setString(3, studentid);
		ps1.executeUpdate(); 
	 }
	 catch(SQLException e) {
		 e.printStackTrace();
	 }
 }
 public void step1Status(Connection conn) {
	 try {
		 PreparedStatement ps1 = conn.prepareStatement("INSERT INTO shifters_status (shifter_id) VALUES (?)");
			ps1.setString(1, studentid);
			ps1.executeUpdate(); 
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
 }
 public void doStep1(Connection conn) throws IOException {
	 submitRequirements(conn);
	 updateCourse(conn);
	 step1Status(conn);
 }
	 
}
