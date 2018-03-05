package ust.registrar.model.studentprocess;

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

private Part requirements;

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

 public void submitRequirementsShifter(Connection conn) throws IOException {
	 try {
		PreparedStatement ps = conn.prepareStatement("INSERT INTO `shifters_requirements` (`id`, `shifter_id`, `uploaded_file`) VALUES (NULL, ?, ?)");
		ps.setString(1, studentid);
		ps.setBinaryStream(2, requirements.getInputStream(), (int) requirements.getSize());
		ps.executeUpdate();
	 }
	 catch(SQLException e) {
		 e.printStackTrace();
		 
	 }
 }
 public void submitRequirementsTransfer(Connection conn) throws IOException {
	 try {
		PreparedStatement ps = conn.prepareStatement("INSERT INTO `transferees_requirements` (`id`, `transferee_id`, `uploaded_file`) VALUES (NULL, ?, ?)");
		ps.setString(1, studentid);
		ps.setBinaryStream(2, requirements.getInputStream(), (int) requirements.getSize());
		ps.executeUpdate();
	 }
	 catch(SQLException e) {
		 e.printStackTrace();
		 
	 }
 }
 public void updateCourseShifter(Connection conn) {
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
 public void step1ShifterStatus(Connection conn) {
	 try {
		 PreparedStatement ps1 = conn.prepareStatement("INSERT INTO shifters_status (shifter_id, dean_verified) VALUES (?, ?)");
			ps1.setString(1, studentid);
			ps1.setString(2, "In-progress");
			ps1.executeUpdate(); 
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
 }
 public void doStep1Shifter(Connection conn) throws IOException {
	 updateCourseShifter(conn);
	 step1ShifterStatus(conn);
 }
 
 
 
 
 public void updateCourseTransfer(Connection conn) {
	 try {
	 PreparedStatement ps1 = conn.prepareStatement("UPDATE student_transfer SET newcourse = ?, newprogram = ? WHERE userid = ?");
		ps1.setString(1, newcourse);
		ps1.setString(2, newprogram);
		ps1.setString(3, studentid);
		ps1.executeUpdate(); 
	 }
	 catch(SQLException e) {
		 e.printStackTrace();
	 }
 }
 public void step1TransferStatus(Connection conn) {
	 try {
		 PreparedStatement ps1 = conn.prepareStatement("INSERT INTO transferees_status (transferee_id, osa_verified) VALUES (?, ?)");
			ps1.setString(1, studentid);
			ps1.setString(2, "In-progress");
			ps1.executeUpdate(); 
		 }
		 catch(SQLException e) {
			 e.printStackTrace();
		 }
 }
 public void doStep1Transfer(Connection conn) throws IOException {
	 updateCourseTransfer(conn);
	 step1TransferStatus(conn);
 }
	 
}
