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
	 
}
