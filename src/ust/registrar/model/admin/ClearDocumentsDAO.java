package ust.registrar.model.admin;

import java.sql.*;

public class ClearDocumentsDAO {
	
	public String checkStatusShifter(Connection conn, String id) {
		String status = "";
		String getStudents = "SELECT shifter_shifting_approved FROM shifters_indorsement WHERE shifter_id = ?";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, id);
	    	ResultSet getDStudents = pst.executeQuery();
	    	if(getDStudents.next()){
	    		status = "Approved";
	    	}
	    	else{
	    		status = "NA";
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		return status;
		
	}

	
	public String checkStatusTransfer(Connection conn, String id) {
		String status = "";
		String getStudents = "SELECT transfer_transferring_approved FROM transferees_indorsement WHERE transferee_id = ?";
		try{
	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	pst.setString(1, id);
	    	ResultSet getDStudents = pst.executeQuery();
	    	if(getDStudents.next()){
	    		status = "Approved";
	    	}
	    	else{
	    		status = "NA";
	    	}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		return status;
		
	}
		
	public void clearTransferDocus(Connection conn, String id, String status) {
		String getStudents = "DELETE FROM transferees_requirements  WHERE transferee_id = ?";
		try{
	    		if(status.equals("Approved")){
	    	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	    	pst.setString(1, id);
	    	    	ResultSet getDStudents = pst.executeQuery();
	    			if(getDStudents.next()){
	    				
	    			}
	    		}else{
	    			
	    		}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
	}
	
	public void clearShifterDocus(Connection conn, String id, String status) {
		String getStudents = "DELETE FROM shifters_requirements  WHERE shifter_id = ?";
		try{
	    		if(status.equals("Approved")){
	    	    	PreparedStatement pst = conn.prepareStatement(getStudents);
	    	    	pst.setString(1, id);
	    	    	ResultSet getDStudents = pst.executeQuery();
	    			if(getDStudents.next()){
	    				
	    			}
	    		}else{
	    			
	    		}
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	
}

}
