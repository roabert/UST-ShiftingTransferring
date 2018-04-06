package ust.registrar.model.registrar;
import java.sql.*;
public class RegistrarIndorseDAO {

	public String studentid, registrar, Endorsement;

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
			
			ps.executeUpdate();
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
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
