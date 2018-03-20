package ust.registrar.model.registrar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegistrarIndorseTransferDAO {
	public String transferid, registrar, indorsement;

	public String getIndorsement() {
		return indorsement;
	}

	public void setIndorsement(String indorsement) {
		this.indorsement = indorsement;
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
			PreparedStatement ps = conn.prepareStatement("UPDATE transferees_indorsement SET registrar_id = ?, registrar_indorsed = 'Approved', registrar_indorsement = ? ,secgen_indorsed = 'In-progress' WHERE transferee_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, indorsement);
			ps.setString(3, transferid);
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void registrarNotIndorsed(Connection conn) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE transferees_indorsement SET registrar_id = ?, registrar_indorsed = 'Disapproved', reigstrar_indorsement = ? WHERE transferee_id = ?");
			ps.setString(1, registrar);
			ps.setString(2, indorsement);
			ps.setString(3, transferid);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
