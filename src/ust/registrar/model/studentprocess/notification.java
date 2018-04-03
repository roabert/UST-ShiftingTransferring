package ust.registrar.model.studentprocess;
import java.util.*;
import java.io.IOException;
import java.sql.*;

public class notification {
	
	public String deanCollege;
	
	public void setDeanCollege(Connection conn, String deanID){
		String returnsql = "SELECT * FROM dean WHERE userid = ?";
		try{
	    	PreparedStatement pst = conn.prepareStatement(returnsql);
	    	pst.setString(1, deanID);
	    	ResultSet getDeanCollege = pst.executeQuery();
	    	if(getDeanCollege.next()){
	    		deanCollege = getDeanCollege.getString("college");
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	public int getDeanShiftTransactions(Connection conn){
		int count = 0;
		String getStudents = "SELECT * FROM student_shifter WHERE newcourse = ?";
		String getNotifs = "SELECT * FROM shifters_status WHERE dean_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, deanCollege);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		PreparedStatement pst2 = conn.prepareStatement(getNotifs);
	    		ResultSet getDNotifs = pst2.executeQuery();
	    		while(getDNotifs.next()){
	    			if(getDStudents.getString("studentid").equals(getDNotifs.getString("shifter_id"))){
	    				count++;
	    			}
	    		}
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getDeanTransferTransactions(Connection conn){
		int count = 0;
		String getStudents = "SELECT * FROM student_transfer WHERE newcourse = ?";
		String getNotifs = "SELECT * FROM transferees_status WHERE dean_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, deanCollege);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		PreparedStatement pst2 = conn.prepareStatement(getNotifs);
	    		ResultSet getDNotifs = pst2.executeQuery();
	    		while(getDNotifs.next()){
	    			if(getDStudents.getString("userid").equals(getDNotifs.getString("transferee_id"))){
	    				count++;
	    			}
	    		}
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getDeanShiftScores(Connection conn){
		int count = 0;
		String getStudents = "SELECT * FROM student_shifter WHERE newcourse = ?";
		String sample = "SELECT * FROM shifters_scores INNER JOIN student_shifter on shifter_id = student_shifter.studentid INNER JOIN dean on student_shifter.newcourse = dean.college WHERE dean_reviewed = 'In-progress' AND final_score is not NULL AND dean.userid = ?";
		String getNotifs = "SELECT * FROM shifters_status WHERE dean_reviewed = 'In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, deanCollege);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		PreparedStatement pst2 = conn.prepareStatement(getNotifs);
	    		ResultSet getDNotifs = pst2.executeQuery();
	    		while(getDNotifs.next()){
	    			if(getDStudents.getString("studentid").equals(getDNotifs.getString("shifter_id"))){
	    				count++;
	    			}
	    		}
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getDeanTransferScores(Connection conn){
		int count = 0;
		String getStudents = "SELECT * FROM student_transfer WHERE newcourse = ?";
		String getNotifs = "SELECT * FROM transferees_status WHERE dean_reviewed = 'In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, deanCollege);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		PreparedStatement pst2 = conn.prepareStatement(getNotifs);
	    		ResultSet getDNotifs = pst2.executeQuery();
	    		while(getDNotifs.next()){
	    			if(getDStudents.getString("userid").equals(getDNotifs.getString("transferee_id"))){
	    				count++;
	    			}
	    		}
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getOSATransactions (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_status WHERE osa_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}	
	
	public int getSecGenShiftTransactions (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_status WHERE secgen_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getSecGenTransferTransactions (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_status WHERE secgen_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}	
	
	public int getOFADShiftTransactions (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_status WHERE ofad_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getOFADTransferTransactions (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_status WHERE ofad_verified ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getOFADShiftForSched (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_exams INNER JOIN student_shifter on shifters_exams.shifter_id = student_shifter.studentid WHERE exam_schedule_date is NULL";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}

	public int getOFADTransferForSched (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_exams INNER JOIN student_transfer on transferees_exams.transferee_id = student_transfer.userid WHERE exam_schedule_date is NULL";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}	
	
	public int getOFADShiftExams (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_scores INNER JOIN student_shifter on shifter_id = student_shifter.studentid WHERE shifter_id is not NULL AND userid is NULL";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getOFADTransferExams (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_scores INNER JOIN student_transfer on transferee_id = student_transfer.userid WHERE transferee_id is not NULL AND ofad_id is NULL";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}	
	
	public int getRegistrarShiftEndorsement (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_indorsement WHERE registrar_indorsed ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getRegistrarTransferEndorsement (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_indorsement WHERE registrar_indorsed ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}	
	
	public int getSecGenShiftEndorsement (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM shifters_indorsement WHERE secgen_indorsed ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}
	
	public int getSecGenTransferEndorsement (Connection conn){
		int count = 0;
		String getNotifs = "SELECT * FROM transferees_indorsement WHERE secgen_indorsed ='In-progress'";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getNotifs);
	    	ResultSet getDStudents = pst.executeQuery();
	    	while(getDStudents.next()){
	    		count++;
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return count;
	}		
}
