package DatabaseHandler;

public interface DatabaseSQLs {
	String shiftRegisterSQL = "INSERT INTO student_shifter (lastname, firstname, middlei, gender, typeofstudent, birthday, studentid"
	 		+ ", oldcourse, oldprogram, idpicture) "
	 		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	 String transferRegisterSQL = "INSERT INTO student_transfer (userid, lastname, firstname, middlei, gender, typeofstudent, birthday, oldschool"
	 		+ ", oldcourse, oldprogram, newcourse, newprogram) "
	 		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 String loginsql = "SELECT userid, password, roles FROM users WHERE userid = ? AND password = ? "
				+ "UNION"
				+ " SELECT studentid, birthday, typeofstudent FROM student_shifter WHERE studentid = ? AND birthday = ?"
				+ "UNION"
				+ " SELECT id, birthday, typeofstudent FROM student_transfer WHERE id = ? AND birthday = ?";
	 String loginuserSQL = "SELECT userid, password, type FROM useraccounts WHERE userid = ? AND password = ?";
	 
	 String insertStudentUser =  "INSERT INTO useraccounts (userid, password, type) VALUES (?, ?, ?)";

	 // Dean approve student
	 String Dean_approveStudent = "UPDATE shifters_status SET dean_id = ?, dean_verified = ? WHERE shifter_id = ?";
	// SecGen approve student
	 String OSG_approveStudent = "UPDATE shifters_status SET secgen_id = ?, secgen_verified = ? WHERE shifter_id = ?";
	 
	 //Admin Modify Users (for admin)
	 String Admin_editUsersSQL = "UPDATE admins SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
	//Admin Modify Users (for registrar)
		 String Admin_Registrar_editUsersSQL = "UPDATE registrar SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
		//Admin Modify Users (for secgen)
		 String Admin_OSG_editUsersSQL = "UPDATE secgen SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
		//Admin Modify Users (for admin)
		 String Admin_Dean_editUsersSQL = "UPDATE dean SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
		//Admin Modify Users (for osa)
		 String Admin_OSA_editUsersSQL = "UPDATE osa SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
		//Admin Modify Users (for ofad)
		 String Admin_Ofad_editUsersSQL = "UPDATE ofad SET last_name = ?, first_name = ?, middle_name = ? WHERE userid = ?";
		 
		 //Admin create users
		 String InsertUsersSQL = "INSERT INTO useraccounts (userid, password, type) VALUES (?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_InsertUsersSQL = "INSERT INTO admins (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Registrar_InsertUsersSQL = "INSERT INTO registrar (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_OSG_InsertUsersSQL = "INSERT INTO secgen (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Dean_InsertUsersSQL = "INSERT INTO dean (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_OSA_InsertUsersSQL = "INSERT INTO osa (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Ofad_InsertUsersSQL = "INSERT INTO ofad (userid, last_name, first_name, middle_name, gender, type) VALUES (?, ?, ?, ?, ?, ?)";
		 
}
