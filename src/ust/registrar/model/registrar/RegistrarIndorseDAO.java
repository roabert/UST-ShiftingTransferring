package ust.registrar.model.registrar;
import java.sql.*;
public class RegistrarIndorseDAO {

	public String studentid, registrar, indorsement;

	public String getIndorsement() {
		return indorsement;
	}

	public void setIndorsement(String indorsement) {
		this.indorsement = indorsement;
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
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET registrar_id = ?, registrar_indorsed = 'Approved', registrar_indorsement = ? ,secgen_indorsed = 'In-progress' WHERE shifter_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, indorsement);
			ps.setString(3, studentid);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void registrarNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE shifters_indorsement SET registrar_id = ?, registrar_indorsed = 'Disapproved', reigstrar_indorsement = ? WHERE shifter_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, indorsement);
			ps.setString(3, studentid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
