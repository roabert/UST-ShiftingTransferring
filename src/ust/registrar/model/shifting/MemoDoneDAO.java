package ust.registrar.model.shifting;
import java.sql.*;
import DatabaseHandler.DatabaseSQLs;

public class MemoDoneDAO implements DatabaseSQLs {

	public String studentid, dean, secgen, registrar;

	public String getStudentid() {
		return studentid;
	}

	public String getDean() {
		return dean;
	}

	public void setDean(String dean) {
		this.dean = dean;
	}

	public String getSecgen() {
		return secgen;
	}

	public void setSecgen(String secgen) {
		this.secgen = secgen;
	}

	public String getRegistrar() {
		return registrar;
	}

	public void setRegistrar(String registrar) {
		this.registrar = registrar;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}
	public void memoDoneStatus(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM shifters_indorsement WHERE shifter_id = ? AND (secgen_indorsed = 'In-progress' OR registrar_indorsed = 'In-progress')");
			ps.setString(1, studentid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.next()) {
				 studentid = rs.getString("shifter_id");
				 dean =  rs.getString("dean_indorsed");
				 secgen = rs.getString("secgen_indorsed");
				 registrar = rs.getString("registrar_indorsed");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
