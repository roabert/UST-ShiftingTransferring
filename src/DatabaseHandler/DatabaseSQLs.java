package DatabaseHandler;

public interface DatabaseSQLs {
	String shiftRegisterSQL = "INSERT INTO student_shifter (lastname, firstname, middlei, gender, typeofstudent, birthday, studentid"
	 		+ ", oldcourse, oldprogram, idpicture) "
	 		+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	 String transferRegisterSQL = "INSERT INTO student_transfer (userid, lastname, firstname, middlei, email, gender, typeofstudent, birthday, oldschool, oldcourse, oldprogram, newcourse, newprogram, idpicture) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ?)";
	 
	 String loginsql = "SELECT userid, password, roles FROM users WHERE userid = ? AND password = ? "
				+ "UNION"
				+ " SELECT studentid, birthday, typeofstudent FROM student_shifter WHERE studentid = ? AND birthday = ?"
				+ "UNION"
				+ " SELECT id, birthday, typeofstudent FROM student_transfer WHERE id = ? AND birthday = ?";
	 String loginuserSQL = "SELECT userid, password, type FROM useraccounts WHERE userid = ? AND password = ?";
	 
	 String insertStudentUser =  "INSERT INTO useraccounts (userid, password, email, type) VALUES (?, ?, ?, ?)";

	 // Dean approve student
	 String Dean_approveStudent = "UPDATE shifters_status SET dean_id = ?, dean_verified = ?, secgen_verified = 'In-progress' WHERE shifter_id = ?";
	 String Dean_approveTransfer = "UPDATE transferees_status SET dean_id = ?, dean_verified = ?, dean_date_verified = NOW(), secgen_verified = 'In-progress' WHERE transferee_id = ?";
	 String Dean_disapproveTransfer = "UPDATE transferees_status SET dean_id = ?, dean_verified = ?, dean_remarks = ?, dean_date_verified = NOW() WHERE transferee_id = ?";
	 // Dean disapprove student
	 String Dean_disapproveStudent = "UPDATE shifters_status SET dean_id = ?, dean_verified = ? WHERE shifter_id = ?";
	//Dean pass or fail the student DeanVerifyScore
	 String Dean_passfailShifter = "UPDATE shifters_status SET dean_id_reviewed = ?, dean_reviewed = ?, dean_date_reviewed = NOW() WHERE shifter_id = ?";
	 String Dean_passfailScoreShifter = "UPDATE shifters_scores SET dean_reviewed = ? WHERE shifter_id = ?";
	 ///Dean pass or fail student transfer DeanVerifyScoreTransfer
	 String Dean_passfailTransfer = "UPDATE transferees_status SET dean_id_reviewed = ?, dean_reviewed = ?, dean_date_reviewed = NOW() WHERE transferee_id = ?";
	 String Dean_passfailScoreTransfer = "UPDATE transferees_scores SET dean_reviewed = ? WHERE transferee_id = ?";
	 
	 // SecGen approve student OSG_verifyprocess
	 String OSG_approveStudent = "UPDATE shifters_status SET secgen_id = ?, secgen_verified = ?, secgen_date_verified = NOW(), ofad_verified = 'In-progress' WHERE shifter_id = ?";
	 String OSG_disapproveStudent = "UPDATE shifters_status SET secgen_id = ?, secgen_verified = ?, secgen_remarks = ?, secgen_date_verified = NOW() WHERE shifter_id = ?";
	 
	 //SecGen approve transfer OSG_verifyTransfer
	 String OSG_approveTransfer = "UPDATE transferees_status SET secgen_id = ?, secgen_verified = ?, secgen_date_verified = NOW(), ofad_verified = 'In-progress' WHERE transferee_id = ?";
	 String OSG_disapproveTransfer = "UPDATE transferees_status SET secgen_id = ?, secgen_verified = ?, secgen_remarks = ?, secgen_date_verified = NOW() WHERE transferee_id = ?";
	
	 //OFAD approve shifter Ofad_verifyprocess
	 String Ofad_approveStudent = "UPDATE shifters_status SET ofad_id = ?, ofad_verified = ?, ofad_date_verified = NOW() WHERE shifter_id = ?";
	 String Ofad_disapproveStudent = "UPDATE shifters_status SET ofad_id = ?, ofad_verified = ?, ofad_remarks = ?, ofad_date_verified = NOW() WHERE shifter_id = ?";
	 String Ofad_studentForExam = "INSERT INTO shifters_exams (shifter_id) VALUES (?)";
	 
	 //OFAD exam schedss
	 //for shifter SetExamScheduleDAO
	 String Ofad_examsched = "INSERT INTO exam_schedules_shifters (shifter_id, date, start_time, end_time, venue, remarks, exam_date_added) VALUES (?, ?, ?, ?, ?, ?, NOW())";
	String Ofad_setexam = "UPDATE shifters_exams SET exam_schedule_date = ?, exam_date_added = NOW() WHERE shifter_id = ?";
	 String Ofad_setEncode = "INSERT INTO shifters_scores (shifter_id) VALUES (?)";
	//for transferee
	
	 String Ofad_setvenue = "UPDATE venue SET start_time = ?, end_time = ? WHERE venue = ?";
	 String Ofad_getvenue = "SELECT * FROM venue WHERE venue = ?";	

	 //OFAD OFAD_verifyTransfer
	 String Ofad_approveTransfer = "UPDATE transferees_status SET ofad_id = ?, ofad_verified = ?, ofad_date_verified = NOW() WHERE transferee_id = ?";
	 String Ofad_disapproveTransfer = "UPDATE transferees_status SET ofad_id = ?, ofad_verified = ?, ofad_remarks = ?, ofad_date_verified = NOW() WHERE transferee_id = ?";
	 String Ofad_transferForExam = "INSERT INTO transferees_exams (transferee_id) VALUES (?)";
	 
	 //OFAD approve scheduling for SetExamScheduleDAO
	 String Ofad_examschedTransfer = "INSERT INTO exam_schedules_transferees (transferee_id, date, start_time, end_time, venue, remarks, exam_date_added) VALUES (?, ?, ?, ?, ?, ?, NOW())";
	 String Ofad_setexamTransfer = "UPDATE transferees_exams SET exam_schedule_date = ?, exam_date_added = NOW() WHERE transferee_id = ?";
	
	 String Ofad_setTransferEncode = "INSERT INTO transferees_scores (transferee_id) VALUES (?)";
	 // OSA approve transferee
	 String OSA_approveStudent = "UPDATE transferees_status SET osa_id = ?, osa_verified = ?, osa_date_verified = NOW(), dean_verified = 'In-progress' WHERE transferee_id = ?";
	 String OSA_disapproveStudent = "UPDATE transferees_status SET osa_id = ?, osa_verified = ?, osa_remarks = ?, osa_date_verified = NOW() WHERE transferee_id = ?";
	 
	 //OFAD encode scores shifter EncodeScoreShifter servlet
	 
	 String EncodeScores_Shifter = "UPDATE shifters_scores SET userid = ?, math_score = ?, science_score = ?, english_score = ?, iq_score = ?, final_score = ?, dean_reviewed = 'In-progress', date_encoded = NOW() WHERE shifter_id = ?";
	 String ExamTaken_Shifter = "UPDATE shifters_status SET exam_taken = 'Approved', dean_reviewed = 'In-progress' WHERE shifter_id = ?";
	 // OFAD encode scores transfer EncodeScoreTransfer servlet
	 String EncodeScores_Transfer = "UPDATE transferees_scores SET ofad_id = ?, math_score = ?, science_score = ?, english_score = ?, iq_score = ?, final_score = ?, dean_reviewed = 'In-progress', date_encoded = NOW() WHERE transferee_id = ?";
	 String ExamTaken_Transfer = "UPDATE transferees_status SET exam_taken = 'Approved', dean_reviewed = 'In-progress' WHERE transferee_id = ?";
	 
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
		 String InsertUsersSQL = "INSERT INTO useraccounts (userid, password, email, type) VALUES (?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_InsertUsersSQL = "INSERT INTO admins (userid, last_name, first_name, middle_name, email, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Registrar_InsertUsersSQL = "INSERT INTO registrar (userid, last_name, first_name, middle_name, email, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_OSG_InsertUsersSQL = "INSERT INTO secgen (userid, last_name, first_name, middle_name, email, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Dean_InsertUsersSQL = "INSERT INTO dean (userid, last_name, first_name, middle_name, email, college, type) VALUES (?, ?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_OSA_InsertUsersSQL = "INSERT INTO osa (userid, last_name, first_name, middle_name, email, type) VALUES (?, ?, ?, ?, ?, ?)";
		 // Admin Create user details (for admin)
		 String Admin_Ofad_InsertUsersSQL = "INSERT INTO ofad (userid, last_name, first_name, middle_name, email, type) VALUES (?, ?, ?, ?, ?, ?)";
		 
		 // LETTER OF Endorsement SHIFTER
		 String MemoForm_Shifter = "INSERT INTO shifters_indorsement (shifter_id) VALUES (?)";
		 String removeExamSchedShifter = "UPDATE shifters_exams SET exam_taken = 'Approved' WHERE shifter_id = ?";
		 //LETTER OF Endorsement TRANSFER
		 String MemoForm_Tranfer = "INSERT INTO transferees_indorsement (transferee_id) VALUES (?)";
		 String removeExamSchedTransfer = "UPDATE transferees_exams SET exam_taken = 'Approved' WHERE transferee_id = ?";
		 
		 
		 // FOR TRACKER ShiftingTrackerDAO
		 String encodeExamShifter  = "SELECT * FROM shifters_scores WHERE shifter_id = ?";
		 
		 // Step 3 MEMO SHIFTER
		 String generateMemoShifter = "INSERT INTO shifters_memo (shifter_id, studentid, date, full_name, newcourse, semester_start, firstyear_start, secondyear_start, oldcourse, first_term, firstterm_1year, firstterm_2year, specialterm_1, second_term, secondterm_1year, secondterm_2year, specialterm_2, third_term, thirdterm_1year, thirdterm_2year, specialterm_3, fourth_term, fourthterm_1year, fourthterm_2year, specialterm_4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		// Registrar memo approval
		 String RegistrarStatusShifter = "UPDATE shifters_indorsement SET registrar_indorsed = 'In-progress', memo_filledup_date = NOW() WHERE shifter_id = ?";
		 // Secgen memo approval
		 String OSGapproveShifter = "UPDATE shifters_indorsement SET secgen_id = ?, secgen_indorsed = 'Approved', secgen_remarks = ?, shifter_shifting_approved = 'Approved', secgen_date_indorsed = NOW() WHERE shifter_id = ?";
		 String approveShiftingFinal = "UPDATE student_shifter SET shifting_approved = 'Approved' WHERE studentid = ?";
		 // Secgen memo disapproval
		 String OSGdisapproveShifter = "UPDATE shifters_indorsement SET secgen_id = ?, secgen_indorsed = 'Disapproved', secgen_remarks = ?, secgen_date_indorsed = NOW()  WHERE shifter_id = ?";
		 
		 // Step 3 MEMO TRANSFER
		 String generateMemoTransfer = "INSERT INTO transferees_memo (transferee_id, date, full_name, newcourse, semester_start, firstyear_start, secondyear_start, oldcourse, first_term, firstterm_1year, firstterm_2year, specialterm_1, second_term, secondterm_1year, secondterm_2year, specialterm_2, third_term, thirdterm_1year, thirdterm_2year, specialterm_3, fourth_term, fourthterm_1year, fourthterm_2year, specialterm_4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 // Registrar memo approval
		 String RegistrarStatusTransfer = "UPDATE transferees_indorsement SET registrar_indorsed = 'In-progress', memo_filledup_date = NOW() WHERE transferee_id = ?";
		 //Secgen memo approval
		 String OSGapproveTransfer = "UPDATE transferees_indorsement SET secgen_id = ?, secgen_indorsed = 'Approved', secgen_remarks = ?, transfer_transferring_approved = 'Approved', secgen_date_indorsed = NOW() WHERE transferee_id = ?";
		 String approveTransferFinal = "UPDATE student_transfer SET transferring_approved = 'Approved' WHERE userid = ?";
		 //SEcgen memo disapproval
		 String OSGdisapproveTransfer = "UPDATE transferees_indorsement SET secgen_id = ?, secgen_indorsed = 'Disapproved', secgen_remarks = ?, secgen_date_indorsed = NOW()  WHERE transferee_id = ?";
}
