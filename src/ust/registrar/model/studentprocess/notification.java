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
	
	public int getDeanShiftScores(Connection conn){
		int count = 0;
		String getStudents = "SELECT * FROM student_shifter WHERE newcourse = ?";
		String getNotifs = "SELECT * FROM shifters_status WHERE dean_reviewed ='In-progress'";
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
		String getNotifs = "SELECT * FROM transferees_status WHERE dean_reviewed ='In-progress'";
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
		String getNotifs = "SELECT * FROM shifters_exams WHERE date IS null OR date = ''";
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
		String getNotifs = "SELECT * FROM transferees_exams WHERE date IS null OR date = ''";
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
		String getNotifs = "SELECT * FROM shifters_scores WHERE dean_reviewed = '' OR dean_reviewed = null";
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
		String getNotifs = "SELECT * FROM transferees_scores WHERE dean_reviewed = '' OR dean_reviewed = null";
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
	
	public int getRegistrarShiftIndorsement (Connection conn){
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
	
	public int getRegistrarTransferIndorsement (Connection conn){
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
	
	public int getSecGenShiftIndorsement (Connection conn){
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
	
	public int getSecGenTransferIndorsement (Connection conn){
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
