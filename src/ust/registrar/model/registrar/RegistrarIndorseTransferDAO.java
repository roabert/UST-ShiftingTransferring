package ust.registrar.model.registrar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistrarIndorseTransferDAO {
	public String transferid, registrar, Endorsement;

	public String getEndorsement() {
		return Endorsement;
	}

	public void setEndorsement(String Endorsement) {
		this.Endorsement = Endorsement;
	}

	public String getTransferid() {
		return transferid;
	}

	public void setTransferid(String transferid) {
		this.transferid = transferid;
	}

	public String getRegistrar() {
		return registrar;
	}

	public void setRegistrar(String registrar) {
		this.registrar = registrar;
	}
	
	
	public void registrarIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE transferees_indorsement SET registrar_id = ?, registrar_indorsed = 'Approved', registrar_Endorsement = ? ,secgen_indorsed = 'In-progress' WHERE transferee_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, Endorsement);
			ps.setString(3, transferid);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void registrarNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE transferees_indorsement SET registrar_id = ?, registrar_indorsed = 'Disapproved', reigstrar_Endorsement = ? WHERE transferee_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, Endorsement);
			ps.setString(3, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
