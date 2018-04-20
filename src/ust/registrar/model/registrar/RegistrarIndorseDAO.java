package ust.registrar.model.registrar;
import java.sql.*;

import DatabaseHandler.DatabaseSQLs;
public class RegistrarIndorseDAO implements DatabaseSQLs{

	public String studentid, registrar, Endorsement;
	public String event, description;

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

	public String getEndorsement() {
		return Endorsement;
	}

	public void setEndorsement(String Endorsement) {
		this.Endorsement = Endorsement;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getRegistrar() {
		return registrar;
	}

	public void setRegistrar(String registrar) {
		this.registrar = registrar;
	}
	
	
	public void registrarIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET registrar_id = ?, registrar_indorsed = 'Approved', registrar_indorsement = ? ,secgen_indorsed = 'In-progress', registrar_date_indorsed = NOW() WHERE shifter_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, Endorsement);
			ps.setString(3, studentid);
			
			ps.executeUpdate(); ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void registrarNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET registrar_id = ?, registrar_indorsed = 'Disapproved', registrar_indorsement = ?, registrar_date_indorsed = NOW() WHERE shifter_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, Endorsement);
			ps.setString(3, studentid);
			ps.executeUpdate(); ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertLogs(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement(logs);
			ps.setString(1, registrar);
			ps.setString(2, event);
			ps.setString(3, description);
			ps.executeUpdate(); ps.close(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
